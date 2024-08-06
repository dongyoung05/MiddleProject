package kr.or.ddit.service.cart;

import kr.or.ddit.dao.cart.CartDaoImpl;
import kr.or.ddit.dao.cart.ICartDao;
import kr.or.ddit.vo.CartVO;

public class CartServiceImpl implements ICartService {
	
	private static CartServiceImpl service;
	
	private ICartDao dao;
	
	private CartServiceImpl() {
		dao = CartDaoImpl.getInstance();
	}
	
	public static CartServiceImpl getInstance() {
		if(service == null) service = new CartServiceImpl();
		return service;
	}

	@Override
	public int insertCart(String mem_id) {
		return dao.insertCart(mem_id);
	}

	@Override
	public CartVO getUserCart(String mem_id) {
		return dao.getUserCart(mem_id);
	}

}
