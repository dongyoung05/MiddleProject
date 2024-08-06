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

@WebServlet("/boardList_SALO.do")
public class BoardList_SALO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		//서비스 객체 얻어오기
		IBoardService service = BoardServiceImpl.getInstance();
		List<BoardVO>boardlist = service.getBoard_SALO("SALO");
	
		//request에 저장
		request.setAttribute("boardList_SALO", boardlist);

		//view페이지로 이동
		request.getRequestDispatcher("/board/boardList_SALO.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
