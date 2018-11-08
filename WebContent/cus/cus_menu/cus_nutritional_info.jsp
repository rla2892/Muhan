<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold">영양 정보</h1>
		</div>
		
		<%@include file="/cus/cus_menu/cus_menu_subNav.jsp"%>

		<div class="nutritionalInfo container justify-content-center d-flex flex-column mb-4">			
			<table class="flex-item table table-sm table-responsive-lg table-striped table-hover mt-4">
				<caption class="flex-item">구분, 제품명, 알러지 성분으로 구성된 영양 정보</caption>
				<colgroup>
					<col style="width:29%;" />
					<col style="width:23%;" />
					<col style="width:12%;" />
					<col style="width:12%;" />
					<col style="width:12%;" />
					<col style="width:12%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제품명</th>
						<th scope="col">총칼로리</th>
						<th scope="col">단백질</th>
						<th scope="col">나트륨</th>
						<th scope="col">당류</th>
						<th scope="col">포화지방</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>데리버거</td>
						<td>334Kcal / 134g</td>
						<td>12g</td>
						<td>602mg</td>
						<td>9g</td>
						<td>5.5g</td>
					</tr>
				
					<tr>
						<td>핫크리스피버거</td>
						<td>500Kcal / 190g</td>
						<td>22g</td>
						<td>868mg</td>
						<td>4g</td>
						<td>7.4g</td>
					</tr>
				
					<tr>
						<td>더블모짜버거</td>
						<td>729Kcal / 241g</td>
						<td>30g</td>
						<td>1064mg</td>
						<td>4g</td>
						<td>19.3g</td>
					</tr>
				
					<tr>
						<td>NEW 한우불고기버거</td>
						<td>534Kcal / 241g</td>
						<td>21g</td>
						<td>1090mg</td>
						<td>11g</td>
						<td>11.8g</td>
					</tr>
				
					<tr>
						<td>T-REX버거</td>
						<td>475Kcal / 213g</td>
						<td>26g</td>
						<td>874mg</td>
						<td>7g</td>
						<td>5.4g</td>
					</tr>
				
					<tr>
						<td>와규오리지널</td>
						<td>451Kcal / 198g</td>
						<td>23g</td>
						<td>651mg</td>
						<td>8g</td>
						<td>4.4g</td>
					</tr>
				
					<tr>
						<td>AZ오리지널</td>
						<td>976Kcal / 752g</td>
						<td>30g</td>
						<td>966mg</td>
						<td>37g</td>
						<td>15.4g</td>
					</tr>
				
					<tr>
						<td>한우불고기버거</td>
						<td>534Kcal / 241g</td>
						<td>21g</td>
						<td>1090mg</td>
						<td>11g</td>
						<td>11.8g</td>
					</tr>
				
					<tr>
						<td>모짜베이컨B</td>
						<td>689Kcal / 221g</td>
						<td>30g</td>
						<td>844mg</td>
						<td>4g</td>
						<td>17.6g</td>
					</tr>
				
					<tr>
						<td>모짜더블B</td>
						<td>729Kcal / 241g</td>
						<td>30g</td>
						<td>1064mg</td>
						<td>4g</td>
						<td>19.3g</td>
					</tr>
				
					<tr>
						<td>모짜해쉬B</td>
						<td>670Kcal / 218g</td>
						<td>16g</td>
						<td>634mg</td>
						<td>1g</td>
						<td>14.1g</td>
					</tr>
				
					<tr>
						<td>빅불B</td>
						<td>569Kcal / 227g</td>
						<td>31g</td>
						<td>1189mg</td>
						<td>8g</td>
						<td>14.4g</td>
					</tr>
				
					<tr>
						<td>핫크리스피B</td>
						<td>500Kcal / 190g</td>
						<td>22g</td>
						<td>868mg</td>
						<td>4g</td>
						<td>7.4g</td>
					</tr>
				
					<tr>
						<td>클래식치즈B</td>
						<td>477Kcal / 143g</td>
						<td>20g</td>
						<td>641mg</td>
						<td>6g</td>
						<td>14.1g</td>
					</tr>
				
					<tr>
						<td>새우B</td>
						<td>462Kcal / 160g</td>
						<td>13g</td>
						<td>742mg</td>
						<td>6g</td>
						<td>4.8g</td>
					</tr>
				
					<tr>
						<td>불고기B</td>
						<td>390Kcal / 154g</td>
						<td>17g</td>
						<td>713mg</td>
						<td>8g</td>
						<td>7.4g</td>
					</tr>
				
					<tr>
						<td>데리B</td>
						<td>334Kcal / 134g</td>
						<td>12g</td>
						<td>602mg</td>
						<td>9g</td>
						<td>5.5g</td>
					</tr>
				
					<tr>
						<td>비프바베큐B</td>
						<td>325Kcal / 130g</td>
						<td>12g</td>
						<td>543mg</td>
						<td>7g</td>
						<td>5.5g</td>
					</tr>
				
					<tr>
						<td>불고기버거</td>
						<td>390Kcal / 154g</td>
						<td>17g</td>
						<td>713mg</td>
						<td>8g</td>
						<td>7.4g</td>
					</tr>
				
					<tr>
						<td>새우버거</td>
						<td>462Kcal / 160g</td>
						<td>13g</td>
						<td>742mg</td>
						<td>6g</td>
						<td>4.8g</td>
					</tr>
				
					<tr>
						<td>데리버거</td>
						<td>334Kcal / 134g</td>
						<td>12g</td>
						<td>602mg</td>
						<td>9g</td>
						<td>5.5g</td>
					</tr>
				
					<tr>
						<td>핫크리스피버거</td>
						<td>500Kcal / 190g</td>
						<td>22g</td>
						<td>868mg</td>
						<td>4g</td>
						<td>7.4g</td>
					</tr>
				
					<tr>
						<td>모짜렐라인더버거 -더블</td>
						<td>729Kcal / 241g</td>
						<td>30g</td>
						<td>1064mg</td>
						<td>4g</td>
						<td>19.3g</td>
					</tr>
				
					<tr>
						<td>AZ(아재)-오리지널</td>
						<td>491Kcal / 244g</td>
						<td>27g</td>
						<td>637mg</td>
						<td>9g</td>
						<td>15.1g</td>
					</tr>
				
					<tr>
						<td>모짜렐라인더버거 -해쉬</td>
						<td>670Kcal / 218g</td>
						<td>16g</td>
						<td>634mg</td>
						<td>1g</td>
						<td>14.1g</td>
					</tr>
				
					<tr>
						<td>모짜렐라인더버거 -베이컨</td>
						<td>689Kcal / 221g</td>
						<td>30g</td>
						<td>844mg</td>
						<td>4g</td>
						<td>17.6g</td>
					</tr>
				
					<tr>
						<td>NEW 한우불고기버거</td>
						<td>534Kcal / 241g</td>
						<td>21g</td>
						<td>1090mg</td>
						<td>11g</td>
						<td>11.8g</td>
					</tr>
				
					<tr>
						<td>클래식 치즈버거</td>
						<td>477Kcal / 143g</td>
						<td>20g</td>
						<td>641mg</td>
						<td>6g</td>
						<td>14.1g</td>
					</tr>
				
					<tr>
						<td>와규-오리지널</td>
						<td>451Kcal / 198g</td>
						<td>23g</td>
						<td>651mg</td>
						<td>8g</td>
						<td>4.4g</td>
					</tr>
				
					<tr>
						<td>비프바베큐버거</td>
						<td>325Kcal / 130g</td>
						<td>12g</td>
						<td>543mg</td>
						<td>7g</td>
						<td>5.5g</td>
					</tr>
				
					<tr>
						<td>T-REX버거</td>
						<td>475 Kcal / 213 g</td>
						<td>26 g</td>
						<td>874 mg</td>
						<td>7 g</td>
						<td>5.4 g</td>
					</tr>
				
					<tr>
						<td>빅불버거</td>
						<td>569Kcal / 227g</td>
						<td>31g</td>
						<td>1189mg</td>
						<td>8g</td>
						<td>14.4g</td>
					</tr>
				
					<tr>
						<td>후레쉬-치킨휠레2조각</td>
						<td>183Kcal / 76.6g</td>
						<td>57g</td>
						<td>370mg</td>
						<td>0g</td>
						<td>1.9g</td>
					</tr>
				
					<tr>
						<td>후레쉬-치킨휠레4조각</td>
						<td>306Kcal / 120g</td>
						<td>24g</td>
						<td>642mg</td>
						<td>0g</td>
						<td>6.9g</td>
					</tr>
				
					<tr>
						<td>F-치킨1조각</td>
						<td>303Kcal / 127g</td>
						<td>23g</td>
						<td>322mg</td>
						<td>1g</td>
						<td>6.9g</td>
					</tr>
				
					<tr>
						<td>휠레4조각</td>
						<td>366Kcal / 153g</td>
						<td>29g</td>
						<td>740mg</td>
						<td>0g</td>
						<td>3.8g</td>
					</tr>
				
					<tr>
						<td>화이어윙2조각</td>
						<td>158Kcal / 73g</td>
						<td>8g</td>
						<td>243mg</td>
						<td>0g</td>
						<td>2.2g</td>
					</tr>
				
					<tr>
						<td>화이어윙4조각</td>
						<td>316Kcal / 147g</td>
						<td>15g</td>
						<td>486mg</td>
						<td>0g</td>
						<td>4.1g</td>
					</tr>
				
					<tr>
						<td>순살하프팩</td>
						<td>739Kcal / 244g</td>
						<td>36g</td>
						<td>1341mg</td>
						<td>3g</td>
						<td>13.0g</td>
					</tr>
				
					<tr>
						<td>순살치킨풀팩</td>
						<td>1477Kcal / 1271g</td>
						<td>165g</td>
						<td>6438mg</td>
						<td>6g</td>
						<td>26.0g</td>
					</tr>
				
					<tr>
						<td>치킨하프-콘샐러드</td>
						<td>1232Kcal / 620g</td>
						<td>74g</td>
						<td>2967mg</td>
						<td>7g</td>
						<td>17.8g</td>
					</tr>
				
					<tr>
						<td>치킨하프-포테이토</td>
						<td>1353Kcal / 609g</td>
						<td>76g</td>
						<td>3099mg</td>
						<td>6g</td>
						<td>19.7g</td>
					</tr>
				
					<tr>
						<td>치킨풀팩-콘샐러드</td>
						<td>2590Kcal / 1272g</td>
						<td>166g</td>
						<td>6439mg</td>
						<td>15g</td>
						<td>38.3g</td>
					</tr>
				
					<tr>
						<td>치킨풀팩-포테이토</td>
						<td>2711Kcal / 1261g</td>
						<td>168g</td>
						<td>6571mg</td>
						<td>14g</td>
						<td>40.2g</td>
					</tr>
				
					<tr>
						<td>패밀리팩콘샐러드</td>
						<td>1573Kcal / 770g</td>
						<td>96g</td>
						<td>3580mg</td>
						<td>7g</td>
						<td>21.8g</td>
					</tr>
				
					<tr>
						<td>패밀리팩포테이토</td>
						<td>1694Kcal / 759g</td>
						<td>98g</td>
						<td>3712mg</td>
						<td>6g</td>
						<td>23.7g</td>
					</tr>
				
					<tr>
						<td>치킨1조각</td>
						<td>272Kcal / 130g</td>
						<td>18g</td>
						<td>694mg</td>
						<td>2g</td>
						<td>4.1g</td>
					</tr>
				
					<tr>
						<td>휠레2조각</td>
						<td>183Kcal / 77g</td>
						<td>15g</td>
						<td>370mg</td>
						<td>0g</td>
						<td>1.9g</td>
					</tr>
				
					<tr>
						<td>화이어윙2조각</td>
						<td>158Kcal / 73g</td>
						<td>8g</td>
						<td>243mg</td>
						<td>0g</td>
						<td>2.2g</td>
					</tr>
				
					<tr>
						<td>화이어윙4조각</td>
						<td>316Kcal / 147g</td>
						<td>15g</td>
						<td>486mg</td>
						<td>0g</td>
						<td>4.1g</td>
					</tr>
				
					<tr>
						<td>치킨휠레2조각</td>
						<td>183Kcal / 77g</td>
						<td>15g</td>
						<td>370mg</td>
						<td>0g</td>
						<td>1.9g</td>
					</tr>
				
					<tr>
						<td>치킨휠레4조각</td>
						<td>366Kcal / 153g</td>
						<td>29g</td>
						<td>740mg</td>
						<td>0g</td>
						<td>3.8g</td>
					</tr>
				
					<tr>
						<td>치킨 1조각</td>
						<td>272Kcal / 130g</td>
						<td>18g</td>
						<td>694mg</td>
						<td>2g</td>
						<td>4.1g</td>
					</tr>
				
					<tr>
						<td>순살치킨하프팩</td>
						<td>739Kcal / 244g</td>
						<td>36g</td>
						<td>1341mg</td>
						<td>3g</td>
						<td>13.0g</td>
					</tr>
				
					<tr>
						<td>순살치킨풀팩</td>
						<td>1477Kcal / 1271g</td>
						<td>165g</td>
						<td>6438mg</td>
						<td>6g</td>
						<td>26.0g</td>
					</tr>
				
					<tr>
						<td>치킨풀팩-콘샐러드</td>
						<td>2590Kcal / 1272g</td>
						<td>166g</td>
						<td>6439mg</td>
						<td>15g</td>
						<td>38.3g</td>
					</tr>
				
					<tr>
						<td>치킨풀팩-포테이토</td>
						<td>2711Kcal / 1261g</td>
						<td>168g</td>
						<td>6571mg</td>
						<td>14g</td>
						<td>40.2g</td>
					</tr>
				
					<tr>
						<td>치킨하프-콘샐러드</td>
						<td>1232Kcal / 620g</td>
						<td>74g</td>
						<td>2967mg</td>
						<td>7g</td>
						<td>17.8g</td>
					</tr>
				
					<tr>
						<td>치킨하프-포테이토</td>
						<td>1353Kcal / 609g</td>
						<td>76g</td>
						<td>3099mg</td>
						<td>6g</td>
						<td>19.7g</td>
					</tr>
				
					<tr>
						<td>패밀리팩콘샐러드</td>
						<td>1573Kcal / 770g</td>
						<td>96g</td>
						<td>3580mg</td>
						<td>7g</td>
						<td>21.8g</td>
					</tr>
				
					<tr>
						<td>패밀리팩포테이토</td>
						<td>1694Kcal / 759g</td>
						<td>98g</td>
						<td>3712mg</td>
						<td>6g</td>
						<td>23.7g</td>
					</tr>
				
					<tr>
						<td>F풀팩-콘샐러드</td>
						<td>3177Kcal / 1377g</td>
						<td>236g</td>
						<td>3411mg</td>
						<td>9g</td>
						<td>70g</td>
					</tr>
				
					<tr>
						<td>F풀팩-포테이토</td>
						<td>3298Kcal / 1366g</td>
						<td>238g</td>
						<td>3543mg</td>
						<td>8g</td>
						<td>71.9g</td>
					</tr>
				
					<tr>
						<td>F하프-콘샐러드</td>
						<td>1661Kcal / 735g</td>
						<td>119g</td>
						<td>1800mg</td>
						<td>5g</td>
						<td>35.6g</td>
					</tr>
				
					<tr>
						<td>F하프-포테이토</td>
						<td>1782Kcal / 724g</td>
						<td>121g</td>
						<td>1932mg</td>
						<td>4g</td>
						<td>37.5g</td>
					</tr>
				
					<tr>
						<td>F패밀리-콘샐러드</td>
						<td>1669Kcal / 741g</td>
						<td>115g</td>
						<td>2042mg</td>
						<td>4g</td>
						<td>34.5g</td>
					</tr>
				
					<tr>
						<td>F패밀리-포테이토</td>
						<td>1790Kcal / 730g</td>
						<td>117g</td>
						<td>2174mg</td>
						<td>3g</td>
						<td>36.4g</td>
					</tr>
				
					<tr>
						<td>F-순살하프팩</td>
						<td>153Kcal / 60g</td>
						<td>12g</td>
						<td>321mg</td>
						<td>0g</td>
						<td>3.5g</td>
					</tr>
				
					<tr>
						<td>F-순살풀팩</td>
						<td>2020Kcal / 560g</td>
						<td>114g</td>
						<td>2413mg</td>
						<td>0g</td>
						<td>49.1g</td>
					</tr>
				
					<tr>
						<td>쉑쉑치킨</td>
						<td>229Kcal / 89g</td>
						<td>21g</td>
						<td>447mg</td>
						<td>2g</td>
						<td>1.7g</td>
					</tr>
				
					<tr>
						<td>양념감자</td>
						<td>371Kcal / 122g</td>
						<td>6g</td>
						<td>563mg</td>
						<td>2g</td>
						<td>4.8g</td>
					</tr>
				
					<tr>
						<td>치즈스틱</td>
						<td>160Kcal / 49g</td>
						<td>9g</td>
						<td>183mg</td>
						<td>0g</td>
						<td>2.6g</td>
					</tr>
				
					<tr>
						<td>롱치즈스틱</td>
						<td>156Kcal / 49g</td>
						<td>8g</td>
						<td>236mg</td>
						<td>0g</td>
						<td>7.0g</td>
					</tr>
				
					<tr>
						<td>오징어링</td>
						<td>178Kcal / 64g</td>
						<td>10g</td>
						<td>374mg</td>
						<td>0g</td>
						<td>2.5g</td>
					</tr>
				
					<tr>
						<td>포테이토L</td>
						<td>389Kcal / 130g</td>
						<td>6g</td>
						<td>471mg</td>
						<td>0g</td>
						<td>4.7g</td>
					</tr>
				
					<tr>
						<td>콘샐러드</td>
						<td>146Kcal / 100g</td>
						<td>2g</td>
						<td>190mg</td>
						<td>1g</td>
						<td>1.3g</td>
					</tr>
				
					<tr>
						<td>포테이토</td>
						<td>267Kcal / 89g</td>
						<td>4g</td>
						<td>322mg</td>
						<td>0g</td>
						<td>3.2g</td>
					</tr>
				
					<tr>
						<td>롱치즈스틱</td>
						<td>156Kcal / 49g</td>
						<td>8g</td>
						<td>236mg</td>
						<td>0g</td>
						<td>7.0g</td>
					</tr>
				
					<tr>
						<td>포테이토S</td>
						<td>210Kcal / 70g</td>
						<td>3g</td>
						<td>253mg</td>
						<td>0g</td>
						<td>2.5g</td>
					</tr>
				
					<tr>
						<td>포테이토</td>
						<td>267Kcal / 89g</td>
						<td>4g</td>
						<td>322mg</td>
						<td>0g</td>
						<td>3.2g</td>
					</tr>
				
					<tr>
						<td>양념감자</td>
						<td>371Kcal / 122g</td>
						<td>6g</td>
						<td>563mg</td>
						<td>2g</td>
						<td>4.8g</td>
					</tr>
				
					<tr>
						<td>치즈스틱</td>
						<td>160Kcal / 49g</td>
						<td>9g</td>
						<td>183mg</td>
						<td>0g</td>
						<td>2.6g</td>
					</tr>
				
					<tr>
						<td>오징어링</td>
						<td>178Kcal / 64g</td>
						<td>10g</td>
						<td>374mg</td>
						<td>0g</td>
						<td>2.5g</td>
					</tr>
				
					<tr>
						<td>콘샐러드</td>
						<td>146Kcal / 100g</td>
						<td>2g</td>
						<td>190mg</td>
						<td>1g</td>
						<td>1.3g</td>
					</tr>
				
					<tr>
						<td>쉑쉑치킨</td>
						<td>229Kcal / 89g</td>
						<td>21g</td>
						<td>447mg</td>
						<td>2g</td>
						<td>1.7g</td>
					</tr>
				
					<tr>
						<td>포테이토(L)</td>
						<td>389Kcal / 130g</td>
						<td>6g</td>
						<td>471mg</td>
						<td>0g</td>
						<td>4.7g</td>
					</tr>
				
					<tr>
						<td>베이컨롱치즈스틱</td>
						<td>157Kcal / 49g</td>
						<td>7g</td>
						<td>227mg</td>
						<td>1g</td>
						<td>3.3g</td>
					</tr>
				
					<tr>
						<td>해쉬브라운</td>
						<td>150Kcal / 57g</td>
						<td>2g</td>
						<td>245mg</td>
						<td>0g</td>
						<td>4.0g</td>
					</tr>
				
					<tr>
						<td>해쉬브라운</td>
						<td>150Kcal / 57g</td>
						<td>2g</td>
						<td>245mg</td>
						<td>0g</td>
						<td>4.0g</td>
					</tr>
				
					<tr>
						<td>오렌지PET</td>
						<td>145Kcal / 400g</td>
						<td>2g</td>
						<td>15mg</td>
						<td>28g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>아이스커피L</td>
						<td>32Kcal / 520g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.5g</td>
					</tr>
				
					<tr>
						<td>아이스초코</td>
						<td>188Kcal / 340g</td>
						<td>2g</td>
						<td>155mg</td>
						<td>24g</td>
						<td>4.2g</td>
					</tr>
				
					<tr>
						<td>블루소다</td>
						<td>178Kcal / 310g</td>
						<td>0g</td>
						<td>4mg</td>
						<td>41g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>아이스라떼</td>
						<td>98Kcal / 295g</td>
						<td>4g</td>
						<td>56mg</td>
						<td>5g</td>
						<td>3.2g</td>
					</tr>
				
					<tr>
						<td>카페라떼</td>
						<td>210Kcal / 300g</td>
						<td>10g</td>
						<td>144mg</td>
						<td>12g</td>
						<td>7.8g</td>
					</tr>
				
					<tr>
						<td>망고피치</td>
						<td>97Kcal / 310g</td>
						<td>1g</td>
						<td>16mg</td>
						<td>20g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>레몬에이드</td>
						<td>151Kcal / 310g</td>
						<td>0g</td>
						<td>20mg</td>
						<td>34g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>콜라(R)</td>
						<td>128Kcal / 420g</td>
						<td>0g</td>
						<td>14mg</td>
						<td>31g</td>
						<td>0g</td>
					</tr>
				
					<tr>
						<td>사이다(R)</td>
						<td>133Kcal / 420g</td>
						<td>0g</td>
						<td>7mg</td>
						<td>31g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>우유</td>
						<td>179Kcal / 265g</td>
						<td>9g</td>
						<td>150mg</td>
						<td>13g</td>
						<td>7.6g</td>
					</tr>
				
					<tr>
						<td>아메리카노</td>
						<td>34Kcal / 290g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.5g</td>
					</tr>
				
					<tr>
						<td>아이스아메리카노</td>
						<td>32Kcal / 520g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.5g</td>
					</tr>
				
					<tr>
						<td>카페라떼</td>
						<td>210Kcal / 300g</td>
						<td>10g</td>
						<td>144mg</td>
						<td>12g</td>
						<td>7.8g</td>
					</tr>
				
					<tr>
						<td>아이스카페라떼</td>
						<td>98Kcal / 295g</td>
						<td>4g</td>
						<td>56mg</td>
						<td>5g</td>
						<td>3.2g</td>
					</tr>
				
					<tr>
						<td>스파클링아이스티</td>
						<td>114Kcal / 420g</td>
						<td>0g</td>
						<td>21mg</td>
						<td>27g</td>
						<td>0g</td>
					</tr>
				
					<tr>
						<td>망고피치</td>
						<td>97Kcal / 310g</td>
						<td>1g</td>
						<td>16mg</td>
						<td>20g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>오렌지주스(PET)</td>
						<td>145Kcal / 400g</td>
						<td>2g</td>
						<td>15mg</td>
						<td>28g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>스파클링 아이스티(S)</td>
						<td>72Kcal / 265g</td>
						<td>0g</td>
						<td>13mg</td>
						<td>17g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>아메리카노S</td>
						<td>27Kcal / 230g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.4g</td>
					</tr>
				
					<tr>
						<td>핫초코</td>
						<td>151Kcal / 215g</td>
						<td>2g</td>
						<td>124mg</td>
						<td>19g</td>
						<td>3.3g</td>
					</tr>
				
					<tr>
						<td>아이스초코</td>
						<td>188Kcal / 340g</td>
						<td>2g</td>
						<td>155mg</td>
						<td>24g</td>
						<td>4.2g</td>
					</tr>
				
					<tr>
						<td>블루소다</td>
						<td>178Kcal / 310g</td>
						<td>0g</td>
						<td>4mg</td>
						<td>41g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>사이다(L)</td>
						<td>182Kcal / 570g</td>
						<td>0g</td>
						<td>9mg</td>
						<td>42g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>콜라(L)</td>
						<td>174Kcal / 570g</td>
						<td>0g</td>
						<td>20mg</td>
						<td>42g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>레몬에이드</td>
						<td>151Kcal / 310g</td>
						<td>0g</td>
						<td>20mg</td>
						<td>34g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>아이스아메리카노</td>
						<td>32Kcal / 520g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.5g</td>
					</tr>
				
					<tr>
						<td>아메리카노</td>
						<td>34Kcal / 290g</td>
						<td>1g</td>
						<td>2mg</td>
						<td>0g</td>
						<td>0.5g</td>
					</tr>
				
					<tr>
						<td>콜라(R)</td>
						<td>128Kcal / 420g</td>
						<td>0g</td>
						<td>14mg</td>
						<td>31g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>사이다(R)</td>
						<td>133Kcal / 420g</td>
						<td>0g</td>
						<td>7mg</td>
						<td>31g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>스파클링아이스티</td>
						<td>114Kcal / 420g</td>
						<td>0g</td>
						<td>21mg</td>
						<td>27g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>콜라(L)</td>
						<td>174Kcal / 570g</td>
						<td>0g</td>
						<td>20mg</td>
						<td>42g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>사이다(L)</td>
						<td>182Kcal / 570g</td>
						<td>0g</td>
						<td>9mg</td>
						<td>42g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>PET콜라</td>
						<td>531Kcal / 1250g</td>
						<td>0g</td>
						<td>31mg</td>
						<td>138g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>PET사이다</td>
						<td>560Kcal / 1250g</td>
						<td>0g</td>
						<td>31mg</td>
						<td>100g</td>
						<td>0.0g</td>
					</tr>
				
			
					<tr>
						<td>아이스 아메리카노(L)</td>
						<td>55Kcal / 520g</td>
						<td>2g</td>
						<td>3mg</td>
						<td>0g</td>
						<td>0.8g</td>
					</tr>
				
					<tr>
						<td>콜라1.25L(PET)</td>
						<td>531Kcal / 1250g</td>
						<td>0g</td>
						<td>31mg</td>
						<td>138g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>트레비 플레인</td>
						<td>0Kcal / 500g</td>
						<td>0g</td>
						<td>15mg</td>
						<td>0g</td>
						<td>0g</td>
					</tr>
				
					<tr>
						<td>콜라(S)</td>
						<td>81Kcal / 265g</td>
						<td>0g</td>
						<td>9mg</td>
						<td>20g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>사이다(S)</td>
						<td>84Kcal / 265g</td>
						<td>0g</td>
						<td>4mg</td>
						<td>19g</td>
						<td>0.0g</td>
					</tr>
				
					<tr>
						<td>PET 사이다</td>
						<td>560Kcal / 1250g</td>
						<td>0g</td>
						<td>31mg</td>
						<td>100g</td>
						<td>0g</td>
					</tr>
				
					<tr>
						<td>모짜더블팩</td>
						<td>1894~1906Kcal / 1406g</td>
						<td>62g</td>
						<td>2551mg</td>
						<td>76g</td>
						<td>34g</td>
					</tr>
				
			
				
					<tr>
						<td>홈패밀리팩</td>
						<td>2536Kcal / 1969g</td>
						<td>72g</td>
						<td>3363mg</td>
						<td>159g</td>
						<td>27.6g</td>
					</tr>
				
				
				
					<tr>
						<td>T-REX팩</td>
						<td>1724 Kcal / 1384 g</td>
						<td>54 g</td>
						<td>2390 mg</td>
						<td>77 g</td>
						<td>17.6g</td>
					</tr>
				
				
					<tr>
						<td>홈패밀리팩</td>
						<td>2536Kcal / 1969g</td>
						<td>72g</td>
						<td>3363mg</td>
						<td>159g</td>
						<td>27.6g</td>
					</tr>
				
					<tr>
						<td>홈투게더팩</td>
						<td>2015Kcal / 1825g</td>
						<td>55g</td>
						<td>2156mg</td>
						<td>155g</td>
						<td>27.3g</td>
					</tr>
				
					<tr>
						<td>홈더블팩</td>
						<td>2039Kcal / 1754g</td>
						<td>57g</td>
						<td>2286mg</td>
						<td>150g</td>
						<td>28.9g</td>
					</tr>
				
					<tr>
						<td>양머리</td>
						<td>0Kcal / 0g</td>
						<td>0g</td>
						<td>0mg</td>
						<td>0g</td>
						<td>0g</td>
					</tr>
							
					<tr>
						<td>NEW 한우연인팩</td>
						<td>1680Kcal / 1379g</td>
						<td>47g</td>
						<td>2365mg</td>
						<td>79g</td>
						<td>22.5g</td>
					</tr>
				
					<tr>
						<td>NEW 한우명품팩</td>
						<td>1810~1822Kcal / 1441g</td>
						<td>57g</td>
						<td>2792mg</td>
						<td>79g</td>
						<td>26.5g</td>
					</tr>
				
					<tr>
						<td>싱글A팩</td>
						<td>1088Kcal / 952g</td>
						<td>39g</td>
						<td>1215mg</td>
						<td>51g</td>
						<td>25.3g</td>
					</tr>
				
					<tr>
						<td>싱글B팩</td>
						<td>1131Kcal / 949g</td>
						<td>33g</td>
						<td>1668mg</td>
						<td>53g</td>
						<td>22g</td>
					</tr>	 
				</tbody>	
			</table>
		</div>
		<%@include file="/cus/cus_scrollableFooter.jsp"%>
	</body>
</html>