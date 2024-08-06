package kr.or.ddit.controller.prod;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/imageView.do")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//	서비스 객체 생성
		IProdService service = ProdServiceImpl.getInstance();
		String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/prod";
		String prod_no = request.getParameter("prod_no");
		ProdVO prodVo = service.getSelectProd(prod_no);
		
		File file = new File(uploadPath);
		if(!file.exists()) file.mkdirs();
		
		File imgFile = null;
		
		if(prodVo.getProd_img() == null) {
			imgFile = new File(file, "/prod_default.jpg");
		} else {
			imgFile = new File(file, prodVo.getProd_img());
		}
		
		if(imgFile.exists()) {
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
			
			try {
				bout = new BufferedOutputStream(response.getOutputStream());
				
				bin = new BufferedInputStream(new FileInputStream(imgFile));
				
				byte[] temp = new byte[1024];
				int len = 0;
				while( (len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
				
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if(bin  != null) try { bin.close();  } catch (IOException e) { }
				if(bout != null) try { bout.close(); } catch (IOException e) { }
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().println();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
