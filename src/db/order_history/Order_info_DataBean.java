package db.order_history;

import java.sql.Time;

public class Order_info_DataBean {
	private int order_no;
	private Time order_date;
	private String cus_id;
	private String store_name;
	private int order_status;
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
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
}
