package kr.or.ddit.controller.admin;

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

import kr.or.ddit.service.notice.INoticeService;
import kr.or.ddit.service.notice.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;

/**
 * Servlet implementation class NoticeUpdateAdmin
 */
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50,		//	10mb 로 설정하고 싶을 때
		maxFileSize       = 1024 * 1024 * 50,
		maxRequestSize    = 1024 * 1024 * 100
		)
@WebServlet("/noticeUpdateAdmin.do")
public class NoticeUpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 가져온 데이터들 인코딩해주기
		request.setCharacterEncoding("UTF-8");
		
		// 파람값 넣어줄 vo만들어주기
		NoticeVO paramNotice = new NoticeVO();
		
		// 빈유틸로 폼 다 저장하기
		try {
			BeanUtils.populate(paramNotice, request.getParameterMap());
		} catch (IllegalAccessException e) {
		
			e.printStackTrace();
		} catch (InvocationTargetException e) {
		
			e.printStackTrace();
		}
		
	//	이미지 등록을 위한 추가처리
		Part part = request.getPart("notice_img");
		String fileName = extractFileName(part);
		String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/notice";
	
		if(part.getSize() < 1) {
			paramNotice.setNotice_img(null);
		} else {
//					File 객체 생성 및 경로 없을 시 생성
			File file = new File(uploadPath);
			if(!file.exists()) file.mkdirs();
			
			String imgPath = UUID.randomUUID().toString() + "_" + fileName;
			
			paramNotice.setNotice_img(imgPath);
			
			try {
				part.write(uploadPath + File.separator + imgPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 서비스 객체 만들기
		INoticeService service = NoticeServiceImpl.getInstance();
		
		// db에 값 보내기, 업뎃문이라 성공은1, 실패는 0 나옴
		int cnt = service.updateNotice(paramNotice);
		
		System.out.println("성공했냐     @@@@@@@@@@@@ "+cnt);
		// 업뎃에 성공하면 디테일 두로 다시 보내준다...
		request.getRequestDispatcher("noticeDetailAdmin.do?notice_no="+paramNotice.getNotice_no()).forward(request, response);
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
