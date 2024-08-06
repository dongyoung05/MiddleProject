package kr.or.ddit.dao.reserve;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.ReserveVO;

public class ReserveDaoImpl implements IReserveDao{
	private static IReserveDao dao;
	
	private ReserveDaoImpl() {}
	
	public static IReserveDao getInstance() {
		if(dao == null) dao = new ReserveDaoImpl();
		return dao;
	}

	@Override
	public List<ReserveVO> getReserveList() {
		SqlSession session = null;
		List<ReserveVO> reList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			reList = session.selectList("reserve.getReserveList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return reList;
	}

	@Override
	public List<ReserveVO> getSalonReserveList() {
		SqlSession session = null;
		List<ReserveVO> reList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			reList = session.selectList("reserve.getSalonReserveList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return reList;
	}

	@Override
	public int chkSalonReserveList(String date) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("reserve.chkSalonReserveList", date);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertSalonReserve(ReserveVO reserveVo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("reserve.insertSalonReserve", reserveVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertRoomReserve(ReserveVO reserveVo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("reserve.insertRoomReserve", reserveVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public String getRoomReserveNo(ReserveVO reserveVo) {
		SqlSession session = null;
		String no = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			no = session.selectOne("reserve.getRoomReserveNo", reserveVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return no;
	}

	@Override
	public String getSalonReserveNo(ReserveVO reserveVo) {
		SqlSession session = null;
		String no = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			no = session.selectOne("reserve.getSalonReserveNo", reserveVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return no;
	}

	@Override
	public int cancelReserve(String no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("reserve.cancelReserve", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session != null) session.close();
		}
		
		return cnt;
	}


	@Override
	public List<HashMap<String, Object>> getMyPastRoomReserve(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> listMap = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			listMap = session.selectList("reserve.getMyPastRoomReserve", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return listMap;
	}

	@Override
	public List<HashMap<String, Object>> getMyNewRoomReserve(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> listMap = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			listMap = session.selectList("reserve.getMyNewRoomReserve", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return listMap;
	}

	@Override
	public List<HashMap<String, Object>> getMyPastSalonReserve(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> listMap = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			listMap = session.selectList("reserve.getMyPastSalonReserve", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return listMap;
	}

	@Override
	public List<HashMap<String, Object>> getMyNewSalonReserve(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> listMap = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			listMap = session.selectList("reserve.getMyNewSalonReserve", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return listMap;
	}
}
