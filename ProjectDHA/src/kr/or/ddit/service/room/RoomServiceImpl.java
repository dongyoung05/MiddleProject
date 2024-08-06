package kr.or.ddit.service.room;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dao.room.IRoomDao;
import kr.or.ddit.dao.room.RoomDaoImpl;
import kr.or.ddit.vo.RoomVo;

public class RoomServiceImpl implements IRoomService{
	private IRoomDao dao;
	
	private static IRoomService service;
	
	private RoomServiceImpl() {
		dao = RoomDaoImpl.getInstance();
	}
	
	public static IRoomService getInstance() {
		if(service == null) service = new RoomServiceImpl();
		
		return service;
	}

	@Override
	public RoomVo getRoom(String room_no) {
		return dao.getRoom(room_no);
	}

	@Override
	public List<RoomVo> getRoomList() {
		return dao.getRoomList();
	}

	@Override
	public List<RoomVo> chkRoomReserve(HashMap<String, String> param) {
		return dao.chkRoomReserve(param);
	}

	@Override
	public String getTimeBetweenInOut(HashMap<String, String> param) {
		return dao.getTimeBetweenInOut(param);
	}

	@Override
	public int deleteRoom(String no) {
		return dao.deleteRoom(no);
	}

	@Override
	public int insertRoom(RoomVo vo) {
		// TODO Auto-generated method stub
		return dao.insertRoom(vo);
	}

	@Override
	public int updateRoom(RoomVo vo) {
		// TODO Auto-generated method stub
		return dao.updateRoom(vo);
	}
	
}
