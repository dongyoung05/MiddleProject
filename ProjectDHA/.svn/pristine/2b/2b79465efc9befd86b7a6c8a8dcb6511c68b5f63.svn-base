package kr.or.ddit.controller.payment;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.payment.IPaymentService;
import kr.or.ddit.service.payment.PaymentServiceImpl;

/**
 * Servlet implementation class PayReserve
 */
@WebServlet("/payment/payReserve.do")
public class PayReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reserveNo = request.getParameter("reserveNo");
		int price = Integer.parseInt(request.getParameter("price"));
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("reserve_no", reserveNo);
		param.put("price", price);
		
		IPaymentService service = PaymentServiceImpl.getInstance();
		int cnt1 = service.insertReserveOrder(reserveNo);
		int cnt2 = service.insertReservePayment(param);
		
		request.setAttribute("cnt1", cnt1);
		request.setAttribute("cnt2", cnt2);
		request.getRequestDispatcher("/view/result2.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}










