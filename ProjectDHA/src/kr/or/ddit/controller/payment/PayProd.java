package kr.or.ddit.controller.payment;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.payment.IPaymentService;
import kr.or.ddit.service.payment.PaymentServiceImpl;
import kr.or.ddit.vo.CartVO;

@WebServlet("/payment/payProd.do")
public class PayProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	세션에 담긴 장바구니 정보 가져오기
		HttpSession session = request.getSession(false);
		CartVO cartVo = (CartVO)session.getAttribute("cart");
		String cartNo = cartVo.getCart_no();
		
		//	전송된 값 가져오기
		int price = Integer.parseInt(request.getParameter("price"));
		
		//	서비스 실행을 위한 Map 객체 생성
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("cart_no", cartNo);
		param.put("price", price);
		
		//	서비스 객체 생성
		IPaymentService service = PaymentServiceImpl.getInstance();
		
		int cnt1 = service.insertProdOrder(cartNo);
		int cnt2 = service.insertProdPayment(param);
		
		request.setAttribute("cnt1", cnt1);
		request.setAttribute("cnt2", cnt2);
		session.removeAttribute("cart");
		request.getRequestDispatcher("/view/result2.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
