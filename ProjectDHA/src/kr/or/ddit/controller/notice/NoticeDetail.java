package kr.or.ddit.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.service.notice.NoticeServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.NoticeVO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/noticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		INoticeService service = NoticeServiceImpl.getInstance();
		String notice_no = request.getParameter("notice_no");
		
		
		
		NoticeVO noticeVo = service.searchNoticeByNotice_no(notice_no);
		
		request.setAttribute("noticeVo", noticeVo);
	
		request.getRequestDispatcher("/notice/notice_Detail.jsp").forward(request, response);
		
	}
		
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

	
	

}
