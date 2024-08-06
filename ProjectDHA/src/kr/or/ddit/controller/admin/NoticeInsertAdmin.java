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
 * Servlet implementation class NoticeInsertAdmin
 */

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50,		//	10mb 로 설정하고 싶을 때
		maxFileSize       = 1024 * 1024 * 50,
		maxRequestSize    = 1024 * 1024 * 100
		)
@WebServlet("/noticeInsertAdmin.do")
public class NoticeInsertAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		NoticeVO paramNotice = new NoticeVO();
		
		try {
			BeanUtils.populate(paramNotice, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		이미지 등록을 위한 추가처리
		Part part = request.getPart("notice_img");
		String fileName = extractFileName(part);
		String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/notice";
	
		if(part.getSize() < 1) {
			paramNotice.setNotice_img(null);
		} 
		else {
//			File 객체 생성 및 경로 없을 시 생성
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
	
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int cnt = service.insertNotice(paramNotice);
		
		if(cnt > 0) {
			System.out.println("작업 성공 햇어");
		} else {
			System.out.println("작업 실패");
		}
		
		request.getRequestDispatcher("noticeListAdmin.do").forward(request, response);
		
		
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
