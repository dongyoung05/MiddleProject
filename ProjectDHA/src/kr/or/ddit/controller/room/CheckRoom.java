package kr.or.ddit.controller.room;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.room.IRoomService;
import kr.or.ddit.service.room.RoomServiceImpl;
import kr.or.ddit.vo.RoomVo;

/**
 * Servlet implementation class CheckRoom
 */
@WebServlet("/room/checkRoom.do")
public class CheckRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String weight = request.getParameter("weight");
		String sdate = request.getParameter("sdate");
		String stime = request.getParameter("stime");
		String edate = request.getParameter("edate");
		String etime = request.getParameter("etime");
		
		String in = stime.equals("1") ? sdate + " 10:00:00.00" : sdate + " 18:00:00.00";
		String out = etime.equals("1") ? edate + " 09:59:00.00" : edate + " 17:59:00.00";
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("reserve_in", in);
		param.put("reserve_out", out);
		param.put("room_type", weight);
		
		IRoomService service = RoomServiceImpl.getInstance();
		
		List<RoomVo> roomList = service.chkRoomReserve(param);
		
		String diff = service.getTimeBetweenInOut(param);
		System.out.println(diff);
		
		for(RoomVo r : roomList) {
			int date = (int)(diff.charAt(1) - '0');;
			int day = 0;
			int night = 0;
			int price = 0;
			if(diff.contains("23:59")) date++;
			else if(diff.contains("7:59")) day++;
			else if(diff.contains("15:59")) night++;
			price = r.getRoom_price_all() * date + r.getRoom_price_day() * day 
					+ r.getRoom_price_night() * night;
			r.setRoom_price_total(price);
			System.out.println("총 가격: " + price);
		}
		
		request.setAttribute("roomList", roomList);
		request.getRequestDispatcher("/view/roomList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}













