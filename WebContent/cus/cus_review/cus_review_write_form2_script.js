
function review_write_check(){
	var review_subject= review_write_form.review_subject.value;
	var review_content= review_write_form.review_content.value;
	if (review_subject == "" || review_subject == null) {
        alert("제목을 입력하지 않았습니다.");
        review_write_form.review_subject.focus();
        return false;
    }
	if (review_content == "" || review_content == null) {
		alert("내용을 입력하지 않았습니다.");
		review_write_form.review_content.focus();
		return false;
	}
}
