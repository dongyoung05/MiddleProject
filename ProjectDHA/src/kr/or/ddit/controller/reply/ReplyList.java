package kr.or.ddit.controller.reply;

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
 * Servlet implementation class BoardList
 */
@WebServlet("/replyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String board_no = request.getParameter("board_no");
			
		System.out.println("reply list  board_no  ---------------------------" + board_no );
		// 게시글 조회할때 댓글도 출력해야함
		// 댓글 VO객체 생성
		//ReplyVO replyVo = new ReplyVO();
		
		// 댓글 서비스 연결
		IReplyService replyService = ReplyServiceImpl.getInstance();
		
		// 조회할 보드넘버를 vo에 넣어줌
		//replyVo.setBoard_no(board_no);
		
		// 댓글들을 담을 리스트 객체 생성
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();
		
		// 쿼리문 연결
		replyList = replyService.searchReplyBoard_no(board_no);
		
		// 값이 들어간 댓글리스트를 request객체에 저장
		request.setAttribute("replyList", replyList);
		
		//view페이지로 이동
		request.getRequestDispatcher("/reply/view/replyList.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}