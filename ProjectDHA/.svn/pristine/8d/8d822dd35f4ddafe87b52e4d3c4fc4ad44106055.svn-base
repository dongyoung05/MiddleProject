package kr.or.ddit.controller.room;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.room.IRoomService;
import kr.or.ddit.service.room.RoomServiceImpl;
import kr.or.ddit.vo.RoomVo;

/**
 * Servlet implementation class UpdateRoom
 */
@WebServlet("/admin/updateRoom.do")
public class UpdateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String desc = request.getParameter("desc");
		int all = Integer.parseInt(request.getParameter("all"));
		int day = Integer.parseInt(request.getParameter("day"));
		int night = Integer.parseInt(request.getParameter("night"));
		
		RoomVo vo = new RoomVo();
		vo.setRoom_no(no);
		vo.setRoom_type(type);
		vo.setRoom_title(title);
		vo.setRoom_desc(desc);
		vo.setRoom_price_all(all);
		vo.setRoom_price_day(day);
		vo.setRoom_price_night(night);
		
		IRoomService service = RoomServiceImpl.getInstance();
		int cnt = service.updateRoom(vo);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
