package db.store_member;

import java.sql.Timestamp;

public class Store_member_DataBean {
	private String store_id;
	private String store_pw;
	private String store_address;
	private String store_name;
	private String store_tel;
	private String owner_name;
	private String owner_tel;
	private Timestamp owner_reg_date;
	private String owner_email;
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStore_pw() {
		return store_pw;
	}
	public void setStore_pw(String store_pw) {
		this.store_pw = store_pw;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public Timestamp getOwner_reg_date() {
		return owner_reg_date;
	}
	public void setOwner_reg_date(Timestamp owner_reg_date) {
		this.owner_reg_date = owner_reg_date;
	}
	public String getOwner_email() {
		return owner_email;
	}
	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}
	public String getOwner_tel() {
		return owner_tel;
	}
	public void setOwner_tel(String owner_tel) {
		this.owner_tel = owner_tel;
	}
	
	
}
