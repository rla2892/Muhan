package db.customer_member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Customer_member_DBBean implements Customer_member_Dao {
	private SqlSession session = SqlMapClient.getSession();
	
	@Override
	public int getCount() {
		return session.selectOne("Customer_member.getCount");
	}
	
	@Override
	public int getCountByAddress(String locationKeyword) {
		return session.selectOne("Customer_member.getCountByAddress", locationKeyword);
	}
	
	@Override
	public int check(String cus_id) {
		return session.selectOne("Customer_member.checkId", cus_id);
	}
	
	public int EmailCheck( String email ) {
	return session.selectOne( "Customer_member.EmailCheck", email);
	}
	
	@Override
	public int check(String cus_id, String pw) {
		int result = 0;		
		if( check( cus_id ) > 0 ) {
			// 아이디가 있다
			//LogonDataBean memberDto = getMember( id );
			Customer_member_DataBean customer_member_dto = selectCustomer(cus_id);
			if( pw.equals( customer_member_dto.getCus_pw() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			// 아이디가 없다
			result = 0;				
		}
		return result;
	}
	
	@Override
	public int deleteCustomer(String cus_id) {
		return session.delete("Customer_member.deleteCustomer", cus_id);
	}
	
	@Override
	public int insertCustomer(Customer_member_DataBean customer_member_dto) {
		return session.insert("Customer_member.insertCustomer", customer_member_dto);
	}
	
	@Override
	public List<Customer_member_DataBean> selectCustomers(Map<String, Integer> map) {
		return session.selectList("Customer_member.selectCustomers", map);
	}
	
	@Override
	public List<Customer_member_DataBean> selectCustomers2(Map<String, Integer> map) {
		return session.selectList("Customer_member.selectCustomers2", map);
	}
	
	@Override
	public List<Customer_member_DataBean> selectCustomersByAddress(Map<String, Object> map) {
		return session.selectList("Customer_member.selectCustomersByAddress", map);
	}
	
	@Override
	public Customer_member_DataBean selectCustomer(String cus_id) {
		return session.selectOne("Customer_member.selectCustomer", cus_id);
	}
	
	@Override
	public int modifyCustomer(Customer_member_DataBean customer_member_dto) {
		return session.update("Customer_member.modifyCustomer", customer_member_dto);
	}
	
	@Override
	public int updateCus_address(Map<String, Object> map) {
		return session.update("Customer_member.updateCus_address",map);
	}
	
	//블랙
	@Override
	public int insertBlack(String cus_id) {
		return session.insert("Customer_member.insertBlack", cus_id);
	}
	@Override
	public int deleteBlack(String cus_id) {
		return session.delete("Customer_member.deleteBlack", cus_id);
	}
	@Override
	public int checkBlack(String cus_id) {
		return session.selectOne("Customer_member.checkBlack", cus_id);
	}
	
	//신고횟수
	@Override
	public int countReport(String cus_id) {
		return session.selectOne("Customer_member.countReport", cus_id);
	}
	@Override
	public int countReportByCus(String cus_id) {
		return session.selectOne("Customer_member.countReportByCus", cus_id);
	}
	
	//최은혜 추가!!
	public List<Customer_member_DataBean> selectCusInfoforEmail ( int order_no ) {
		return session.selectList("Customer_member.selectCusInfoforEmail", order_no);
	}
	
	//성열이형 추가
	@Override
	public String find_id(String cus_email) {
		return session.selectOne("Customer_member.find_id",cus_email);
	}

	@Override
	public int update_pw(Customer_member_DataBean customer_member_dto) {
		return session.update("Customer_member.update_pw", customer_member_dto);
	}
	
	@Override
	public String find_email(String cus_email) {
		return session.selectOne("Customer_member.find_email",cus_email);
	}
}
