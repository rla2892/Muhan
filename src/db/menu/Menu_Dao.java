package db.menu;

import java.util.List;
import java.util.Map;

public interface Menu_Dao {
	public List<Menu_DataBean> selectMenus();	//admin, customer. 메뉴 전체 출력
	public int insertMenu(Menu_DataBean menu_dto);						//admin 전용. 메뉴 추가
	public int modifyMenu(Menu_DataBean menu_dto);						//admin 전용. 메뉴 수정
	public Menu_DataBean selectMenu(int menu_id);						//admin, customer. 메뉴 상세 정보 출력
	public int deleteMenu(int menu_id);									//admin 전용. 메뉴 삭제
	public List<Menu_DataBean> selectMenusByCategory(Map<String, Integer> map);	//admin, customer. 메뉴 전체 출력. 카테고리별로
	public String selectRecommended (String cus_id);
	public int insertRecommended(Recommended_Menu_DataBean recDto);
}
