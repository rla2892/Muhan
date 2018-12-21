package db.store_member;

import java.util.List;
import java.util.Map;

public interface Store_member_Dao {
	public int insertStore( Store_member_DataBean store_member_dto );				//admin 전용. 매장 등록
	public List<Store_member_DataBean> selectStores( Map<String, Integer> map );	//admin 전용. 전체 매장 출력//deprecated
	public List<Store_member_DataBean> selectStores2( Map<String,Object> map );		//admin 전용. 전체 매장 출력
	//성열 -매장 전체출력 및 페이징, 검색 하려고  map 매개변수  Integer->Object로 바꿈. 
	
	public List<Store_member_coords_DataBean> selectStoresWithCoords(Map<String,Object> map);	//cus 전용. 전체 매장 출력+좌표
	
	
	//좌표 넣기
	public int insertCoords(Map<String,Object> map);
	
	
	public Store_member_DataBean selectStore(String store_id);						//admin, store, customer. 상세 매장 출력
	public int deleteStore(String store_id);										//admin 전용. 매장 삭제
	public int modifyStore(Store_member_DataBean store_member_dto);					//admin, store. 매장 수정
	public int getCount();
	
	public int check( String store_id );											//store 전용. 로그인
	public int check( String store_id, String store_pw );							//store 전용. 로그인
	
	public List<Store_member_DataBean> selectStoresByText( Map<String, String> map ); //customer 전용. 주소로 검색. 이거 미침...
	public List<Store_member_DataBean> selectStoresByText2( Map<String, String> map ); //customer 전용. 주소로 검색. 
	public List<Store_member_DataBean> selectStoresByText3( Map<String, Object> map ); //customer 전용. 주소로 검색. 
	public int getCountByText(String keyword);
	
	//매장 검색용
	public List<Store_member_DataBean> selectStoresByName( Map<String, Object> map ); //customer 전용. 매장명으로 검색.
	public int getCountByName(String keyword);
	
	//최은혜
	public List<Store_member_coords_DataBean> selectLonLat( String store_id );		//store 전용 매장 위도 경도 받기
	
	public String getRegDate(String store_id);//store 등록 날짜 가져오기
	
//3차	////////////////////////////////////////////////////////
	//김상진
	public List<Store_member_DataBean> selectStoresAll();	//전체 매장 출력
	
	//장성열
	
	//최은혜
	
	//임상혁
	public List<String> selectCustomer_age(String store_id);
	//손소라
}
