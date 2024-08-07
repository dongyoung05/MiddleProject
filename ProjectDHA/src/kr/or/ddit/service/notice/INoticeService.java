package kr.or.ddit.service.notice;

import java.util.List;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {
	
		/**
		 * 전체공지를 출력하는 메서드
		 * @return 전체공지
		 */
		public List<NoticeVO> printAllNotice();
		/**
		 * 공지를 등록하는 메서드
		 * @param NoticeVo 공지의 내용을 담을 객체
		 * @return 작업성공1 작업실패0
		 */
		public int insertNotice(NoticeVO NoticeVo);
		/**
		 * 공지번호를 선택하여 해당 공지를 수정하는 메소드
		 * @param notice_no 공지번호
		 * @return 작업성공1 작업실패0
		 */
		public int updateNotice(NoticeVO NoticeVo);
		/**
		 * 공지번호를 선택하여 삭제하는 메서드
		 * @param notice_no 공지번호
		 * @return 작업성공1 작업실패0
		 */
		public int deleteNotice(String notice_no);
		

		/**
		 * 게시글 제목을 검색하여 해당되는 게시글만 List에 담아서 변환하는 메서드
		 * @param title : 게시글 제목
		 * @return 조건에 부합하는 VO객체가 저장된 메서드
		 */
		public NoticeVO searchNoticeByNotice_no (String notice_no);


}
