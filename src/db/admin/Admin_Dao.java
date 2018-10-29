package db.admin;

public interface Admin_Dao {
	public Admin_member_DataBean getMember(String admin_id);	//admin 전용. 관리자 로그인.
	public int check(String admin_id,String admin_pw);			//admin 전용. 관리자 로그인.
	public int check(String admin_id);							//admin 전용. 관리자 로그인.
}
