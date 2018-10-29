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
public class Admin_menu_modify_pro_Handler implements CommandHandler {
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_menu_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		// 사진 업로드 //////////////////////////////////////////////////
		String imagePath = request.getRealPath("menu_images");	//경로
		//System.out.println(imagePath);
		//String imagePath= "C:\\ExpertJava\\Muhan\\Muhan\\WebContent\\menu_images";
		int size = 1 * 1024 * 1024;
		String filename = "";
		try {
			MultipartRequest multi = new MultipartRequest(request, imagePath, size, "utf-8",
					new DefaultFileRenamePolicy());
			
			int menu_id = Integer.parseInt(multi.getParameter("menu_id"));
			
			Menu_DataBean menu_dto = menu_dao.selectMenu(menu_id);
			
			
			menu_dto.setMenu_name(multi.getParameter("menu_name"));
			
			menu_dto.setMenu_price(Integer.parseInt(multi.getParameter("menu_price")));
			menu_dto.setMenu_category(Integer.parseInt(multi.getParameter("menu_category")));
			menu_dto.setMenu_detail(multi.getParameter("menu_detail"));
			
			
			Enumeration files = multi.getFileNames();

			String file = (String) files.nextElement();
			filename = multi.getFilesystemName(file);
			if("".equals(filename) || filename == null) {
				filename = multi.getParameter("menu_image");
			}
			menu_dto.setMenu_image("" + filename);
			
			int result = menu_dao.modifyMenu(menu_dto);
			request.setAttribute("result", result);
			
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
		
		
		//////////////////////////////////////////////////
		
		
		
		return new ModelAndView("admin/admin_menu/admin_menu_modify_pro");
	}

}
