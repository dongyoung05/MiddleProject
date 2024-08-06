package kr.or.ddit.controller.reserve;

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
 * Servlet implementation class CheckSalon
 */
@WebServlet("/reserve/checkSalon.do")
public class CheckSalon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String weight = request.getParameter("weight");
		
		ISalonService service = SalonServiceImpl.getInstance();
		
		List<SalonVo> salonList = service.getSalonWeight(weight);
		
		for(SalonVo s : salonList) System.out.println(s.toString());
		
		request.setAttribute("salonList", salonList);
		
		request.getRequestDispatcher("/view/salonList.jsp")
			.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
