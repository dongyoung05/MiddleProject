package kr.or.ddit.controller.salon;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.salon.ISalonService;
import kr.or.ddit.service.salon.SalonServiceImpl;
import kr.or.ddit.vo.SalonVo;

/**
 * Servlet implementation class InserSalon
 */
@WebServlet("/admin/insertSalon.do")
public class InserSalon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String weight = request.getParameter("weight");
		int price = Integer.parseInt(request.getParameter("price"));
		
		SalonVo vo = new SalonVo();
		vo.setSalon_no(no);
		vo.setSalon_name(name);
		vo.setSalon_weight(weight);
		vo.setSalon_price(price);
		vo.setSalon_desc(desc);
		
		ISalonService service = SalonServiceImpl.getInstance();
		int cnt = service.insertSalon(vo);
		
		request.setAttribute("cnt", cnt);
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
