package kr.or.ddit.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.board.BoardServiceImpl;
import kr.or.ddit.service.board.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/board/reviewInsert.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50,
		maxFileSize       = 1024 * 1024 * 50,
		maxRequestSize    = 1024 * 1024 * 100
		)
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	추가할 리뷰 정보를 담을 boardVO 객체 생성
		BoardVO boardVo = new BoardVO();
		
		//	서비스 객체 생성
		IBoardService service = BoardServiceImpl.getInstance();
		
		//	ajax에서 전달한 Data 가져오기
		String reserveNo = request.getParameter("reserveNo");
		String orderNo = null;
		if(reserveNo == "" || reserveNo == null) {
			reserveNo = request.getParameter("orderNo");
			orderNo = reserveNo;
			System.out.println("ORDER_NO >>>>>>>>>> " + orderNo);
		} else {
			//	주문번호(order_no) 가져오기
			orderNo = service.findOrderNo(reserveNo);
			System.out.println("ORDER_NO >>>>>>>>>> " + orderNo);
		}
		System.out.println("reviewNo >>>> " + reserveNo);
		String ctgryName = request.getParameter("ctgryName");
		System.out.println("ctgryName >>>> " + ctgryName);
		String title = request.getParameter("title");
		System.out.println("title >>>> " + title);
		String content = request.getParameter("content");
		System.out.println("content >>>> " + content);
		
		
		//	회원 아이디 가져오기
		HttpSession session = request.getSession(false);
		MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
		String memId = memberVo.getMem_id();
		
		//	리뷰 종류 확인하여 게시판 분류값 입력
		String board_ctgry_no = "";
		if("room".equals(ctgryName)) {
			board_ctgry_no = "HOTE";
		}
		if("salon".equals(ctgryName)) {
			board_ctgry_no = "SALO";
		}
		if("prod".equals(ctgryName)) {
			board_ctgry_no = "PROD";
		}
		System.out.println("CTGRY >>>>>>>>>>> " + board_ctgry_no);
		
		//	리뷰 점수 입력
		int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
		boardVo.setReview_score(reviewScore);
		
		//	이미지 파일 여부 확인
//		Part part = request.getPart("board_img");
//		if(part.getSize() < 1) {
//			boardVo.setBoard_img(null);
//		} else {
//			String fileName = extractFileName(part);
//			String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/review";
//			
//			//	File 객체 생성 및 경로의 폴더가 없을 시 생성
//			File file = new File(uploadPath);
//			if(!file.exists()) file.mkdirs();
//			String imgPath = UUID.randomUUID().toString() + "_" + fileName;
//			
//			boardVo.setBoard_img(imgPath);
//			
//			try {
//				part.write(uploadPath + File.separator + imgPath);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		//	FormData boardVo에 입력
		boardVo.setBoard_title(title);
		boardVo.setBoard_content(content);
		boardVo.setReview_score(reviewScore);
		boardVo.setBoard_ctgry_no(board_ctgry_no);
		boardVo.setMem_id(memId);
		boardVo.setOrder_no(orderNo);
		
		int cnt = service.insertReview(boardVo);
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

//	private String extractFileName(Part part) {
//		String fileName = "";
//		
//		//	헤더의 키 값이 'content-disposition' 인 헤더의 Value 값 구하기
//		String headerValue = part.getHeader("content-disposition");
//		String[] itemArr = headerValue.split(";");
//		
//		for(String item : itemArr) {
//			if(item.trim().startsWith("filename")) {		//	'filename' 찾기 
//				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
//			}
//		}
//		return fileName;
//	}
}
