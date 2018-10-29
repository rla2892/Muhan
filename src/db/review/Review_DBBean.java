package db.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Review_DBBean implements Review_Dao{
	private SqlSession session = SqlMapClient.getSession();
	
	//유틸
	@Override
	public int getMaxReview_no() {
		return session.selectOne("Review.getMaxReview_no");
	}
	//유틸
	@Override
	public int insertReply(Review_DataBean review_dto) {
		return session.update("Review.insertReply",review_dto);
	}
	//유틸 공지
	@Override
	public int getMaxNotice_no() {
		return session.selectOne("Review.getMaxNotice_no");
	}
	
	@Override
	public List<Review_DataBean> selectReviews(Map<String, Integer> map) {
		return session.selectList("Review.selectReviews", map);
	}
	
	@Override
	public Review_DataBean selectReview(int review_no) {
		return session.selectOne("Review.selectReview", review_no);
	}
	
	@Override
	public int blindReview(int review_no) {
		return session.update("Review.blindReview", review_no);
	}
	
	@Override
	public int deleteReview(int review_no) {
		return session.delete("Review.deleteReview", review_no);
	}
	
	@Override
	public int modifyReview(Review_DataBean review_dto) {
		return session.update("Review.modifyReview", review_dto);
	}
	
	@Override
	public void addHits(int review_no) {
		session.update("Review.addHits",review_no);
	}
	
	//공지글
	@Override
	public List<Notice_DataBean> selectNotices(Map<String, Integer> map) {
		return session.selectList("Review.selectNotices", map);
	}
	
	//공지글
	@Override
	public Notice_DataBean selectNotice(int notice_no) {
		return session.selectOne("Review.selectNotice", notice_no);
	}
	
	//공지글
	@Override
	public int insertNotice(Notice_DataBean notice_dto) {
		int notice_no = getMaxNotice_no()+1;
		notice_dto.setNotice_no(notice_no);
		return session.insert("Review.insertNotice", notice_dto);
	}
	
	//공지글
	@Override
	public int deleteNotice(int notice_no) {
		return session.delete("Review.deleteNotice", notice_no);
	}
	
	//공지글
	@Override
	public int modifyNotice(Notice_DataBean notice_dto) {
		return session.update("Review.modifyNotice", notice_dto);
	}
	
	//공지글
	@Override
	public void addHitsNotice(int notice_no) {
		session.update("Review.addHitsNotice",notice_no);
		
	}
	
	//신고
	@Override
	public int insertReport(Report_DataBean report_dto) {
		return session.insert("Review.insertReport", report_dto);
	}
	//신고횟수
	@Override
	public int countReport(int review_no) {
		return session.selectOne("Review.countReport", review_no);
	}
	
	//테스트 리뷰 게시
	@Override
	public int insertReview(Review_DataBean review_dto) {
		int sort = review_dto.getReview_no();
		int re_step;
		int re_level;
		int review_no = getMaxReview_no()+1;
		if(sort==0) {
			//제목글
			review_dto.setReview_no(review_no);
			review_dto.setRef_id(review_no);
			
			re_step=0;
			re_level=0;
			
		}else {
			//답글
			insertReply(review_dto);
			review_dto.setRef_id(review_dto.getRef_id());
			review_dto.setReview_no(review_no);
			re_step=review_dto.getRe_step()+1;
			re_level=review_dto.getRe_level()+1;
		}
		
		review_dto.setRe_step(re_step);
		review_dto.setRe_level(re_level);
		return session.insert("Review.insertReview", review_dto);
	}
	
	//테스트 자기 리뷰 출력
	@Override
	public List<Review_DataBean> selectMyReviews(Map<String, Object> map){
		return session.selectList("Review.selectMyReviews", map);
	}
	
	//검색
	@Override
	public List<Review_DataBean> searchReviewBySubject(Map<String, String> map) {
		return session.selectList("Review.searchReviewBySubject", map);
	}
	
	//검색
	@Override
	public List<Review_DataBean> searchReviewByContent(Map<String, String> map) {
		return session.selectList("Review.searchReviewByContent", map);
	}
	
	//검색
	@Override
	public List<Review_DataBean> searchReviewBySubCon(Map<String, String> map) {
		return session.selectList("Review.searchReviewBySubCon", map);
	}
	
	//HY
	/*----------------HY 추가사항----------------*/
	// 리뷰 수 출력
	@Override
	public int getCount() {
		return session.selectOne("Review.getCount");
	}

	// 공지사항 수 출력
	@Override
	public int getNoticeCount() {
		return session.selectOne("Review.getNoticeCount");
	}

	// 제목 검색 후 리뷰 수 출력
	@Override
	public int getSearchBySubjectCount(Map<String, String> map) {
		return session.selectOne("Review.getSearchBySubjectCount", map);
	}

	// 내용 검색 후 리뷰 수 출력
	@Override
	public int getSearchByContentCount(Map<String, String> map) {
		return session.selectOne("Review.getSearchByContentCount", map);
	}

	// 제목+내용 검색 후 리뷰 수 출력
	@Override
	public int getSearchBySubConCount(Map<String, String> map) {
		return session.selectOne("Review.getSearchBySubConCount", map);
	}
	
	// 내가 쓴 리뷰 수 출력
	@Override
	public int getMyReviewCount(Map<String, String> map) {
		return session.selectOne("Review.getMyReviewCount", map);
	}
	
	// Max ref_id 출력
	@Override
	public int getMaxRefId() {
		return session.selectOne("Review.getMaxRefId");
	}
}
