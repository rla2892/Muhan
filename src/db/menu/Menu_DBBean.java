package db.menu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Menu_DBBean implements Menu_Dao{
	private SqlSession session = SqlMapClient.getSession();
	
	@Override
	public List<Menu_DataBean> selectMenus() {
		return session.selectList("Menu.selectMenus");
	}
	
	@Override
	public int insertMenu(Menu_DataBean menu_dto) {
		return session.insert("Menu.insertMenu", menu_dto);
	}
	
	@Override
	public int modifyMenu(Menu_DataBean menu_dto) {
		return session.update("Menu.modifyMenu", menu_dto);
	}
	
	@Override
	public Menu_DataBean selectMenu(int menu_id) {
		return session.selectOne("Menu.selectMenu", menu_id);
	}
	
	@Override
	public int deleteMenu(int menu_id) {
		return session.delete("Menu.deleteMenu", menu_id);
	}
	
	@Override
	public List<Menu_DataBean> selectMenusByCategory(Map<String, Integer> map) {
		return session.selectList("Menu.selectMenusByCategory", map);
	}
}
