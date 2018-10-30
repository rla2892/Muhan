package db.store_member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Store_member_DBBean implements Store_member_Dao{
	private SqlSession session = SqlMapClient.getSession();
	
	@Override
	public int getCount() {
		return session.selectOne("Store_member.getCount");
	}
	
	@Override
	public int insertStore(Store_member_DataBean store_member_dto) {
		return session.insert("Store_member.insertStore", store_member_dto);
	}
	
	@Override
	public List<Store_member_DataBean> selectStores(Map<String, Integer> map) {
		return session.selectList("Store_member.selectStores", map);
	}
	@Override
	public List<Store_member_DataBean> selectStores2(Map<String,  Object> map) {
		return session.selectList("Store_member.selectStores2", map);
		//성열 -매장 전체출력 및 페이징, 검색 하려고  map 매개변수  Integer->Object로 바꿈. 
	}
	
	@Override
	public int insertCoords(Map<String, Object> map) {
		return session.insert("Store_member.insertCoords", map);
	}
	
	@Override
	public Store_member_DataBean selectStore(String store_id) {
		return session.selectOne("Store_member.selectStore", store_id);
	}
	
	@Override
	public List<Store_member_coords_DataBean> selectStoresWithCoords(Map<String, Object> map) {
		return session.selectList("Store_member.selectStoresWithCoords", map);
	}
	
	@Override
	public int deleteStore(String store_id) {
		return session.delete("Store_member.deleteStore", store_id);
	}
	
	@Override
	public int modifyStore(Store_member_DataBean store_member_dto) {
		return session.update("Store_member.modifyStore", store_member_dto);
	}
	
	@Override
	public int check( String store_id ) {
		return session.selectOne( "Store_member.checkId", store_id );	
	}
	
	@Override
	public int check( String store_id, String store_pw ) {
		int result = 0;
		//rs를 쓸 수가 없어서 위에 sql문을 count로 바꿈.
		if( check(store_id) > 0 ) {
			//아이디가 있다.
			Store_member_DataBean store_member_dto = selectStore(store_id);
			if( store_pw.equals( store_member_dto.getStore_pw() )) {
				result = 1;
			} else {
				result = -1;
			}
		} else {
			//아이디가 없다.
			result = 0;
		}
		return result;
	}
	
	@Override
	public List<Store_member_DataBean> selectStoresByText(Map<String, String> map) {
		return session.selectList("Store_member.selectStoresByText", map);
	}
	@Override
	public List<Store_member_DataBean> selectStoresByText2(Map<String, String> map) {
		return session.selectList("Store_member.selectStoresByText2", map);
	}
	@Override
	public List<Store_member_DataBean> selectStoresByText3(Map<String, Object> map) {
		return session.selectList("Store_member.selectStoresByText3", map);
	}
	@Override
	public int getCountByText(String keyword) {
		return session.selectOne("Store_member.getCountByText", keyword);
	}
	
	@Override
	public List<Store_member_DataBean> selectStoresByName(Map<String, Object> map) {
		return session.selectList("Store_member.selectStoresByName", map);
	}
	@Override
	public int getCountByName(String keyword) {
		return session.selectOne("Store_member.getCountByName", keyword);
	}
	
	//최은혜
	@Override
	public List<Store_member_coords_DataBean> selectLonLat ( String store_id ) {
		return session.selectList( "Store_member.selectLonLat", store_id );
	}
	@Override
	public String getRegDate(String store_id) {
		return session.selectOne("Store_member.getRegDate",store_id);
	}
}
