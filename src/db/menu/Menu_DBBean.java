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
	
	public String selectRecommended(String cus_id) {
		return session.selectOne("Menu.selectRecommended", cus_id);
	}
	
	public int insertRecommended( Recommended_Menu_DataBean recDto ) {
		return session.insert("Menu.insertRecommended", recDto);
	}
	public int deleteRecommended(String cus_id) {
		return session.delete("Menu.deleteRecommended", cus_id);
	}
	
	@Override
	public List<Svd_s_DataBean> select_svd_s() {
		return session.selectList("Menu.select_svd_s");
	}
	@Override
	public List<Svd_u_DataBean> select_svd_u(String cus_id) {
		return session.selectList("Menu.select_svd_u",cus_id);
	}
	@Override
	public List<Svd_v_DataBean> select_svd_v() {
		return session.selectList("Menu.select_svd_v");
	}
}
