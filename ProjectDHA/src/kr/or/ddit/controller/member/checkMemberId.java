package kr.or.ddit.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;

/**
 * Servlet implementation class checkMemberId
 */
@WebServlet("/checkMemberId.do")
public class checkMemberId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 전송 할때 데이터를 받는다 - 입력받은 id
		String mem_id = request.getParameter("mem_id");
		
		//service객체를 얻는다
		IMemberService service = MemberServiceImpl.getInstance();
		
		// service메소드 호출 - 결과값을 받는다.
		int cnt = service.checkMemberId(mem_id);
		
		//결과값을 request에 저장 - view페이지와 공유
		request.setAttribute("cnt", cnt);
		
		//view페이지로 이동
		RequestDispatcher disp = request.getRequestDispatcher("/view/checkId.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
