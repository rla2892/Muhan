package handler.cus.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.review.Review_Dao;
import db.review.Review_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Review_Pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("cus_review_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		/*페이지 단 처리*/
		
		int pageSize=7; // 고정값
		int pageBlock=3;
		
		int count=0;
		int start=0;
		int end=0;
		
		String pageNum=null;
		int currentPage=0;
		int number=0;
		
		int startPage=0;
		int endPage=0;
		int pageCount=0;
		int searched=1;
		
		pageNum=request.getParameter("pageNum");
		
		if(pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		
		currentPage=Integer.parseInt(pageNum);
		
		/*넘어온 옵션 값으로 처리*/
		String selectSearchOption=request.getParameter("selectSearchOption");
		String keyword=request.getParameter("searchbar");
		
		// POST 방식일떄만 필요한 String 처리:
/*		byte[] bytes1=selectSearchOption.getBytes(StandardCharsets.ISO_8859_1);
		selectSearchOption=new String(bytes1, StandardCharsets.UTF_8);
		byte[] bytes2=keyword.getBytes(StandardCharsets.ISO_8859_1);
		keyword=new String(bytes2, StandardCharsets.UTF_8);*/
		System.out.println(selectSearchOption);
		System.out.println(keyword);
		
		Map<String, String> keyMap=new HashMap<String,String>();
		keyMap.put("keyword", keyword);
		
		Map<String, String> keyMap2=new HashMap<String,String>();
		keyMap2.put("keyword", keyword);
		keyMap2.put("keyword2", keyword);
		
		if(selectSearchOption.equals("제목")) {
			int searchBySubjectCount=reviewDao.getSearchBySubjectCount(keyMap);

			if(searchBySubjectCount>0) {
				count=searchBySubjectCount;
			}
			
		} else if(selectSearchOption.equals("내용")) {
			int searchByContentCount=reviewDao.getSearchByContentCount(keyMap);
			
			if(searchByContentCount>0) {
				count=searchByContentCount;
			}
			
		} else if(selectSearchOption.equals("제목+내용")) {
			int searchBySubConCount=reviewDao.getSearchBySubConCount(keyMap2);
			
			if(searchBySubConCount>0) {
				count=searchBySubConCount;
			}
		}
		
		pageCount=count/pageSize+(count%pageSize>0? 1:0);
		
		if(currentPage>pageCount) {
			currentPage=pageCount;
		}
		
		start=(currentPage-1)*pageSize+1;
		end=start+pageSize-1;
		
		if(end>count) {
			end=count;
		}
		
		number=count-(currentPage-1)*pageSize;
		startPage=(currentPage/pageBlock)*pageBlock+1;
		
		if(currentPage%pageBlock==0) {
			startPage-=pageBlock;
		}
		
		endPage=startPage+pageBlock-1;
		
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		request.setAttribute("count", count);
		request.setAttribute("searched", searched);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("selectSearchOption", selectSearchOption);
		request.setAttribute("keyword", keyword);

		Map<String, String> map=new HashMap<String, String>();
		
		String startString=String.valueOf(start);
		String endString=String.valueOf(end);
		
		map.put("keyword", keyword);
		map.put("start", startString);
		map.put("end", endString);
		
		Map<String, String> map2=new HashMap<String, String>();
		
		map2.put("keyword", keyword);
		map2.put("keyword2", keyword);
		map2.put("start", startString);
		map2.put("end", endString);
		
		if(selectSearchOption.equals("제목")) {
			List<Review_DataBean> searchResults=reviewDao.searchReviewBySubject(map);
			request.setAttribute("articles", searchResults);	
		} else if(selectSearchOption.equals("내용")) {
			List<Review_DataBean> searchResults=reviewDao.searchReviewByContent(map);
			request.setAttribute("articles", searchResults);
		} else if(selectSearchOption.equals("제목+내용")) {
			List<Review_DataBean> searchResults=reviewDao.searchReviewBySubCon(map2);
			request.setAttribute("articles", searchResults);
		}

		return new ModelAndView("/cus/cus_review/cus_review");
	}
}