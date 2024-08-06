package kr.or.ddit.controller.room;

import java.io.IOException;
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
 * Servlet implementation class GetRoomList
 */
@WebServlet("/admin/getRoomList.do")
public class GetRoomList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IRoomService service = RoomServiceImpl.getInstance();
		List<RoomVo> list = service.getRoomList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/roomListAdmin.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
