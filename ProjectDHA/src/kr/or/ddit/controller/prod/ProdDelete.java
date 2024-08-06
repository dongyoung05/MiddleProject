package kr.or.ddit.controller.prod;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;

@WebServlet("/prod/prodDelete.do")
public class ProdDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String prodNo = request.getParameter("prodNo");
		System.out.println(prodNo);
		IProdService service = ProdServiceImpl.getInstance();
		
		int cnt = service.deleteProd(prodNo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/pageProdAdmin.do?page=1").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
