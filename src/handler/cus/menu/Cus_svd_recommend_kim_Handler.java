package handler.cus.menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import db.menu.Svd_s_DataBean;
import db.menu.Svd_u_DataBean;
import db.menu.Svd_v_DataBean;
import db.order_history.Order_history_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_svd_recommend_kim_Handler implements CommandHandler{
	
	//맵 정렬
	public static <K, V extends Comparable<? super V>> Map<K, V> sortByValue(Map<K, V> map) {
        List<Entry<K, V>> list = new ArrayList<>(map.entrySet());
        list.sort(Entry.comparingByValue());

        Map<K, V> result = new LinkedHashMap<>();
        for (Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }

        return result;
    }
	
	//행렬 곱
	public static Double[][] dot_matrix(Double[][] A, Double[][] B) {
        int aRows = A.length;
        int aColumns = A[0].length;
        int bRows = B.length;
        int bColumns = B[0].length;

        if (aColumns != bRows) {
            throw new IllegalArgumentException("A:Rows: " + aColumns + " did not match B:Columns " + bRows + ".");
        }

        Double[][] C = new Double[aRows][bColumns];
        for (int i = 0; i < aRows; i++) {
            for (int j = 0; j < bColumns; j++) {
                C[i][j] = 0.00000;
            }
        }

        for (int i = 0; i < aRows; i++) { // aRow
            for (int j = 0; j < bColumns; j++) { // bColumn
                for (int k = 0; k < aColumns; k++) { // aColumn
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }

        return C;
    }
	
	@Resource
	private Menu_Dao menu_dao;
	@Resource
	private Order_history_Dao order_history_dao;
	
	@Override
	@RequestMapping("cus_svd_recommend_kim")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String cus_id=(String)request.getSession().getAttribute("cus_id");
		System.out.println("cus_id : "+cus_id);
		System.out.println(cus_id==null);
		if(cus_id==null) {
			try {
				response.sendRedirect("cus_menu.do?menu_category=4,5");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//DB에서 svd 결과 행렬 가져오기
		List<Svd_s_DataBean> svd_s_dtos=menu_dao.select_svd_s();
		List<Svd_u_DataBean> svd_u_dtos=menu_dao.select_svd_u(cus_id);
		List<Svd_v_DataBean> svd_v_dtos=menu_dao.select_svd_v();
		
		//행렬 u
		Double[][] u_matrix= {{svd_u_dtos.get(0).getWeight1(),svd_u_dtos.get(0).getWeight2()}}; 
		//행렬 s 초기화
		Double[][] s_matrix= {{0.0,0.0},{0.0,0.0}}; 
		//행렬 s 만들기
		for(int i=0;i<svd_s_dtos.size();i++) {
			s_matrix[i][i]= svd_s_dtos.get(i).getDiag_val();
		}
		//행렬 u와 s 곱하기
		Double[][] uxs_matrix= dot_matrix(u_matrix, s_matrix);
		
		//행렬 v
		Double[][] v_matrix = new Double[2][svd_v_dtos.size()];
		for(int i=0;i<svd_v_dtos.size();i++) {
			v_matrix[0][i]=svd_v_dtos.get(i).getWeight1();
			v_matrix[1][i]=svd_v_dtos.get(i).getWeight2();
		}
		
		//행렬 u와s와v 곱하기
		Double[][] uxsxv_matrix= dot_matrix(uxs_matrix, v_matrix);
		//System.out.println("usv 행렬 연산 결과");
		//for(int i=0;i<uxsxv_matrix[0].length;i++) {
		//	System.out.print(uxsxv_matrix[0][i]);
		//	System.out.print(", ");
		//}
		//System.out.println();
		
		//메뉴 id 배열 만들기
		int[] menu_ids = new int[svd_v_dtos.size()];
		for(int i=0;i<svd_v_dtos.size();i++) {
			menu_ids[i]=svd_v_dtos.get(i).getMenu_id();
		}
		
		//내 현재 주문 기록 가져오기
		List<Integer> counts_of_menu=order_history_dao.selectCountOfMenu(cus_id);
		for(int i=0; i<counts_of_menu.size(); i++){
			//System.out.println(counts_of_menu.get(i));
		}
		
		//메뉴 id와 평가점수 합친 맵 만들기
		Map<Integer,Double> menu_ratings = new HashMap<Integer,Double>();
		for(int i=0;i<menu_ids.length;i++) {
			menu_ratings.put(menu_ids[i], uxsxv_matrix[0][i]-counts_of_menu.get(i));
		}
		
		//System.out.println("평가점수");
		//for(int i=0;i<menu_ratings.size();i++) {
		//	System.out.print(menu_ratings.get(i+1));
		//	System.out.print(", ");
		//}
		//System.out.println();
		
		
		//정렬 전 키값들
		System.out.println(menu_ratings.keySet());
		
		//값 기준으로 정렬
		LinkedHashMap<Integer,Double> menu_ratings_sorted = (LinkedHashMap<Integer, Double>) sortByValue(menu_ratings);
		//정렬 후 키들
		//System.out.println(menu_ratings_sorted.keySet());

		//정렬 후 키들
		Object[] sorted_key = menu_ratings_sorted.keySet().toArray();
		
		//정류 후  키와 밸류들
		System.out.println("정렬 후 밸류들");
		for(int i=0; i<sorted_key.length; i++) {
			System.out.print(((int) sorted_key[i])+" : "+menu_ratings_sorted.get((int) sorted_key[i]));
			System.out.print(", ");
		}
		System.out.println();
		
		//추천된 메뉴들
		List<Menu_DataBean> menus = new ArrayList<Menu_DataBean>();
		
		for(int i=0;i<5;i++) {
			int menu_id = (int) sorted_key[sorted_key.length-1-i];
			Menu_DataBean selected_menu =menu_dao.selectMenu(menu_id);
			menus.add(selected_menu);		
		}
		
		request.setAttribute("menus", menus);
		
		return new ModelAndView("/cus/cus_menu/cus_svd_recommend_kim");
	}
}
