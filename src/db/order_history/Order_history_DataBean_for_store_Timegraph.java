package db.order_history;

import java.sql.Timestamp;

public class Order_history_DataBean_for_store_Timegraph {
	private Timestamp order_date;
	private int order_qnt;
	private int menu_price;
	
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public int getOrder_qnt() {
		return order_qnt;
	}
	public void setOrder_qnt(int order_qnt) {
		this.order_qnt = order_qnt;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	
}
