package db.order_history;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Order_history_DBBean implements Order_history_Dao {
	private SqlSession session = SqlMapClient.getSession();
	
	@Override
	public List<Order_history_DataBean> selectOrders(Map<String, String> map) {
		return session.selectList("Order_history.selectOrders", map);
	}
	
	@Override
	public List<Order_history_DataBean> selectOrdersByCus(Map<String, String> map) {
		return session.selectList("Order_history.selectOrdersByCus", map);
	}

	@Override
	public List<Order_history_DataBean> selectOrdersByStore(Map<String, String> map) {
		return session.selectList("Order_history.selectOrdersByStore", map);
	}
	
	@Override
	public List<Order_history_DataBean> selectOrder(int order_no) {
		return session.selectList("Order_history.selectOrder", order_no);
	}
	
	@Override
	public Order_info_DataBean selectOrderInfo(int order_no) {
		return session.selectOne("Order_history.selectOrderInfo", order_no);
	}
	
	@Override
	public List<Order_history_DataBean_for_store2> selectOrderDetail(int order_no) {
		return session.selectList("Order_history.selectOrderDetail", order_no);
	}
	
	@Override
	public int selectPay(int order_no) {
		ArrayList<Order_history_DataBean_for_store2> order_menus = (ArrayList<Order_history_DataBean_for_store2>) selectOrderDetail(order_no);
		int sum=0;
		for(int i =0; i<order_menus.size(); i++) {
			sum += order_menus.get(i).getMenu_price()*order_menus.get(i).getOrder_qnt();
		}
		return sum;
	}

	//김상진 order 넣기
	@Override
	public int insertOrder(Order_history_DataBean order_history_dto) {
		return session.insert("Order_history.insertOrder", order_history_dto);
	}
	@Override
	public int getMaxOrder_no() {
		return session.selectOne("Order_history.getMaxOrder_no");
	}
	
		
	///////// 최은혜
	public int checkOrders( Map<String, String> map ) {
		return session.selectOne("Order_history.checkOrders", map );
	}
	public List<Order_history_DataBean_for_store2> selectOrderDetails ( Map<String, String> map2 ){
		return session.selectList("Order_history.selectOrderDetails", map2 );
	}
	
	public List<Order_history_DataBean_for_store1> selectOrdersByDate ( Map<String, String> map ){
		session.flushStatements();
		session.clearCache();
		return session.selectList("Order_history.selectOrdersByDate", map );
	}
	@Override
	public int updateOrderStatus(Map<String, String> map) {
		return session.update("Order_history.updateOrderStatus", map );
	}
	
	public int confirmOrderStatus(Map<String, String> map) {
		return session.update("Order_history.confirmOrderStatus", map );
	}
	
	public List<Order_history_DataBean_for_Cuslist> selectOrdersByCuslist ( String cus_id ) {
		return session.selectList( "Order_history.selectOrdersByCuslist", cus_id );
	}
	public int selectCountOrdersByCus( String cus_id ) {
		return session.selectOne( "Order_history.selectCountOrdersByCus", cus_id );
	}
	public int selectCountOrder( int order_no ) {
		return session.selectOne( "Order_history.selectCountOrder", order_no );
	}
	public List<Order_history_DataBean_for_store2> selectDetailedOrdersByCuslist( int order_no ) {
		return session.selectList( "Order_history.selectDetailedOrdersByCuslist", order_no );
	}
	
	// HY 추가
	//public List<Order_history_DataBean_for_Alarm> checkOrderStatus(String cus_id) {
	public Order_history_DataBean_for_Alarm checkOrderStatus(String cus_id) {
		session.flushStatements();
	    session.clearCache();
		return session.selectOne("Order_history.checkOrderStatus", cus_id);
		//return session.selectList("Order_history.checkOrderStatus", cus_id);
	}

	public int ajaxUpdateOrderStatus(int order_no) {
		return session.update("Order_history.ajaxUpdateOrderStatus", order_no);
	}
	
////////// 3차 프로젝트 부분	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 김상진
	@Override
	public List<Order_history_DataBean_for_recieve> selectOrdersAll() {
		return session.selectList("Order_history.selectOrdersAll");
	}
	@Override
	public List<Order_history_DataBean_for_recieve> selectOrdersAllToday() {
		return session.selectList("Order_history.selectOrdersAllToday");
	}
	@Override
	public List<Order_history_DataBean_for_recieve> selectOrdersAllMonth() {
		return session.selectList("Order_history.selectOrdersAllMonth");
	}
	@Override
	public List<Order_history_DataBean_for_recieve> selectOrdersAllYear() {
		return session.selectList("Order_history.selectOrdersAllYear");
	}
	@Override
	public List<Order_history_car_DataBean> selectCarLocations(int order_no) {
		return session.selectList("Order_history.selectCarLocations",order_no);
	}
	@Override
	public int insertCarLocation(Order_history_car_DataBean order_history_car_dto) {
		return session.insert("Order_history.insertCarLocation", order_history_car_dto);
	}
	
	// 최은혜
	public List<Order_history_DataBean_for_store_Timegraph> selectOrdersForDayByStore( String store_id ) {
		return session.selectList("Order_history.selectOrdersForDayByStore", store_id );
	}
	public List<Order_history_DataBean_for_store_Timegraph> selectOrdersForMonthByStore( Map<String, String> map ) {
		return session.selectList("Order_history.selectOrdersForMonthByStore", map );
	}
	public List<Order_history_DataBean_for_store_Timegraph> selectOrdersForYearByStore ( Map<String, String> map ) {
		return session.selectList("Order_history.selectOrdersForYearByStore", map );
	}
	// 장성열
	
	// 임상혁
	
	// 손소라
	@Override
	public List<Order_history_DataBean_for_graph> selectOrdersStatusByStore(Map<String, String> map) {
		return session.selectList("Order_history.selectStoreOrder",map);
	}

	@Override
	public List<Order_history_DataBean_for_graph> selectMonthSalesbyCat(Map<String, String> map) {
		return session.selectList("Order_history.selectMonthSalesbyCat",map);
	}	
}
