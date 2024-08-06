package kr.or.ddit.controller.salon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.salon.ISalonService;
import kr.or.ddit.service.salon.SalonServiceImpl;
import kr.or.ddit.vo.SalonVo;

/**
 * Servlet implementation class GetSalonList
 */
@WebServlet("/admin/getSalonList.do")
public class GetSalonList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ISalonService service = SalonServiceImpl.getInstance();
		List<SalonVo> list = service.getSalonList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/salonListAdmin.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
