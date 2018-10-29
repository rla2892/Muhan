package db.admin;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Admin_member_DBBean implements Admin_Dao{
	private SqlSession session = SqlMapClient.getSession();
	
	public Admin_member_DataBean getMember( String admin_id ) {
		return session.selectOne( "Admin_member.getMember", admin_id );	
	}
	
	public int check( String admin_id ) {
		return session.selectOne( "Admin_member.checkId", admin_id );
	}
	
	public int check( String admin_id, String passwd ) {
		int result = 0;		
		if( check( admin_id ) > 0 ) {
			// 아이디가 있다
			//LogonDataBean memberDto = getMember( id );
			Admin_member_DataBean memberDto = getMember( admin_id );
			if( passwd.equals( memberDto.getAdmin_pw() ) ) {
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
}
