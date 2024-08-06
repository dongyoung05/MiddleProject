package kr.or.ddit.controller.prod;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/getSelectProd.do")
public class GetSelectProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	조건값 얻기
		String prodNo = request.getParameter("prodNo");
		String trigger = request.getParameter("trigger");
		
		IProdService service = ProdServiceImpl.getInstance();
		ProdVO prodVo = service.getSelectProd(prodNo);
		
		//	상품 분류명 얻기
		String ctgryId = prodVo.getProd_ctgry_id();
		ProdVO ctgryVo = service.getCtrgyName(ctgryId); 
		
		request.setAttribute("prodNo", prodNo);
		request.setAttribute("prodVo", prodVo);
		request.setAttribute("ctgryVo", ctgryVo);
		
		if("Y".equals(trigger)) {		//	수정 버튼을 눌렀을 경우
			request.getRequestDispatcher("/prod/prodUpdate.jsp").forward(request, response);
		} else {					//	그냥 상품 이미지를 누른 경우
			request.getRequestDispatcher("/prod/prodDetail.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
