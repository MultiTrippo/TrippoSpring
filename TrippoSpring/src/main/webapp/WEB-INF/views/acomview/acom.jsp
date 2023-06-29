<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">

<!-- 반응형 웹을 위한 부트스르랩 설정 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- css 참조 -->
		<link rel="stylesheet" type="text/css" href="css/acom/acom.css">
		
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
<title>숙소 상세 정보 페이지</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
 
  <script>
  
  $(function(){
	  detail();
	  photo();
	  service();
	  policy();
	  room();
  })
  
  function detail(){
  const settings = {
			async: true,
			crossDomain: true,
			url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/detail?hotel_id=${hotel_id}&search_id=123%3CREQUIRED%3E&departure_date=${acom.departure_date}&arrival_date=${acom.arrival_date}&rec_guest_qty=${acom.guest_qty}&rec_room_qty=${acom.room_qty}&languagecode=ko&currency_code=KRW',
			method: 'GET',
			headers: {
				'X-RapidAPI-Key': ,
				'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
			}
		};

		$.ajax(settings).done(function (response) {
			
			let addr=response[0].address;
			$('#addr').html(addr);
		});//주소 추가
		
		$.ajax(settings).done(function (response) {
			console.log(response);
		});//콘솔에 결과창 찍기
		$.ajax(settings).done(function (response) {
			
			let korname=response[0].hotel_name_trans;
			$('#korname').html(korname);
		});// 숙소 한국이름
		
		$.ajax(settings).done(function (response) {
			
			let name=response[0].hotel_name;
			$('#name').html(name);
		});// 숙소 현지 이름
	

		
		
		
  }//detail()-----------------------------
		function photo(){
			const settings = {
					async: true,
					crossDomain: true,
					url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/get-hotel-photos?hotel_ids=${hotel_id}&languagecode=ko',
					method: 'GET',
					headers: {
						,
						'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					//console.log(response.data['${hotel_id}']);
					let uri_prefix='https://cf.bstatic.com';
					let arr=response.data['${hotel_id}'];
					for(var i=0;i<4;i++){
						let objArr=arr[i];
						let img1=objArr[5];
						
						
						$('div.acomimage'+(i+1)).css('background-image','url("'+uri_prefix+img1+'")')
						//$('.img'+(i+1)).attr('src', uri_prefix+img1)
						//$('.img2').attr('src', uri_prefix+img2)
					}
				});//이미지 결과 콘솔
   }//photo()
	function service(){
		const settings = {
				async: true,
				crossDomain: true,
				url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/get-facilities?hotel_ids=${hotel_id}&languagecode=ko',
				method: 'GET',
				headers: {
					',
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
			//	console.log(response);
				
				var serv=response
				var str=""
				for(var i=0;i<16;i++){
					let service=serv[i];
					let faci=service.facility_name
					str+='<span class="servic">▷'+faci+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>'
					
				}
				$('div.service').html(str)
			});
	   
	   //▷
	   
   }//service()
   
   function policy(){   //숙소 정보&정책을 불러온다
	   const settings = {
				async: true,
				crossDomain: true,
				url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/get-description?hotel_ids=${hotel_id}&languagecode=ko',
				method: 'GET',
				headers: {
					,
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(response);
			});
   }//policy()-----------------
   function room(){// 객실정보 
	   const settings = {
				async: true,
				crossDomain: true,
				url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/v2/get-rooms?hotel_id=${hotel_id}&departure_date=${acom.departure_date}&arrival_date=${acom.arrival_date}&rec_guest_qty=${acom.guest_qty}&rec_room_qty=${acom.room_qty}&currency_code=KRW&languagecode=ko',
				method: 'GET',
				headers: {
					,
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(response);
			});
	   }//room()-------------
  
  

	
	
   </script>

</head>
<div class="scrollable-container">
  <!-- Content here -->
</div>

<body>
	<div class="form" style="width: 70%;margin-left: 15%;">
	<div class="acomname"> 
	<h1 id=korname></h1>
	<h3 id=name> </h3>
	<h4 id="addr"></h4>
	</div>
	<div class="acomcheckin"> 체크인 날짜 : ${acom.arrival_date}</div>
	<div class="acomcheckout">체크아웃 날짜 :${acom.departure_date}</div>
	<div class="people">인원: 성인${acom.guest_qty}명/아이${acom.children_qty}명</div>
	<div class="acomimage1">           <!-- 1번 가장 큰 이미지 불러오기 -->
	 <img class="img1">
	</div>
	<div class="acomimage2">
	<img class="img2">
	</div>
	<div class="acomimage3"><img class="img3">
	</div>
	<div class="acomimage4">    </div>
	<div class="plusimage">이미지 더보기</div>
	<div class="roomservice"><h2>숙소 내 인기시설</h2>
	<div class="service" > </div>
	</div>
	<div class="review">이용자 평점</div>
	<div class="location">구글 지도로 보기</div>
	








	<!-- 네비게이션 바 연습 -->
	
<ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">객실 선택</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">숙소 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">편의 시설</a>
  </li>
  <li class="nav-item">
    <a class="nav-link ">숙소 정책</a>
  </li>
</ul>
	
	</div><!-- 전체 div -->
	
	
	
	
	
	
</body>
</html>