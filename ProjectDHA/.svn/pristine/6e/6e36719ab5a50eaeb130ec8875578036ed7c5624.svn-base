package kr.or.ddit.service.cart;

import kr.or.ddit.vo.CartVO;

public interface ICartService {

	/**
	 * 장바구니가 없는 경우 장바구니를 새로 생성하는 메서드
	 * @param mem_id : 장바구니를 생성할 유저의 id
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertCart(String mem_id);
	
	/**
	 * 장바구니 생성 후 Session 에 넣을 장바구니에 대한 정보를 가져오는 메서드
	 * @param mem_id : 장바구니를 생성한 유저의 id
	 * @return 생성한 장바구니 정보가 담긴 CartVO 객체
	 */
	public CartVO getUserCart(String mem_id);
}
