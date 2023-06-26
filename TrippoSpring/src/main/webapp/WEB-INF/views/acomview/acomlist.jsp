<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">

<!-- 반응형 웹을 위한 부트스르랩 설정 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- css 참조 -->
		<link rel="stylesheet" type="text/css" href="css/acom/acomlist.css">
		
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
<title>숙소 리스트 페이지</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 


</head>
<body>
<div class="test"> <h1>검색 조건에 맞는 숙소 </h1>
<script>
const settings = {
	async: true,
	crossDomain: true,
	url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/list?offset=0&arrival_date=${param.arrival_date}&departure_date=${param.departure_date}&guest_qty=${param.guest_qty}&dest_ids=${param.dest_ids}&room_qty=${param.room_qty}&search_type=${param.search_type}&children_qty=${param.children_qty}&price_filter_currencycode=KRW&languagecode=ko',
	method: 'GET',
	headers: {
		,
		'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
	}
};

$.ajax(settings).done(function (response) {
	console.log(response.result);
	var arr=response.result;
	var str='<ul>';
	for(var i=0;i<arr.length;i++){
		var obj=arr[i];
		str+='<li>'+obj.hotel_name+'</li>'	
		str+='<li><img src="'+obj.main_photo_url+'"></li>'	
	}
	str+='</ul>';
	$('#acomlist').html(str)
});
//이미지,이름 외에 추가 해야함
</script>

	<div id='acomlist'>
	
	</div>
</div>
</body>
</html>