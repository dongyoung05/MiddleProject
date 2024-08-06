package kr.or.ddit.controller.reply;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.service.reply.IReplyService;
import kr.or.ddit.service.reply.ReplyServiceImpl;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ReplyVO;

/**
 * Servlet implementation class BoardInsert
 */
@WebServlet("/replyInsert.do")


public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 받아오는 데이터 인코딩
		request.setCharacterEncoding("utf-8");
		// 가져온 데이터를 담을 VO객체
		ReplyVO replyVo = new ReplyVO();

		  try {
			   BeanUtils.populate(replyVo, request.getParameterMap());
		  } catch (IllegalAccessException e) {
			  e.printStackTrace();
		  } catch (InvocationTargetException e) {
			  e.printStackTrace();
		  }
		   
		System.out.println("@@@@@@@ : " + replyVo); 
		// 서비스 객체 얻기
		IReplyService service = ReplyServiceImpl.getInstance();
		
		// 서비스 메소드 호출 -결과값 가져오기
		int cnt = service.insertReply(replyVo);
		
		// 결과값을 request에 저장
		request.setAttribute("cnt", cnt);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}
	
}
