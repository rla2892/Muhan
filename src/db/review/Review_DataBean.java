package db.review;

import java.sql.Timestamp;

public class Review_DataBean {
	private int review_no;
	private String review_subject;
	private Timestamp review_write_date;
	private int review_hits;
	private int review_score;
	private String review_content;
	private String review_image;
	private int ref_id;
	private int re_step;
	private int re_level;
	private String cus_id;
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public Timestamp getReview_write_date() {
		return review_write_date;
	}
	public void setReview_write_date(Timestamp review_write_date) {
		this.review_write_date = review_write_date;
	}
	public int getReview_hits() {
		return review_hits;
	}
	public void setReview_hits(int review_hits) {
		this.review_hits = review_hits;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public int getRef_id() {
		return ref_id;
	}
	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	
	
}
