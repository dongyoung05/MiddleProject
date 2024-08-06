package kr.or.ddit.dao.cart;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.CartVO;

public class CartDaoImpl implements ICartDao {
	
	private static CartDaoImpl dao;
	
	private CartDaoImpl() { }
	
	public static CartDaoImpl getInstance() {
		if(dao == null) dao = new CartDaoImpl();
		return dao;
	}

	@Override
	public int insertCart(String mem_id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Cart.insertCart", mem_id);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cnt;
	}

	@Override
	public CartVO getUserCart(String mem_id) {
		SqlSession session = null;
		CartVO cartVo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cartVo = session.selectOne("Cart.getUserCart", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return cartVo;
	}

}
