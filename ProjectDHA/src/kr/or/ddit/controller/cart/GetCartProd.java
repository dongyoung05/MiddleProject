package kr.or.ddit.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.service.prodcart.IProdCartService;
import kr.or.ddit.service.prodcart.ProdCartServiceImpl;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.ProdCartVO;
import kr.or.ddit.vo.ProdVO;

/**
 * Servlet implementation class GetCartProd
 */
@WebServlet("/cart/getCartProd.do")
public class GetCartProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	세션에 담긴 장바구니 정보 가져오기
		HttpSession session = request.getSession(false);
		CartVO cartVo = (CartVO)session.getAttribute("cart");
		
		//	서비스 객체 생성
		IProdCartService prodCartService = ProdCartServiceImpl.getInstance();
		IProdService prodService = ProdServiceImpl.getInstance();
		
		//	장바구니 정보가 있을 때
		if(cartVo != null) {
			List<ProdCartVO> prodCartList = prodCartService.getAllProdCart(cartVo.getCart_no());
			
			//	최종적으로 정보를 보낼 Map 객체 생성
			List<ProdVO> prodList = new ArrayList<ProdVO>();
			
			for(ProdCartVO prodCart : prodCartList) {
				String prod_no = prodCart.getProd_no();
				ProdVO prodVo = prodService.getSelectProd(prod_no);
				prodList.add(prodVo);
			}
			request.setAttribute("prodList", prodList);
			request.getRequestDispatcher("/cart/view/ProdList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
