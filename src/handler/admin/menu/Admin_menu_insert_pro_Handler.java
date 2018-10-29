package handler.admin.menu;

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

import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_menu_insert_pro_Handler implements CommandHandler {
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_menu_insert_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Menu_DataBean menu_dto = new Menu_DataBean();
//		menu_dto.setMenu_name(request.getParameter("menu_name"));
//		menu_dto.setMenu_price(Integer.parseInt(request.getParameter("menu_price")));
//		menu_dto.setMenu_image(request.getParameter("menu_image"));
//		menu_dto.setMenu_category(Integer.parseInt(request.getParameter("menu_category")));
//		menu_dto.setMenu_detail(request.getParameter("menu_detail"));
		
//		int result = menu_dao.insertMenu(menu_dto);
//		request.setAttribute("result", result);
		
		// 사진 업로드 //////////////////////////////////////////////////
		String imagePath = request.getRealPath("menu_images");	//경로
		//System.out.println(imagePath);
		//String imagePath= "C:\\ExpertJava\\Muhan\\Muhan\\WebContent\\menu_images";
		int size = 1 * 1024 * 1024;
		String filename = "";
		try {
			MultipartRequest multi = new MultipartRequest(request, imagePath, size, "utf-8",
					new DefaultFileRenamePolicy());

			menu_dto.setMenu_name(multi.getParameter("menu_name"));
			
			menu_dto.setMenu_price(Integer.parseInt(multi.getParameter("menu_price")));
			menu_dto.setMenu_category(Integer.parseInt(multi.getParameter("menu_category")));
			menu_dto.setMenu_detail(multi.getParameter("menu_detail"));
			
			
			Enumeration files = multi.getFileNames();

			String file = (String) files.nextElement();
			filename = multi.getFilesystemName(file);

		} catch (Exception e) {
			e.printStackTrace();
		}

		//썸네일 이미지 생성
//		ParameterBlock pb = new ParameterBlock();
//		
//		System.out.println(1);
//		
//		pb.add(imagePath + "/" + filename);
//		RenderedOp rOp = JAI.create("fileload", pb);
//		BufferedImage bi = rOp.getAsBufferedImage();
//		BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
//
//		Graphics2D g = thumb.createGraphics();
//		g.drawImage(bi, 0, 0, 100, 100, null);
//
//		File file = new File(imagePath + "/sm_" + filename);
//		try {
//			ImageIO.write(thumb, "jpg", file);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		menu_dto.setMenu_image("" + filename);
		//////////////////////////////////////////////////
		
		
		int result = menu_dao.insertMenu(menu_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_menu/admin_menu_insert_pro");
	}

}
