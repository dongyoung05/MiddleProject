package kr.or.ddit.controller.board;

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
import kr.or.ddit.service.reply.IReplyService;
import kr.or.ddit.service.reply.ReplyServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ReplyVO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/boardDetailAdmin.do")
public class BoardDetailAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		String board_no = request.getParameter("board_no");
				
	
	
		
		
		
		BoardVO boardVo = service.searchBoardbyBoard_no(board_no);
		
		
		
		// 보드번호를 왜저장하는진 모르지만 함
		request.setAttribute("board_no", board_no);
		
		// 게시판 상세정보에 관한 vo 저장
		request.setAttribute("boardVo", boardVo);
		
		
			
			// 게시판 세부조회로 이동
			request.getRequestDispatcher("/board/boardDetailAdmin.jsp").forward(request, response);
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

	
	

}
