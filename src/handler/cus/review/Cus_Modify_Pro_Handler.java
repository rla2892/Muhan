package handler.cus.review;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.review.Review_Dao;
import db.review.Review_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Modify_Pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@Override
	@RequestMapping("cus_modify_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Review_DataBean review_dto= new Review_DataBean();
		// 사진 업로드 //////////////////////////////////////////////////
		String imagePath = request.getRealPath("review_images");	//경로
		//System.out.println(imagePath);
		//String imagePath= "C:\\ExpertJava\\Muhan\\Muhan\\WebContent\\menu_images";
		int size = 1 * 1024 * 1024;
		String filename = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, imagePath, size, "utf-8",
					new DefaultFileRenamePolicy());
			int review_no = Integer.parseInt(multi.getParameter("review_no"));
			review_dto = review_dao.selectReview(review_no);
			review_dto.setReview_subject(multi.getParameter("review_subject"));
			review_dto.setReview_content(multi.getParameter("review_content"));
			review_dto.setReview_score(Integer.parseInt(multi.getParameter("review_score")));
			
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			filename = multi.getFilesystemName(file);
			if("".equals(filename) || filename == null) {
				filename = multi.getParameter("review_image");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		review_dto.setReview_image(filename);
		
		//int result = review_dao.insertReview(review_dto);
		int result = review_dao.modifyReview(review_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("/cus/cus_review/cus_modify_pro");
	}
}