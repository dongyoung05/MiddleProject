package kr.or.ddit.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.service.notice.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeAdminDelete
 */
@WebServlet("/noticeDeleteAdmin.do")
public class NoticeDeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		String notice_no = request.getParameter("notice_no");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int cnt = service.deleteNotice(notice_no);
		
		request.setAttribute("cnt", cnt);
		
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
