package kr.or.ddit.controller.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reply.IReplyService;
import kr.or.ddit.service.reply.ReplyServiceImpl;
import kr.or.ddit.vo.ReplyVO;

/**
 * Servlet implementation class ReplyDelete
 */
@WebServlet("/replyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String board_no = request.getParameter("board_no");
		String reply_no = request.getParameter("reply_no");
		
		IReplyService service = ReplyServiceImpl.getInstance();
		
		ReplyVO param = new ReplyVO();
		
		param.setBoard_no(board_no);
		param.setReply_no(reply_no);
		
		int cnt = service.deleteReply(param);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
