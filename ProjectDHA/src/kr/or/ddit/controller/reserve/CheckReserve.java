package kr.or.ddit.controller.reserve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reserve.IReserveService;
import kr.or.ddit.service.reserve.ReserveServiceImpl;
import kr.or.ddit.service.salon.ISalonService;
import kr.or.ddit.service.salon.SalonServiceImpl;

/**
 * Servlet implementation class CheckReserve
 */
@WebServlet("/reserve/checkReserve.do")
public class CheckReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int dateCnt = 8;
		
		String date = request.getParameter("date");
		String weight = request.getParameter("weight");
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		// cnt가 0 이상이면(cnts[i]++;) 예약 가능
		int[] cnts = new int[dateCnt];
		
		if("소형".equals(weight)) {
			for(int i=0;i<dateCnt;i++) {
				String tempDate = date + " " + (10 + i) + ":00:00.00";
				
				if(service.chkSalonReserveList(tempDate) == 0) {
					cnts[i]++;
				}
			}
		} else if("중형".equals(weight)) {
			for(int i=0;i<dateCnt-1;i++) {
				String tempDate1 = date + " " + (10 + i) + ":00:00.00";
				String tempDate2 = date + " " + (11 + i) + ":00:00.00";
				
				if(service.chkSalonReserveList(tempDate1) == 0
				&& service.chkSalonReserveList(tempDate2) == 0) {
					cnts[i]++;
				}
			}
		} else if("대형".equals(weight)) {
			for(int i=0;i<dateCnt-3;i++) {
				String tempDate1 = date + " " + (10 + i) + ":00:00.00";
				String tempDate2 = date + " " + (11 + i) + ":00:00.00";
				String tempDate3 = date + " " + (12 + i) + ":00:00.00";
				String tempDate4 = date + " " + (13 + i) + ":00:00.00";
				
				if(service.chkSalonReserveList(tempDate1) == 0
				&& service.chkSalonReserveList(tempDate2) == 0
				&& service.chkSalonReserveList(tempDate3) == 0
				&& service.chkSalonReserveList(tempDate4) == 0) {
					cnts[i]++;
				}
			}
		}
		
		
		request.setAttribute("cnts", cnts);
		request.getRequestDispatcher("/view/chkReserveResult.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}