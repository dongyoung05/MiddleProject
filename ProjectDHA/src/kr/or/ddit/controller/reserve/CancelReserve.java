package kr.or.ddit.controller.reserve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reserve.IReserveService;
import kr.or.ddit.service.reserve.ReserveServiceImpl;

/**
 * Servlet implementation class CancelReserve
 */
@WebServlet("/reserve/cancelReserve.do")
public class CancelReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reserveNo = request.getParameter("reserveNo");
		System.out.println(reserveNo);
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		int cnt = service.cancelReserve(reserveNo);
		System.out.println("cancel cnt " + cnt);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
