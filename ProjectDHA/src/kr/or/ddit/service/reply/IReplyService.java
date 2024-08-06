package kr.or.ddit.service.reply;

import java.util.List;

import kr.or.ddit.vo.ReplyVO;

public interface IReplyService {
	
	/**
	 * 작성된 댓글 전체를 출력하는 메서드 
	 * @return insert된 모든 댓글 출력
	 */
	public List<ReplyVO> replyPrintAll();
	/**
	 * 작성한 정보를 VO객체에 담아imsert 하는 메서드
	 * @param replyVo 작성한 정보를 담을 객체
	 * @return 작업성공1 작업실패0
	 */
	public int insertReply (ReplyVO replyVo);
	/**
	 * 댓글번호를 기준으로 댓글을 수정하는 메서드
	 * @param replyVo 수정기준
	 * @return 작업성공1 작업실패0
	 */
	public int updateReply (ReplyVO replyVo);
	/**
	 * 댓글번호를 기준으로 댓글을 삭제하는 메서드
	 * @param Reply_no 삭제기준
	 * @return 작업성공1 작업실패0
	 */
	public int deleteReply (ReplyVO replyVo);
	/**
	 * 댓글번호를 기준으로 댓글을 찾는 메서드
	 * @param Reply_no 검색기준
	 * @return 작업성공1 작업실패0
	 */
	public List<ReplyVO> searchReplyBoard_no (String board_no); 

}