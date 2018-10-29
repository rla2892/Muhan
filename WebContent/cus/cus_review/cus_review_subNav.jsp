<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/cus/cus_script.jsp"%>

<!-- Sub-Navigation Bar, in place of Side Panel -->
<nav class="navbar sticky-top navbar-expand-lg bg-dark justify-content-center">
	<ul class="navbar-nav" id="subNavbar">
		<li class="nav-item">
			<a class="nav-link text-white ml-5 mr-5 myReviews" href="cus_my_review_list.do">내가 쓴 리뷰</a>
		</li>

		<li class="nav-item">
			<form class="form-inline ml-5 mr-5" method="get" name="searchform" action="cus_review_pro.do">
				<select class="custom-select mr-1" name="selectSearchOption">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="제목+내용">제목+내용</option>
				</select>
  					<input class="form-control mr-1" type="text" name="searchbar" placeholder="검색어를 입력해 주세요" title="검색 키워드를 한 단어로 입력해 주세요.예시: 불고기버거">
  					<button class="btn btn-warning" type="submit" onclick="return enterKeyword()">리뷰검색</button>
			</form>
		</li>
		<li class="nav-item">
			<c:if test="${sessionScope.black eq null}">
				<%-- 
				<a class="nav-link text-white ml-5 mr-5" id="writeReview" href="" data-toggle="modal" data-target="#write" data-backdrop="static" data-keyboard="false">리뷰쓰기</a>
				--%>
				<a class="nav-link text-white ml-5 mr-5" id="writeReview" href="Cus_review_write_form2.do">리뷰쓰기</a>
			</c:if>
			<c:if test="${sessionScope.black eq 1}">
				<div class="nav-link text-muted ml-5 mr-5" title="리뷰 게시판 이용 위반으로 더 이상 리뷰를 작성하실 수 없습니다.">리뷰쓰기</div>
			</c:if>
		</li>
	</ul>
</nav>