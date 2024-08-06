package kr.or.ddit.controller.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class BoardImageView
 */
@WebServlet("/boardImageView")

public class BoardImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//받아오는 인코딩
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		//서비스 객체 생성
		IBoardService service = BoardServiceImpl.getInstance();
		String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/board";
		String board_no = request.getParameter("board_no");
		System.out.println("board_no : " + board_no + " !!!!!!!!@!@");
		BoardVO boardVo = service.searchBoardbyBoard_no(board_no);
		System.out.println("After VO : " + boardVo + "12312423324r132df1asd2f");
		File file = new  File(uploadPath);
		if(!file.exists()) file.mkdirs();
		
		File imgFile = null;
		System.out.println("img : " + boardVo.getBoard_img() + " ##@#@#@#@#@#@#@#");
		
		if(boardVo.getBoard_img() == null) {
			imgFile = new File(file, "/board_default.jpg");
		} else {
			imgFile = new File(file, boardVo.getBoard_img());
		}
		System.out.println("imgFile #$$$$$$$$$@$@#$@!#@#  : " + imgFile);
		if(imgFile.exists()) {
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
			
			try {
				bout = new BufferedOutputStream(response.getOutputStream());
				
				bin = new BufferedInputStream(new FileInputStream(imgFile));
				
				byte[] temp = new byte[1024];
				int len = 0;
				while((len = bin.read(temp))>0) {
					bout.write(temp,0,len);
				}
				bout.flush();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(bin != null) try {bin.close();} catch (IOException e) {}
				if(bout != null) try {bout.close();} catch (IOException e) {}
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println();
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
