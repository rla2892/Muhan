<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
<!--
#sidebar {
    background: #fff;
    color: gray;
    transition: all 0.3s;
    min-height:500px!important;
/*     margin-left:5px; */
	max-height:85%!important;
}
a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}
#sidebar li a {
    padding: 5px;
    font-size: 1.3em;
    display: block;
}
#sidebar li a:hover {
    color: black;
    background: lightgray;
}
#sidebar li li a{
	font-size: 1.1em;
}

#sidebar li.active > a, a[aria-expanded="true"] {
    color: black;
    background:#F9AA33;
}

-->
</style>
     <nav class="col-sm-2 sidenav" id="sidebar">
        <li class="active">
        	<a href="Store_revenue_day.do">시간대별 매출</a>
           	<ul>
	              <li><a href="Store_revenue_day.do">오늘의 매출</a></li>
	              <li><a href="Store_revenue_month.do">이번 달 매출</a></li>
	              <li><a href="Store_revenue_year.do">이번 해 매출</a></li>
           	</ul>
          </li>
          <li class="active">
            <a href="Store_order_graph_cat_now.do">품목별 매출</a>
            <ul>
               <li><a href="Store_order_graph_cat_now.do">일별 매출</a></li>
               <li><a href="Store_order_graph_cat.do">월별 매출</a></li>
            </ul>
          </li>
  		</nav>