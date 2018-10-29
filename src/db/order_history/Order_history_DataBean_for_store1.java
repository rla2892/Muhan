package db.order_history;

import java.sql.Time;

public class Order_history_DataBean_for_store1 {
	private int order_no;
	private Time order_date;
	private String cus_id;
	private String cus_address;
	private String cus_address2;	
	private String cus_tel;
	private String cus_email;
	private String order_status;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Time getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Time order_date) {
		this.order_date = order_date;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
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
	public String getCus_tel() {
		return cus_tel;
	}
	public void setCus_tel(String cus_tel) {
		this.cus_tel = cus_tel;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
}
