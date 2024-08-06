package kr.or.ddit.controller.prod;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/getCtrgyProd.do")
public class GetCtrgyProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	상품 분류 번호 가져오기
		String prod_ctgry_id = request.getParameter("prodCtgryId");
		
		//	서비스 객체 생성
		IProdService service = ProdServiceImpl.getInstance();
		List<ProdVO> prodList = service.getCtgryProd(prod_ctgry_id);
		
		request.setAttribute("prodList", prodList);
		request.getRequestDispatcher("/prod/prodSale.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}