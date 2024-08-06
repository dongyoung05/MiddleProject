package kr.or.ddit.dao.payment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;


public class PaymentDaoImpl implements IPaymentDao{
	private static IPaymentDao dao;
	
	private PaymentDaoImpl() {}
	
	public static IPaymentDao getInstance() {
		if(dao == null) dao = new PaymentDaoImpl();
		return dao;
	}
	
	@Override
	public int insertReserveOrder(String reserveNo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Payment.insertReserveOrder", reserveNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertReservePayment(HashMap<String, Object> param) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Payment.insertReservePayment", param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(cnt > 0) session.commit();
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertProdOrder(String cartNo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Payment.insertProdOrder", cartNo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public int insertProdPayment(HashMap<String, Object> param) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Payment.insertProdPayment", param);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public List<HashMap<String, Object>> getMyProdPayment(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("Payment.getMyProdPayment", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public List<HashMap<String, Object>> getMyServicePayment(String mem_id) {
		SqlSession session = null;
		List<HashMap<String, Object>> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("Payment.getMyServicePayment", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
}