package db.customer_member;

import java.util.List;
import java.util.Map;

public interface Customer_member_Dao {
	public int getCount();
	public List<Customer_member_DataBean> selectCustomers(Map<String, Integer> map);	//admin 전용. 고객회원 리스트 형태로 출력
	public List<Customer_member_DataBean> selectCustomers2(Map<String, Integer> map);	//admin 전용. 고객회원 리스트 형태로 출력
	public List<Customer_member_DataBean> selectCustomersByAddress(Map<String, Object> map);	//admin 전용. 고객회원 리스트 형태로 출력
	
	public Customer_member_DataBean selectCustomer(String cus_id);						//admin, customer. 고객회원 상세정보 출력 + 고객회원 로그인
	public int modifyCustomer(Customer_member_DataBean customer_member_dto);			//admin, customer. 고객회원 정보 수정
	public int insertBlack(String cus_id);												//admin, 전용. 고객 회원 블랙.
	public int deleteBlack(String cus_id);												//admin, 전용. 고객 회원 블랙.
	public int countReport(String cus_id);												//admin, 전용. 고객 회원 신고횟수 출력. 신고 당한 사람
	public int countReportByCus(String cus_id);											//admin, 전용. 고객 회원 신고횟수 출력. 신고 한 사람
	public int checkBlack(String cus_id);												//admin, 전용. 고객 회원 블랙 여부 확인.
	
	public int getCountByAddress(String locationKeyword);								//admin, 전용. 고객 회원 수 출력. 기준: 주소.
	
	public int insertCustomer( Customer_member_DataBean customer_member_dto );			//customer 전용. 고객회원 가입.
	public int deleteCustomer(String cus_id);											//customer 전용. 고객회원 탈퇴.
	public int check(String cus_id);													//customer 전용. 고객회원 로그인.
	public int check(String cus_id, String pw);											//customer 전용. 고객회원 로그인.
	public int updateCus_address(Map<String, Object> map);											//customer 전용. 주소만 업데이트.
	
	//최은혜 추가!!
	public List<Customer_member_DataBean> selectCusInfoforEmail( int order_no );		//store 전용. email 전송
	
	//성열이형 추가
	public String find_id(String cus_email);
	public int update_pw(Customer_member_DataBean customer_member_dto);
	public String find_email(String cus_email);
	
	
	public int EmailCheck( String email );
}
