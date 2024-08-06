package kr.or.ddit.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.prodcart.IProdCartService;
import kr.or.ddit.service.prodcart.ProdCartServiceImpl;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.ProdCartVO;

@WebServlet("/cart/getProdQty.do")
public class GetProdQty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	세션에 담긴 장바구니 정보 가져오기
		HttpSession session = request.getSession(false);
		CartVO cartVo = (CartVO)session.getAttribute("cart");
		
		//	서비스 객체 생성
		IProdCartService prodCartService = ProdCartServiceImpl.getInstance();
		
		//	장바구니 정보가 있을 때
		if(cartVo != null) {
			List<ProdCartVO> prodCartList = prodCartService.getAllProdCart(cartVo.getCart_no());
			request.setAttribute("prodCartList", prodCartList);
			request.getRequestDispatcher("/cart/view/ProdCartList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
