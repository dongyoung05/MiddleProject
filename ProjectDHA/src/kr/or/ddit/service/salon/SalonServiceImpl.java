package kr.or.ddit.service.salon;

import java.util.List;

import kr.or.ddit.dao.salon.ISalonDao;
import kr.or.ddit.dao.salon.SalonDaoImpl;
import kr.or.ddit.vo.SalonVo;

public class SalonServiceImpl implements ISalonService{

	private static ISalonService service;
	private ISalonDao dao;
	
	private SalonServiceImpl() {
		dao = SalonDaoImpl.getInstance();
	}
	
	public static ISalonService getInstance() {
		if(service == null) service = new SalonServiceImpl();
		return service;
	}

	@Override
	public SalonVo getSalon(String salon_no) {
		return dao.getSalon(salon_no);
	}

	@Override
	public List<SalonVo> getSalonList() {
		return dao.getSalonList();
	}

	@Override
	public List<SalonVo> getSalonWeight(String salon_weight) {
		return dao.getSalonWeight(salon_weight);
	}

	@Override
	public int insertSalon(SalonVo vo) {
		// TODO Auto-generated method stub
		return dao.insertSalon(vo);
	}

	@Override
	public int deleteSalon(String no) {
		// TODO Auto-generated method stub
		return dao.deleteSalon(no);
	}

	@Override
	public int updateSalon(SalonVo vo) {
		// TODO Auto-generated method stub
		return dao.updateSalon(vo);
	}

	
}













