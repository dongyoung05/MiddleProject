package kr.or.ddit.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;

@WebServlet("/printListAdmin.do")
public class PrintListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String ctgry = request.getParameter("ctgry");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		list = service.printAllCtgry(ctgry);
		
		request.setAttribute("printList", list);
		if("QUES".equals(ctgry) || "ALER".equals(ctgry)) {
			request.getRequestDispatcher("/admin/QnAListAdmin.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/admin/ReviewListAdmin.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
