package db.order_history;

public class Order_history_DataBean_for_Alarm {
	private int order_no;
	private int order_status;
	private String systimestamp;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public String getSystimestamp() {
		return systimestamp;
	}
	public void setSystimestamp(String systimestamp) {
		this.systimestamp = systimestamp;
	}
}
