package kr.or.ddit.dao.dog;

import java.util.List;

import kr.or.ddit.vo.DogVO;

public interface IDogDao {

	/**
	 * 로그인한 회원의 반려견들을 조회하는 메서드
	 * <br>
	 * @param mem_id 로그인한 회원의 아이디
	 * @return 반려견들에 대한 정보
	 */
	public List<DogVO>selectAllDog (String mem_id);
	
	/**
	 * 반려견을 추가하는 메서드
	 * 
	 * @param dogVo 반려견에 대한 정보
	 * @return 성공하면1, 실패하면 0 반환
	 */
	public int insertDog(DogVO dogVo);
	
	/**
	 * 반려견을 삭제하는 메서드
	 * @param dogVo	삭제할 반려견의 번호와 회원 id
	 * @return 성공하면1, 실패하면 0 반환
	 */
	public int deleteDog(DogVO dogVo);
	
	/**
	 * 반려견을 수정하는 메서드
	 * @param dogVO 수정할 반려견의 정보
	 * @return 성공하면1, 실패하면 0
	 */
	public int updateDog(DogVO dogVo);
	
	/**
	 * 선택한 반려견의 정보를 조회하는 메서드
	 * @param dogVo 반려견번호, 회원아이디 
	 * @return 반려견번호에 맞는 반려견 정보
	 */
	public DogVO selectDog(DogVO dogVo);
}
