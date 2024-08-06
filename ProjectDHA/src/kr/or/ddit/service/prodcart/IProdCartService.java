package kr.or.ddit.service.prodcart;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdCartVO;

public interface IProdCartService {

	/**
	 * 장바구니에 상품을 담는 메서드
	 * @param prod : 담을 상품에 대한 정보(상품명, 상품 수량)이 담긴 ProdCartVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertProdCart(ProdCartVO prodCart);
	
	/**
	 * 장바구니에 상품이 이미 담겨있는지 확인하는 메서드
	 * @param prodCart : 확인할 상품의 정보가 담긴 ProdCartVO 객체
	 * @return 조건에 부합하는 담겨있는 상품의 수
	 */
	public int checkCartProd(ProdCartVO prodCart);
	
	/**
	 * 장바구니에 이미 담긴 상품을 중복으로 담을 때 수량을 추가하는 메서드
	 * @param prodCart : 중복된 상품의 정보가 담긴 ProdCartVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int duplicationCartProd(ProdCartVO prodCart);
	
	/**
	 * 해당하는 장바구니에 담긴 상품들의 정보를 모두 가져오는 메서드
	 * @param cartNo : 장바구니 번호
	 * @return 장바구니에 있는 ProdCartVO 정보를 담은 List 객체
	 */
	public List<ProdCartVO> getAllProdCart(String cartNo);
	
	/**
	 * 장바구니에서 수량을 수정하는 버튼을 눌렀을 때 변경해주는 메서드
	 * @param map : 수정하고자 하는 상품에 대한 정보가 담긴 Map 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int modifyProdCart(Map<String, String> map);
	
	/**
	 * 장바구니에 넣은 상품 정보를 제거하고자 할 때 사용하는 메서드
	 * @param prodCart : 삭제하고자 하는 상품에 대한 정보가 담긴 ProdCartVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteProdCart(ProdCartVO prodCart);
}
