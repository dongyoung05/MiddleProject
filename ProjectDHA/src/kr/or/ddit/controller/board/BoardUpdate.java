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
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/boardUpdate.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 10mb 로 설정하고 싶을 때
maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 100)
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//받아오는 데이터 인코딩
		request.setCharacterEncoding("utf-8");
		
		BoardVO boardVo = new BoardVO();
		String board_no = request.getParameter("board_no"); 
		Part part = request.getPart("board_img");
		System.out.println(board_no + "update@!!@!#!@#!@#!@#");
		//서비스 객체 얻기 
		IBoardService service = BoardServiceImpl.getInstance();
		
		//기존 파일이 있으면 삭제
		BoardVO deleteVo = service.searchBoardbyBoard_no(board_no);
		String deleteFileName = deleteVo.getBoard_img();
		
		//이미지 파일 여부 확인
		if((part.getSize()<1) && (deleteFileName == null)) {
			boardVo.setBoard_img(deleteFileName);
		} else if((deleteFileName != null) && (part.getSize() <1)) {
			boardVo.setBoard_img(deleteFileName);
		} else {
			String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/board";
			
			File deleteFile = new File(uploadPath+File.separator+deleteFileName);
			if(deleteFile.exists()) deleteFile.delete();
			
//			File 객체 생성 및 경로의 폴더가 없을 시 생성
			String updateFileName = extractFileName(part);
			File file = new File(uploadPath);
			if(!file.exists()) file.mkdirs();
			String imgPath = UUID.randomUUID().toString() + "_" + updateFileName;
			
			boardVo.setBoard_img(imgPath);
			
			try {
				part.write(uploadPath + File.separator + imgPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		try {
			BeanUtils.populate(boardVo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//System.out.println(boardVo + "    <== update!@#!@#!$!");
		
		boardVo.setBoard_no(board_no);
		service.updateBoard(boardVo);
					
		//System.out.println(boardVo + "    <== updateAfter1231233!@#!@#!$!");
		System.out.println("board_no: " + board_no);
		
		//서비스 메소드 호출 -결과값 가져오기
		request.setAttribute("board_no", board_no);
		
		//뷰페이지로 이동
		request.getRequestDispatcher("/boardDetail.do").forward(request, response);
				
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

}


