package kr.or.ddit.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.service.notice.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;


@WebServlet("/noticeDetailAdmin.do")
public class NoticeDetailAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 받아 올 객체 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 서비스 객체 연결
		INoticeService service = NoticeServiceImpl.getInstance();
		
		// 세부조회할 공지사항 번호 가져오기
		String notice_no = request.getParameter("notice_no");
		
		// 업데이트와 상세보기를 구분 해주는 트리거
		String trigger = request.getParameter("trigger");
		
		// 서비스와 연결하여 상세볼 정보 가져옴
		NoticeVO noticeVo = service.searchNoticeByNotice_no(notice_no);
		
		// vo에 값 넣어줌
		request.setAttribute("noticeVo", noticeVo);
		
		if("Y".equals(trigger)) {
			// 만약 트리거를 y로 넣으면 업데이트로
			request.getRequestDispatcher("/notice/notice_Admin_Update.jsp").forward(request, response);
		} else {
			// 아니면 세부사항조회로
			request.getRequestDispatcher("/notice/notice_Admin_Detail.jsp").forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
