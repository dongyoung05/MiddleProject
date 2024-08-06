package kr.or.ddit.dao.prod;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdVO;

public interface IProdDao {

	/**
	 * DB에 있는 상품 정보 전부를 가져와서 출력주는 메서드
	 * @param parameterMap : 검색 기준들이 저장된 Map 객체
	 * @return DB의 ProdVO 정보가 담긴 List 객체
	 */
	public List<ProdVO> getAllProd(Map<String, String> parameterMap);
	
	/**
	 * 분류번호에 따른 상품 정보를 전부 가져와서 출력하는 메서드
	 * @param prod_ctgry_id : 분류번호
	 * @return 해당 분류의 ProdVO 정보가 담긴 List 객체
	 */
	public List<ProdVO> getCtgryProd(String prod_ctgry_id);
	
	/**
	 * 분류 조건에 따른 상품 정보를 가져와서 출력하는 메서드
	 * @return 조건에 맞는 ProdVO 정보가 담긴 List 객체
	 */
	public List<ProdVO> searchCtgryProd(Map<String, String> parameterMap);
	
	/**
	 * 상품 목록에서 선택한 상품의 정보를 가져오는 메서드
	 * @param prod_no : 확인하고자 하는 상품의 번호
	 * @return 선택한 상품의 정보가 담긴 ProdVO 객체
	 */
	public ProdVO getSelectProd(String prod_no);

	//----- 관리자 기능 -----//
	/**
	 * DB에 새로운 상품에 대한 정보를 추가하는 메서드
	 * @param prodVo : 추가할 상품에 대한 정보가 담긴 ProdVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertProd(ProdVO prodVo);
	
	/**
	 * 등록되어있는 상품의 정보를 수정하는 메서드
	 * @param prodVo : 수정할 상품에 대한 정보가 담긴 ProdVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int modifyProd(ProdVO prodVo);
	
	/**
	 * 등록된 상품을 삭제할 때 사용하는 메서드
	 * @param prod_no : 삭제할 상품의 번호
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteProd(String prod_no);
	
	/**
	 * DB에 등록된 모든 상품분류 정보를 가져와서 List에 담는 메서드
	 * @return 상품분류 정보가 담긴 List 객체
	 */
	public List<ProdVO> getAllCtgry();
	
	/**
	 * 해당 상품분류 이름을 가져오는 메서드
	 * @param prod_ctgry_id : 상품분류 아이디
	 * @return 해당 상품 분류명이 담긴 ProdVO 객체
	 */
	public ProdVO getCtrgyName(String prod_ctgry_id);
	
	/**
	 * 관리자의 상품 관리 창에서 출력할 목록에 대한 페이지 처리하는 메서드
	 * @param pageNum : 페이지 처리 기준이 될 숫자가 담긴 Map 객체
	 * @return 해당 페이지에 출력 될 ProdVO 가 담긴 List 객체
	 */
	public List<ProdVO> pageProdAdmin(Map<String, Integer> pageNum);
}
