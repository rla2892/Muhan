package db.order_history;

import java.util.List;
import java.util.Map;

public interface Order_history_Dao {
	//public int insertOrder(Order_history_DataBean order_history_dto);						//customer 전용. 주문 
	public int insertOrder(Order_history_DataBean order_history_dto);										//customer 전용. 주문 
	public int getMaxOrder_no();															//customer 전용. 주문 번호 최대값 구하기
	
	public List<Order_history_DataBean> selectOrders(Map<String,String> map);				//admin 전용. 전체 주문 리스트 출력
	public List<Order_history_DataBean> selectOrdersByCus(Map<String,String> map);	 		//customer 전용. 자기 주문 출력
	public List<Order_history_DataBean> selectOrdersByStore(Map<String,String> map);		//store 전용. 자기 주문 출력
	public List<Order_history_DataBean> selectOrder(int order_no);							//customer, store. 해당 주문 정보 1개 출력
	
	public Order_info_DataBean selectOrderInfo(int order_no);								//customer, store. 해당 주문 정보에 대한 신상 정보 1개 출력
	public List<Order_history_DataBean_for_store2> selectOrderDetail(int order_no);						//customer, store. 해당 주문 메뉴 정보 출력
	public int selectPay(int order_no);														//customer 전용. 총 가격 출력
	
	///// 최은혜
	public int checkOrders( Map<String, String> map );
	public List<Order_history_DataBean_for_store2> selectOrderDetails ( Map<String, String> map2 );
	public List<Order_history_DataBean_for_store1> selectOrdersByDate ( Map<String, String> map );
	public int updateOrderStatus( Map<String, String> map );
	public int confirmOrderStatus( Map<String, String> map );	
	
	//추가!!
	public List<Order_history_DataBean_for_Cuslist> selectOrdersByCuslist ( String cus_id );//customer 전용
	public int selectCountOrdersByCus( String cus_id );										//customer 전용
	public int selectCountOrder( int order_no );
	public List<Order_history_DataBean_for_store2> selectDetailedOrdersByCuslist ( int order_no );
	
	//store 전용. 주문 상태 바꾸기
	
	// HY 추가
//	public List<Order_history_DataBean_for_Alarm> checkOrderStatus(String cus_id);						// customer 전용. 주문 상태 출력.
	public Order_history_DataBean_for_Alarm checkOrderStatus(String cus_id);						// customer 전용. 주문 상태 출력.
	public int ajaxUpdateOrderStatus(int order_no);													// customer 전용. 주문 상태 4로 업데이트.
	
	// 3차 프로젝트 부분	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 김상진
	public List<Order_history_DataBean_for_recieve> selectOrdersAll();	//전체 가져오기
	public List<Order_history_DataBean_for_recieve> selectOrdersAllToday();	//오늘만 가져오기
	public List<Order_history_DataBean_for_recieve> selectOrdersAllMonth();	//이번달 가져오기
	public List<Order_history_DataBean_for_recieve> selectOrdersAllYear();	//이번해 가져오기
	
	
	// 최은혜
	
	// 장성열
	
	// 임상혁
	
	// 손소라
}

