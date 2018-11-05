package db.order_history;

import java.sql.Timestamp;

public class Order_history_car_DataBean {
	private String car_id;
	private int order_no;
	private String car_x;
	private String car_y;
	private Timestamp car_date;
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getCar_x() {
		return car_x;
	}
	public void setCar_x(String car_x) {
		this.car_x = car_x;
	}
	public String getCar_y() {
		return car_y;
	}
	public void setCar_y(String car_y) {
		this.car_y = car_y;
	}
	public Timestamp getCar_date() {
		return car_date;
	}
	public void setCar_date(Timestamp car_date) {
		this.car_date = car_date;
	}	
}
