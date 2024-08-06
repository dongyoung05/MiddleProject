package kr.or.ddit.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/cart/deleteProdCart.do")
public class DeleteProdCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String prodId = request.getParameter("prodId");
		
		HttpSession session = request.getSession(false);
		CartVO cartVo = (CartVO)session.getAttribute("cart");
		
		IProdCartService service = ProdCartServiceImpl.getInstance();
		ProdCartVO prodCartVo = new ProdCartVO();
		
		prodCartVo.setCart_no(cartVo.getCart_no());
		prodCartVo.setProd_no(prodId);
		
		int cnt = service.deleteProdCart(prodCartVo);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
