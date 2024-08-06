package kr.or.ddit.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.service.notice.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;


@WebServlet("/noticeListAdmin.do")
public class NoticeListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		//서비스 객체 얻어오기
		INoticeService service = NoticeServiceImpl.getInstance();
		
		//서비스 메소드 호출하기
		List<NoticeVO> noticelist = service.printAllNotice();
		
		//리스트를 가져올 서비스 메소드 호출하기		
		System.out.println("checked : " + noticelist);
		
		//request에 저장
		request.setAttribute("noticeList", noticelist);
		
		//view페이지로 이동
		request.getRequestDispatcher("/notice/notice_Admin_main.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
