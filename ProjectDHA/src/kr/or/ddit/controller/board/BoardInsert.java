package kr.or.ddit.controller.board;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class BoardInsert
 */
@WebServlet("/boardInsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50, // 10mb 로 설정하고 싶을 때
		maxFileSize = 1024 * 1024 * 50, 
		maxRequestSize = 1024 * 1024 * 100)

public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 받아오는 데이터 인코딩
		request.setCharacterEncoding("utf-8");
		//로그인 정보를 불러올 세션 호출
		HttpSession session = request.getSession();
		MemberVO  memberVo = (MemberVO) session.getAttribute("loginMember");
		//회원아이디를 읽어오기
		String mem_id = memberVo.getMem_id();
		
		// 가져온 데이터를 담을 VO객체
		BoardVO boardVo = new BoardVO();
		boardVo.setMem_id(mem_id);
		
		
		Part part = request.getPart("board_img");
		
		if(part.getSize()<1) {
			boardVo.setBoard_img(null);
		} else {
			String fileName = extractFileName(part);
			String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/board";
			
			File file = new File(uploadPath);
			if(!file.exists())file.mkdirs();
			String imgPath = UUID.randomUUID().toString() + "_"+fileName;
			
			boardVo.setBoard_img(imgPath);
			
			try {
				part.write(uploadPath+File.separator+imgPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		  try {
			   BeanUtils.populate(boardVo, request.getParameterMap());
		  } catch (IllegalAccessException e) {
			  e.printStackTrace();
		  } catch (InvocationTargetException e) {
			  e.printStackTrace();
		  }
		   
			

		// 서비스 객체 얻기
		IBoardService service = BoardServiceImpl.getInstance();
		// 서비스 메소드 호출 -결과값 가져오기
		service.insertBoard(boardVo);
		

		
		// 결과값을 request에 저장
		
		// view페이지로 이동
		request.getRequestDispatcher("/boardList_QUES.do").forward(request, response);
	}

	
	
	private String extractFileName(Part part) {
		String fileName = "";
		
		//	헤더의 키 값이 'content-disposition' 인 헤더의 Value 값 구하기
		String headerValue = part.getHeader("content-disposition");
		String[] itemArr = headerValue.split(";");
		
		for(String item : itemArr) {
			if(item.trim().startsWith("filename")) {		//	'filename' 찾기 
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return fileName;
	}
	
	 private MemberVO getMemberVO(String mem_id) {
		 return new MemberVO(); 
	 }
	 

}
