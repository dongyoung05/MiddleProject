package kr.or.ddit.controller.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reply.IReplyService;
import kr.or.ddit.service.reply.ReplyServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ReplyVO;

/**
 * Servlet implementation class ReplyUpdate
 */
@WebServlet("/replyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String board_no = request.getParameter("board_no");
		String reply_no = request.getParameter("reply_no");
		String reply_content = request.getParameter("reply_content");
		
		System.out.println(reply_content+"dddddddddddd");
		
		ReplyVO replyVo = new ReplyVO();
		
		replyVo.setReply_no(reply_no);
		replyVo.setReply_content(reply_content);
		replyVo.setBoard_no(board_no);
		IReplyService service = ReplyServiceImpl.getInstance();
		int cnt = service.updateReply(replyVo);
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

}