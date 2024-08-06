package kr.or.ddit.service.prod;

import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.prod.IProdDao;
import kr.or.ddit.dao.prod.ProdDaoImpl;
import kr.or.ddit.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	
	private static ProdServiceImpl service;
	
	private IProdDao dao;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	
	public static ProdServiceImpl getInstance() {
		if(service == null) service = new ProdServiceImpl();
		return service;
	}

	@Override
	public List<ProdVO> getAllProd(Map<String, String> searchParameters) {
		return dao.getAllProd(searchParameters);
	}
	
	@Override
	public List<ProdVO> getCtgryProd(String prod_ctgry_id) {
		return dao.getCtgryProd(prod_ctgry_id);
	}
	
	@Override
	public List<ProdVO> searchCtgryProd(Map<String, String> parameterMap) {
		return dao.searchCtgryProd(parameterMap);
	}
	
	@Override
	public ProdVO getSelectProd(String prod_no) {
		return dao.getSelectProd(prod_no);
	}

	@Override
	public int insertProd(ProdVO prodVo) {
		return dao.insertProd(prodVo);
	}

	@Override
	public int modifyProd(ProdVO prodVo) {
		return dao.modifyProd(prodVo);
	}

	@Override
	public int deleteProd(String prod_no) {
		return dao.deleteProd(prod_no);
	}

	@Override
	public List<ProdVO> getAllCtgry() {
		return dao.getAllCtgry();
	}

	@Override
	public ProdVO getCtrgyName(String prod_ctgry_id) {
		return dao.getCtrgyName(prod_ctgry_id);
	}

	@Override
	public List<ProdVO> pageProdAdmin(Map<String, Integer> pageNum) {
		return dao.pageProdAdmin(pageNum);
	}

}
