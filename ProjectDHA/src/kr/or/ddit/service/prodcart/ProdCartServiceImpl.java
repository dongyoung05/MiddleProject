package kr.or.ddit.service.prodcart;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.prodcart.IProdCartDao;
import kr.or.ddit.dao.prodcart.ProdCartDaoImpl;
import kr.or.ddit.vo.ProdCartVO;

public class ProdCartServiceImpl implements IProdCartService {
	
	private static ProdCartServiceImpl service;
	
	private IProdCartDao dao;
	
	private ProdCartServiceImpl() {
		dao = ProdCartDaoImpl.getInstance();
	}
	
	public static ProdCartServiceImpl getInstance() {
		if(service == null) service = new ProdCartServiceImpl();
		return service;
	}

	@Override
	public int insertProdCart(ProdCartVO prodCart) {
		return dao.insertProdCart(prodCart);
	}

	@Override
	public int checkCartProd(ProdCartVO prodCart) {
		return dao.checkCartProd(prodCart);
	}

	@Override
	public int duplicationCartProd(ProdCartVO prodCart) {
		return dao.duplicationCartProd(prodCart);
	}

	@Override
	public List<ProdCartVO> getAllProdCart(String cartNo) {
		return dao.getAllProdCart(cartNo);
	}

	@Override
	public int modifyProdCart(Map<String, String> map) {
		return dao.modifyProdCart(map);
	}

	@Override
	public int deleteProdCart(ProdCartVO prodCart) {
		return dao.deleteProdCart(prodCart);
	}

}