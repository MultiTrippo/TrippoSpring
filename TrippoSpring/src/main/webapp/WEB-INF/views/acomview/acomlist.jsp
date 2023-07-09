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
<title>Trippo 숙소 검색결과</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
<%@ include file="/inc/top.jspf" %> 
<div class="test"> <h1> </h1>
<script>
$(function() {
	acom();
	//hotelid();
})


function acom(){
const settings = {
	async: true,
	crossDomain: true,
	url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/list?offset=0&arrival_date=${param.arrival_date}&departure_date=${param.departure_date}&guest_qty=${param.guest_qty}&dest_ids=${param.dest_ids}&room_qty=${param.room_qty}&search_type=${param.search_type}&children_qty=${param.children_qty}&price_filter_currencycode=KRW&languagecode=ko',
	method: 'GET',
	headers: {
		'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
		'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
	}
};

$.ajax(settings).done(function (response) {
	console.log(response.result);
	
	var hotel_id= $('#hotel_id').val();
	
	var arr=response.result;
	
	//var str='<form action="http://localhost:9090/myapp/acom" method="get">';
	if(!arr){
		alert('검색 결과 없습니다.');
		history.back();	
		return;
	}
	var str='';
	for(var i=0;i<arr.length;i++){
		var obj=arr[i]
		str+='<div class="listform">'
		str+='<input type="hidden" name="hotel_id" id="hotel_id">'
		str+='<p class="hotel_photo"><img src="'+obj.main_photo_url+'"></p>'	
		str+='<h2 class="hotel_name">'+obj.hotel_name+'</h2>'	
		str+='<h4 class="hotel_address">'+obj.address_trans+'</h4>'
		str+='<button class="gobt" onclick="goDetail(\''+obj.hotel_id+'\','+obj.review_score+')"> 자세히 </button>'
		str+='<p class="hotel_in">체크인: '+obj.checkin.from+'~ / 체크아웃:~'+obj.checkout.until+'</p>'
		str+='<p class="hotel_min">최저가:'+obj.min_total_price+'~</p>'
		str+='<br>'
		str+='<p class="hotel_review">이용자 평점:'+obj.review_score+' / '+obj.review_score_word+'</p>'
		str+='<p class="hotel_dis">모바일 결제시 '+obj.mobile_discount_percentage+'할인!!</p>'
		
		str+='</div>'
		
	}
	//str+='</form>';
	$('#acomlist').html(str)
});

}//------------function acom() =------------

/* 
} */

function hotelid(hotel_id){
	$('#hotel_id').val(hotel_id);
	
	$.ajax(settings).done(function (response) {
		console.log("hotel="+hotel_id);
	} );
}
function goDetail(hotel_id, score){
	
	location.href="acom?hotel_id="+hotel_id+"&score="+score;
}
</script>

	<div id='acomlist'>
	
	</div>
</div>
</body>
</html>