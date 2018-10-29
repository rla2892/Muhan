package db.customer_member;

import java.sql.Timestamp;

public class Customer_member_DataBean {
	private String cus_id;
	private String cus_pw;
	private String cus_nickname;
	private String cus_address;
	private String cus_address2;
	private String cus_email;
	private String cus_tel;
	private Timestamp cus_reg_date;
	private int cus_gender;
	private Timestamp cus_birth;
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pw() {
		return cus_pw;
	}
	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}
	public String getCus_nickname() {
		return cus_nickname;
	}
	public void setCus_nickname(String cus_nickname) {
		this.cus_nickname = cus_nickname;
	}
	public String getCus_address() {
		return cus_address;
	}
	public void setCus_address(String cus_address) {
		this.cus_address = cus_address;
	}
	public String getCus_address2() {
		return cus_address2;
	}
	public void setCus_address2(String cus_address2) {
		this.cus_address2 = cus_address2;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	public String getCus_tel() {
		return cus_tel;
	}
	public void setCus_tel(String cus_tel) {
		this.cus_tel = cus_tel;
	}
	public Timestamp getCus_reg_date() {
		return cus_reg_date;
	}
	public void setCus_reg_date(Timestamp cus_reg_date) {
		this.cus_reg_date = cus_reg_date;
	}
	public int getCus_gender() {
		return cus_gender;
	}
	public void setCus_gender(int cus_gender) {
		this.cus_gender = cus_gender;
	}
	public Timestamp getCus_birth() {
		return cus_birth;
	}
	public void setCus_birth(Timestamp cus_birth) {
		this.cus_birth = cus_birth;
	}
	
	
}
