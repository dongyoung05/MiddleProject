package kr.or.ddit.controller.member;

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

/**
 * Servlet implementation class MypageReview
 */
@WebServlet("/mypageReview.do")
public class MypageReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("memId");

		IBoardService service = BoardServiceImpl.getInstance();
		
		List<BoardVO> reviewList = new ArrayList<BoardVO>();
		
		reviewList = service.mypageReview(mem_id);
		
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("/view/reviewList.jsp").forward(request, response);
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
