package kr.or.ddit.service.reserve;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.reserve.IReserveDao;
import kr.or.ddit.dao.reserve.ReserveDaoImpl;
import kr.or.ddit.vo.ReserveVO;

public class ReserveServiceImpl implements IReserveService{
	private static IReserveService service;
	
	private IReserveDao dao;
	
	private ReserveServiceImpl() {
		dao = ReserveDaoImpl.getInstance();
	}
	
	public static IReserveService getInstance() {
		if(service == null) service = new ReserveServiceImpl();
		return service;
	}

	@Override
	public List<ReserveVO> getReserveList() {
		return dao.getReserveList();
	}

	@Override
	public List<ReserveVO> getSalonReserveList() {
		return dao.getSalonReserveList();
	}

	@Override
	public int chkSalonReserveList(String date) {
		return dao.chkSalonReserveList(date);
	}

	@Override
	public int insertSalonReserve(ReserveVO reserveVo) {
		return dao.insertSalonReserve(reserveVo);
	}

	@Override
	public int insertRoomReserve(ReserveVO reserveVo) {
		return dao.insertRoomReserve(reserveVo);
	}

	@Override
	public String getRoomReserveNo(ReserveVO reserveVo) {
		return dao.getRoomReserveNo(reserveVo);
	}

	@Override
	public String getSalonReserveNo(ReserveVO reserveVo) {
		return dao.getSalonReserveNo(reserveVo);
	}

	@Override
	public int cancelReserve(String no) {
		return dao.cancelReserve(no);
	}

	
	
	@Override
	public List<HashMap<String, Object>> getMyReserve(String mem_id, String time, String type) {
		
		if("room".equals(type)) {
			if("new".equals(time)) {
				return dao.getMyNewRoomReserve(mem_id);
			} else {
				return dao.getMyPastRoomReserve(mem_id);
			}
		} 
		else{
			if("new".equals(time)) {
				return dao.getMyNewSalonReserve(mem_id);
			} else {
				return dao.getMyPastSalonReserve(mem_id);
			}
		} 
	}

}













