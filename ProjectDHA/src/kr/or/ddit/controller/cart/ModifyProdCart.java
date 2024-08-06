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

@WebServlet("/cart/modifyProdCart.do")
public class ModifyProdCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String prodId = request.getParameter("prodId");
		String symbol = request.getParameter("symbol");
		
		HttpSession session = request.getSession(false);
		CartVO cartVo = (CartVO)session.getAttribute("cart");
		
		IProdCartService service = ProdCartServiceImpl.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("cart_no", cartVo.getCart_no());
		map.put("prod_no", prodId);
		map.put("symbol", symbol);
		
		int cnt = service.modifyProdCart(map);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
