package kr.or.ddit.dao.dog;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.DogVO;

public class DogDaoImpl implements IDogDao {
	private static DogDaoImpl dao;
	private DogDaoImpl() {}
	public static DogDaoImpl getInstance() {
		if(dao==null) dao = new DogDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<DogVO> selectAllDog(String mem_id) {
		SqlSession session = null;
		List<DogVO> dogList = null;
		try {
			session = MybatisUtil.getSqlSession();
			
			dogList = session.selectList("dog.selectAllDog", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)session.close();
		}
		return dogList;
	}

	@Override
	public int insertDog(DogVO dogVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session =  MybatisUtil.getSqlSession();
			
			cnt = session.insert("dog.insertDog", dogVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteDog(DogVO dogVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session =  MybatisUtil.getSqlSession();
			
			cnt = session.update("dog.deleteDog", dogVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateDog(DogVO dogVo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session =  MybatisUtil.getSqlSession();
			
			cnt = session.update("dog.updateDog", dogVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)session.close();
		}
		
		return cnt;
	}

	@Override
	public DogVO selectDog(DogVO dogVo) {
		SqlSession session = null;
		DogVO dvo = null;
		try {
			session=MybatisUtil.getSqlSession();
			dvo = session.selectOne("dog.selectDog", dogVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)session.close();
		}
		return dvo;
	}

	
}
