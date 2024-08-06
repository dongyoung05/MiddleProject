package kr.or.ddit.controller.payment;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.payment.IPaymentService;
import kr.or.ddit.service.payment.PaymentServiceImpl;

/**
 * Servlet implementation class MyProdPayment
 */
@WebServlet("/payment/myProdPayment.do")
public class MyProdPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");
		String type = request.getParameter("type");
		
		IPaymentService service = PaymentServiceImpl.getInstance();
		
		List<HashMap<String, Object>> list = null;
		
		if("prod".equals(type)) {
			list = service.getMyProdPayment(memId);
		} else {
			list = service.getMyServicePayment(memId);
		}
		
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/paymentList.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
