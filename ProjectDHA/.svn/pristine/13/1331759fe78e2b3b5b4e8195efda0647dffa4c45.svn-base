package kr.or.ddit.controller.reserve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reserve.IReserveService;
import kr.or.ddit.service.reserve.ReserveServiceImpl;
import kr.or.ddit.vo.ReserveVO;

/**
 * Servlet implementation class RoomReserve
 */
@WebServlet("/reserve/roomReserve.do")
public class RoomReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String sdate = request.getParameter("sdate");
		String stime = request.getParameter("stime");
		String edate = request.getParameter("edate");
		String etime = request.getParameter("etime");
		int price = Integer.parseInt(request.getParameter("price"));
		String roomNo = request.getParameter("no");
		int dogNo = Integer.parseInt(request.getParameter("dogNo"));
		String memId = request.getParameter("memId");
		
		String in = stime.equals("1") ? sdate + " 10:00:00.00" : sdate + " 18:00:00.00";
		String out = etime.equals("1") ? edate + " 09:59:00.00" : edate + " 17:59:00.00";
		
		ReserveVO reserveVo = new ReserveVO();
		reserveVo.setMem_id(memId);
		reserveVo.setDog_no(dogNo);
		reserveVo.setReserve_in(in);
		reserveVo.setReserve_out(out);
		reserveVo.setRoom_no(roomNo);
		reserveVo.setReserve_price(price);
		
		IReserveService service = ReserveServiceImpl.getInstance();
		int cnt = service.insertRoomReserve(reserveVo);
		System.out.println("insert cnt: " +cnt);
		
		String reserveNo = service.getRoomReserveNo(reserveVo);
		System.out.println("reserveNo: " + reserveNo);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("reserveNo", reserveNo);
		request.getRequestDispatcher("/view/getReserveNo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}








