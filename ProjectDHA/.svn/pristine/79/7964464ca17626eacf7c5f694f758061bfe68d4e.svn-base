package kr.or.ddit.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prodSelectAdmin.do")
public class ProdSelectAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	조건값 얻기
		String prodNo = request.getParameter("prod_id");
		
		IProdService service = ProdServiceImpl.getInstance();
		ProdVO prodVo = service.getSelectProd(prodNo);
		
		//	상품 분류명 얻기
		String ctgryId = prodVo.getProd_ctgry_id();
		ProdVO ctgryVo = service.getCtrgyName(ctgryId); 
		
		request.setAttribute("prodNo", prodNo);
		request.setAttribute("prodVo", prodVo);
		request.setAttribute("ctgryVo", ctgryVo);
		
		request.getRequestDispatcher("/admin/prod_detail_admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
