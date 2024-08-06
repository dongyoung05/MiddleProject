package kr.or.ddit.dao.room;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.RoomVo;

public class RoomDaoImpl implements IRoomDao{
	
	private static IRoomDao dao;
	
	private RoomDaoImpl() { }
	
	public static IRoomDao getInstance() {
		if(dao == null) dao = new RoomDaoImpl();
		
		return dao;
	}

	@Override
	public RoomVo getRoom(String room_no) {
		SqlSession session = null;
		RoomVo room = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			room = session.selectOne("Room.getRoom", room_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return room;
	}

	@Override
	public List<RoomVo> getRoomList() {
		SqlSession session = null;
		List<RoomVo> roomList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			roomList = session.selectList("Room.getRoomList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return roomList;
	}

	@Override
	public List<RoomVo> chkRoomReserve(HashMap<String, String> param) {
		SqlSession session = null;
		List<RoomVo> roomList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			roomList = session.selectList("Room.chkRoomReserve", param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return roomList;
	}

	@Override
	public String getTimeBetweenInOut(HashMap<String, String> param) {
		SqlSession session = null;
		String diff = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			diff = session.selectOne("Room.getTimeBetweenInOut", param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return diff;
	}

	@Override
	public int deleteRoom(String no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("Room.deleteRoom", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}

	@Override
	public int insertRoom(RoomVo vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Room.insertRoom", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}

	@Override
	public int updateRoom(RoomVo vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("Room.updateRoom", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}
	
	
}
