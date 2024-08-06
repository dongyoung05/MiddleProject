package kr.or.ddit.controller.reserve;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import kr.or.ddit.service.reserve.IReserveService;
import kr.or.ddit.service.reserve.ReserveServiceImpl;

/**
 * Servlet implementation class MyReserve
 */
@WebServlet("/reserve/myReserve.do")
public class MyReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");
		String type = request.getParameter("type");
		
		List<HashMap<String, Object>> newList = null;
		List<HashMap<String, Object>> oldList = null;
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		newList = service.getMyReserve(memId, "new", type);
		oldList = service.getMyReserve(memId, "old", type);
		
		request.setAttribute("newList", newList);
		request.setAttribute("oldList", oldList);
		request.getRequestDispatcher("/view/myReserve.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
