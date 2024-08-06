package kr.or.ddit.dao.prodcart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.ProdCartVO;

public class ProdCartDaoImpl implements IProdCartDao {
	
	private static ProdCartDaoImpl dao;
	
	private ProdCartDaoImpl() {	}
	
	public static ProdCartDaoImpl getInstance() {
		if(dao == null) dao = new ProdCartDaoImpl();
		return dao;
	}

	@Override
	public int insertProdCart(ProdCartVO prodCart) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("ProdCart.insertProdCart", prodCart);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int checkCartProd(ProdCartVO prodCart) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("ProdCart.checkCartProd", prodCart);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int duplicationCartProd(ProdCartVO prodCart) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("ProdCart.duplicationCartProd", prodCart);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public List<ProdCartVO> getAllProdCart(String cartNo) {
		SqlSession session = null;
		List<ProdCartVO> prodCartList = new ArrayList<ProdCartVO>();
		
		try {
			session = MybatisUtil.getSqlSession();
			prodCartList = session.selectList("ProdCart.getAllProdCart", cartNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return prodCartList;
	}

	@Override
	public int modifyProdCart(Map<String, String> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("ProdCart.modifyProdCart", map);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int deleteProdCart(ProdCartVO prodCart) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("ProdCart.deleteProdCart", prodCart);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

}