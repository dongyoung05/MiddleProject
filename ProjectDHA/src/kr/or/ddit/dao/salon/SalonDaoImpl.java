package kr.or.ddit.dao.salon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.SalonVo;

public class SalonDaoImpl implements ISalonDao{
	
	private static ISalonDao dao;
	
	private SalonDaoImpl() {}
	
	public static ISalonDao getInstance() {
		if(dao == null) dao = new SalonDaoImpl();
		
		return dao;
	}

	@Override
	public SalonVo getSalon(String salon_no) {
		SqlSession session = null;
		SalonVo salon = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			salon = session.selectOne("Salon.getSalon", salon_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		
		return salon;
	}

	@Override
	public List<SalonVo> getSalonList() {
		SqlSession session = null;
		List<SalonVo> salonList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			salonList = session.selectList("Salon.getSalonList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return salonList;
	}

	@Override
	public List<SalonVo> getSalonWeight(String salon_weight) {
		SqlSession session = null;
		List<SalonVo> salonList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			salonList = session.selectList("Salon.getSalonWeight", salon_weight);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return salonList;
	}

	@Override
	public int insertSalon(SalonVo vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Salon.insertSalon", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}

	@Override
	public int deleteSalon(String no) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Salon.deleteSalon", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}

	@Override
	public int updateSalon(SalonVo vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("Salon.updateSalon", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session!=null) try {session.close();} catch(Exception e) {}
		}
		return cnt;
	}
	
}
