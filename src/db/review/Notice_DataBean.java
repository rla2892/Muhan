package db.review;

import java.sql.Timestamp;

public class Notice_DataBean {
	private int notice_no;
	private String notice_subject;
	private String notice_content;
	private Timestamp notice_write_date;
	private int notice_hits;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Timestamp getNotice_write_date() {
		return notice_write_date;
	}
	public void setNotice_write_date(Timestamp notice_write_date) {
		this.notice_write_date = notice_write_date;
	}
	public int getNotice_hits() {
		return notice_hits;
	}
	public void setNotice_hits(int notice_hits) {
		this.notice_hits = notice_hits;
	}
	
	
}
