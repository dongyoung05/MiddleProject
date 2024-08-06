package kr.or.ddit.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/boardList_HOTE.do")
public class BoardList_HOTE extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		//서비스 객체 얻어오기
		IBoardService service = BoardServiceImpl.getInstance();
		List<BoardVO>boardlist = service.getBoard_HOTE("HOTE");

		//request에 저장
		request.setAttribute("boardList_HOTE", boardlist);

		//view페이지로 이동
		request.getRequestDispatcher("/board/review_main.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
