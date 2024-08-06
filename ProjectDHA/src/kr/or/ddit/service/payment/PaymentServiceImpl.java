package kr.or.ddit.service.payment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dao.payment.IPaymentDao;
import kr.or.ddit.dao.payment.PaymentDaoImpl;
import kr.or.ddit.util.MybatisUtil;


public class PaymentServiceImpl implements IPaymentService{
	private static IPaymentService service;
	private IPaymentDao dao;
	
	private PaymentServiceImpl() {
		dao = PaymentDaoImpl.getInstance();
	}
	
	public static IPaymentService getInstance() {
		if(service == null) service = new PaymentServiceImpl();
		return service;
	}
	
	@Override
	public int insertReserveOrder(String reserveNo) {
		return dao.insertReserveOrder(reserveNo);
	}

	@Override
	public int insertReservePayment(HashMap<String, Object> param) {
		return dao.insertReservePayment(param);
	}

	@Override
	public int insertProdOrder(String cartNo) {
		return dao.insertProdOrder(cartNo);
	}

	@Override
	public int insertProdPayment(HashMap<String, Object> param) {
		return dao.insertProdPayment(param);
	}

	@Override
	public List<HashMap<String, Object>> getMyProdPayment(String mem_id) {
		return dao.getMyProdPayment(mem_id);	
	}

	@Override
	public List<HashMap<String, Object>> getMyServicePayment(String mem_id) {
		return dao.getMyServicePayment(mem_id);
	}
	
	
}
