package kr.or.ddit.service.board;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PageVO;

public interface IBoardService {
	
	/**
	 * DB의 게시글 정보를 모두 가져와 List에 담아서 반환하는 메서드
	 * @return 전체 BoardVO객체가 저장된 List
	 */
	public List<BoardVO> boardPrintAll();
	
	/**
	 * BoardVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param boardVo : DB에 insert할 자료가 저장된 VO객체
	 * @return 작업성공: 1  작업실패: 0
	 */
	public int insertBoard(BoardVO boardVo);
	
	/**
	 * BoardVo 객체에 담겨진 자료를 받아와 내용을 수정하는 메서드
	 * @param board_no : 수정할 게시글의 자료가 담겨진 VO객체
	 * @return 작업성공: 1  작업실패: 0
	 */
	public int updateBoard(BoardVO boardVo);
	
	/**
	 * 게시글 번호를 매개변수로 하여 해당 게시글을 삭제하는 메서드
	 * @param boardNo : 삭제할 게시글 번호
	 * @return 작업성공: 1  작업실패: 0
	 */
	public int deleteBoard(String board_no);
	
	/**
	 * 게시글 제목을 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param title : 게시글 제목
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public BoardVO searchBoardbyBoard_no (String board_no);
	
	/**
	 * 멤버ID를 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param memId : 회원 ID
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	
	public List<BoardVO> getBoard_QUES (String board_ctgry_no);
	
	/**
	 * 멤버ID를 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param memId : 회원 ID
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public List<BoardVO> getBoard_ALER (String board_ctgry_no);
	
	/**
	 * 멤버ID를 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param memId : 회원 ID
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public List<BoardVO> getBoard_PROD (String board_ctgry_no);
	
	/**
	 * 멤버ID를 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param memId : 회원 ID
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public List<BoardVO> getBoard_HOTE (String board_ctgry_no);
	
	/**
	 * 멤버ID를 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
	 * @param memId : 회원 ID
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public List<BoardVO> getBoard_SALO (String board_no);
	
	/**
	 * 게시글 번호를 입력받아 해당하는 게시글의 정보를 List에 담아서 반환하는 메서드
	 * @param boardNo : 검색하고자 하는 게시글번호
	 * @return 조건에 부합하는 VO객체가 저장된 메서드
	 */
	public BoardVO viewBoard(int board_no);
	
	/**
	 * 게시글을 열람할 때마다 조회수가 자동으로 1씩 오르게 하는 메서드
	 * @param boardNo : 내가 열람하는 게시글번호
	 * @return 작업성공: 1 작업성공: 0
	 */
	public int viewPlus(String board_no);
	
	/**
	 * 게시글번호를 받아서 게시글의 이미지를 불러오는 메서드
	 * @param board_no 불러올 이미지의 게시글번호
	 * @return 작업성공: 1 작업실패: 0
	 */
	public int selectBoardimageByBoard_no(String board_no);
	
	/**
	 * 리뷰를 수정하는 메서드
	 * @param boardVo 수정내용을 담을 객체
	 * @return 작업성공: 1 작업실패: 0
	 */
	public int updateReview (BoardVO boardVo);
	
	/**
	 * 상품에 관련된 번호를 가지고 주문번호를 찾는 메서드
	 * @param value : 결제한 기록이 있는 카드 번호 또는 예약 번호
	 * @return 작업 성공 : 1 , 작업 실패 : 0
	 */
	public String findOrderNo(String value);
	
	/**
	 * 리뷰 작성에 필요한 정보를 담은 BoardVO 객체를 DB에 insert 하는 메서드
	 * @param boardVo : 리뷰에 필요한 정보를 담은 BoardVO 객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertReview (BoardVO boardVo);
	
	/**
	 * 해당 게시판 분류의 게시글 정보를 담은 BoardVO 객체를 List에 담아 반환하는 메서드
	 * @param ctgry : 분류 번호
	 * @return 해당 분류의 BoardVO 를 담은 List 객체
	 */
	public List<BoardVO> printAllCtgry(String ctgry);
	
	/**
	 * 회원이 마이페이지 방문시 조회할 리뷰
	 * @param mem_id 회원아이디
	 * @return 리뷰리스트들
	 */
	public List<BoardVO> mypageReview(String mem_id);
}
