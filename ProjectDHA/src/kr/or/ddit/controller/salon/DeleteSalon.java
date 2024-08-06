package kr.or.ddit.controller.salon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.salon.ISalonService;
import kr.or.ddit.service.salon.SalonServiceImpl;

/**
 * Servlet implementation class DeleteSalon
 */
@WebServlet("/admin/deleteSalon.do")
public class DeleteSalon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		
		ISalonService service = SalonServiceImpl.getInstance();
		
		request.setAttribute("cnt", service.deleteSalon(no));
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
