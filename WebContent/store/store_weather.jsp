<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="store_setting.jsp"%>
<%-- <link rel="stylesheet" type="text/css" href="${project}weather.css"> --%>

<c:forEach var="eachlonlat" items="${storeLonLat}">
	<fmt:parseNumber var="store_lat" value="${eachlonlat.store_lat}" scope="session"/>
	<fmt:parseNumber var="store_lon" value="${eachlonlat.store_lon}" scope="session"/>
</c:forEach>
<br>
<div class="container">
  <div class="row">
    <div class="col-md-6 col-xs-8 col-xs-push-2 col-md-push-3">
      <div class="weather text-center" style="background-color: rgba(236, 240, 241, 0.8);
  padding: 10px 0px;
  border-radius: 5px;
  ">
        <h2 class="temp"></h2>
        <h3><span class="city"></span>, <span class="country"></span></h3>
        <div class="iconpic" style="">
          <img src="" class=''>
        </div>
        <h4 class="weatherDetail"></h4>
      </div><!--weather-->
    </div>
  </div><!--row-->
  <br/>
</div>

<!-- <div id="icon"><img id="wicon" src="" alt="Weather icon"/></div>
<div id="weathertext"></div> -->
<script>
$.ajax({
    url: "https://api.openweathermap.org/data/2.5/weather?lat="+${store_lat}+"&lon="+${store_lon}+"&APPID=69125c4f65a786042a9266798504c230",
    type: 'GET',
    dataType: 'json',
    success: function(data) {
    console.log(data);
      var temprature=Math.round(data.main.temp- 273.15);
      var icon=data.weather[0].icon;
      var weatherDetail=data.weather[0].main+", "+data.weather[0].description;
      $('.city').html(data.name);
      $('.country').html(data.sys.country);
      $('.weatherDetail').html(weatherDetail); //update weather description in html
      $('.iconpic>img').attr('src','https://openweathermap.org/img/w/'+icon+'.png'); //update the icon based on weather
      $('.temp').html(temprature+"&#8451;"); //update the temprature
    },
    error: function(err) {
      alert('Oops something went wrong, Please try again.');
      console.log(err);
    }
  });
/* /*  $.ajax({
    url: "http://api.openweathermap.org/data/2.5/weather?lat="+${store_lat}+"&lon="+${store_lon}+"&APPID=69125c4f65a786042a9266798504c230",
    dataType: "json",
    type: "GET",
    //async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );

 		var iconcode = resp.weather[0].icon;
        var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png";
        $('#wicon').attr('src', iconurl);
        $('#weathertext').html(
        		"현재온도 : "+ Math.round(resp.main.temp- 273.15) +" °C" + "<br>" +
        		"현재습도 : "+ resp.main.humidity + "<br>" +
        		"날씨 : "+ resp.weather[0].main + "<br>" +
        		"바람   : "+ resp.wind.speed + "<br>" + 
        		"나라   : "+ resp.sys.country + "<br>" + 
        		"도시이름  : "+ resp.name + "<br>" +
        		"구름  : "+ (resp.clouds.all) +"%"
        );
        
     }
});  */ 

</script>