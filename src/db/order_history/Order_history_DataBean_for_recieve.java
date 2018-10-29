package db.order_history;

import java.sql.Timestamp;

public class Order_history_DataBean_for_recieve {
	private int order_no;
	private int order_qnt;
	private Timestamp order_date;
	private int menu_id;
	private String cus_id;
	private String store_id;
	private int order_status;
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_qnt() {
		return order_qnt;
	}
	public void setOrder_qnt(int order_qnt) {
		this.order_qnt = order_qnt;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	
	
}
