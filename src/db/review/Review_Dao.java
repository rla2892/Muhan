package db.review;

import java.util.List;
import java.util.Map;

public interface Review_Dao {
	//일반글
	public List<Review_DataBean> selectReviews(Map<String, Integer> map);	//admin, customer. 전체 리뷰 출력.
	public Review_DataBean selectReview(int review_no);						//admin, customer. 상세 리뷰 출력.
	public int blindReview(int review_no);									//admin 전용. 리뷰 블라인드.
	public int insertReview(Review_DataBean review_dto);					//customer 전용. 리뷰 게시.
	public int modifyReview(Review_DataBean review_dto);					//customer 전용. 리뷰 수정.
	public int deleteReview(int review_no);									//customer 전용. 리뷰 삭제.
	public List<Review_DataBean> selectMyReviews(Map<String, Object> map);	//customer 전용. 자기 리뷰만 출력.
	public void addHits(int review_no); 									//customer, admin. 조회수 증가.
	
	//유틸
	public int getMaxReview_no();											//admin, customer. 리뷰-no 최대 구하기.
	public int insertReply(Review_DataBean review_dto);						//admin, customer. 뒤 답글 뒤로 보내기
	public int getMaxNotice_no();
	
	public List<Review_DataBean> searchReviewBySubject(Map<String, String> map);	//customer 전용. 리뷰 검색 : 제목
	public List<Review_DataBean> searchReviewByContent(Map<String, String> map);	//customer 전용. 리뷰 검색 : 내용
	public List<Review_DataBean> searchReviewBySubCon(Map<String, String> map);		//customer 전용. 리뷰 검색 : 제목+내용
	
	//공지글
	public List<Notice_DataBean> selectNotices(Map<String, Integer> map);	//admin, customer. 전체 공지 출력.
	public Notice_DataBean selectNotice(int notice_no);						//admin, customer. 상세 공지 출력.
	public int insertNotice(Notice_DataBean notice_dto);					//admin 전용. 공지 게시.
	public int modifyNotice(Notice_DataBean notice_dto);					//admin 전용. 공지 수정
	public int deleteNotice(int notice_no);									//admin 전용. 공지 삭제
	public void addHitsNotice(int notice_no); 								//customer, admin. 조회수 증가.
	
	//신고
	public int insertReport(Report_DataBean report_dto);					//customer 전용. 신고 넣기.
	public int countReport(int review_no);									//adimn 전용. 신고 횟수 세기.
	
	// HY 추가사항
	public int getCount();													// customer 전용. 리뷰 수 출력.
	public int getNoticeCount();											// customer 전용. 공지사항 수 출력.
	public int getSearchBySubjectCount(Map<String, String> map);			// customer 전용. 제목 검색 후 리뷰 수 출력.
	public int getSearchByContentCount(Map<String, String> map);			// customer 전용. 내용 검색 후 리뷰 수 출력.
	public int getSearchBySubConCount(Map<String, String> map);				// customer 전용. 제목+내용 검색 후 리뷰 수 출력.
	
	public int getMyReviewCount(Map<String, String> map);								// customer 전용. 내가 쓴 리뷰 수 출력.
	public int getMaxRefId();												// customer 전용. ref_id 최대값 출력.
}
