package kr.or.ddit.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/pageProdAdmin.do")
public class PageProdAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pageNum = Integer.parseInt(request.getParameter("page"));
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int start = ((pageNum - 1) * 10) + 1;
		int end   = pageNum * 10;
		
		map.put("start", start);
		map.put("end", end);
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> list = service.pageProdAdmin(map);
		
		request.setAttribute("prodList", list);
		request.getRequestDispatcher("/admin/prod_main_admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
