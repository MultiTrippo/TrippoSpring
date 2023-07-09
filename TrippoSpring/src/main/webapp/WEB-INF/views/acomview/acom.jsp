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
<title>Trippo 숙소 정보</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
  
 
  <script>
  
  $(function(){
	  detail();
	  photo();
	  service();
	  policy();
	  room();
	  img();
  })
  
  function detail(){
  const settings = {
			async: true,
			crossDomain: true,
			url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/detail?hotel_id=${hotel_id}&search_id=123%3CREQUIRED%3E&departure_date=${acom.departure_date}&arrival_date=${acom.arrival_date}&rec_guest_qty=${acom.guest_qty}&rec_room_qty=${acom.room_qty}&languagecode=ko&currency_code=KRW',
			method: 'GET',
			headers: {
				'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
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
						'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
						'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					//console.log(response.data['${hotel_id}']);
					let uri_prefix='https://cf.bstatic.com';
					let arr=response.data['${hotel_id}'];
					for(var i=0;i<3;i++){
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
					'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
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
			$.ajax(settings).done(function (response) {
					
					var serv=response
					var str=""
					for(var i=16;i<serv.length;i++){
						let service=serv[i];
						let faci=service.facility_name
						str+='<span class="servic">＊'+faci+'<br></span>'
						
					}
					$('li#facil').html(str)
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
					'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(response);
				$.each(response, function(i, data){
					let str='';
					if(data.descriptiontype_id==6){
						//
						str=data.description;
						$('#acominfo').html(str);
					}else if(data.descriptiontype_id==7){
						str=data.description;
						$('#acompoli').html(str);
					}
				})
			});
   }//policy()-----------------
  
   function room(){// 객실정보 
	   const settings = {
				async: true,
				crossDomain: true,
				url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/v2/get-rooms?hotel_id=${hotel_id}&departure_date=${acom.departure_date}&arrival_date=${acom.arrival_date}&rec_guest_qty=${acom.guest_qty}&rec_room_qty=${acom.room_qty}&currency_code=KRW&languagecode=ko',
				method: 'GET',
				headers: {
					'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

	/* 		$.ajax(settings).done(function (response) {
				console.log(response);
				}); */
			
			$.ajax(settings).done(function (response) {
				console.log(response[0].rooms);
				});
				
		    $.ajax(settings).done(function (response) {
					var str=response[0].rooms;
					var arr=(Object.values(str));
					for(let i=0;i<3;i++){
						let des=arr[i].description;
						let photo=arr[i].photos; 
						let faciArr=arr[i].facilities;
						
						console.log("===photo====" + photo[0].url_640x200);
					
						switch(i){
						case 0:{ 
							//$('#roomimage1').attr('src', photo[0].url_640x200);
							let img1='<img class="img1" src="'+photo[0].url_max300+'">';
							$('.room1').html(img1);
							$('.room1').append(des);
							$.each(faciArr, function(j, faci){
								if(j<9){
									$('.room1').append("<li>"+faci.name+"</li>");
								}
							})
							
						}break;
						case 1:{
							let img2='<img class="img2" src="'+photo[0].url_max300+'">';
							$('.room2').html(img2);
							$('.room2').append(des);
							$.each(faciArr, function(j, faci){
								if(j<8){
									$('.room2').append("<li>"+faci.name+"</li>");
								}
							})
						}break;
						case 2: {
							let img3='<img class="img3" src="'+photo[0].url_max300+'">';
							$('.room3').html(img3);
							$('.room3').append(des);
							$.each(faciArr, function(j, faci){
								if(j<8){
									$('.room3').append("<li>"+faci.name+"</li>");
								}
							})
						
						}break;
					}
				}
				
			});//$
	   }//room()-------------

	//이미지 창 연결하기
	
	
/* 	function img(){
	const button = document.getElementById('plusimage');

		button.addEventListener('click', function() {
  		window.open('imgpopup?hotel_id=${hotel_id}', '_blank');
		});
	   } // img()----------- */
	
   </script>

</head>
<div class="scrollable-container">
  <!-- Content here -->
</div>

<body>
	<div class="form" style="width: 70%;margin-left: 15%;">
		<div class="acomname"> 
			<text id=korname></text>
			<text id=name> </text>
			<text id="addr"></text>
		</div>
		
		<div>
			<div class="acomcheckin"> 체크인 날짜 : ${acom.arrival_date}</div>
			<div class="acomcheckout">체크아웃 날짜 :${acom.departure_date}</div>
			<div class="people">인원: 성인${acom.guest_qty}명/아이${acom.children_qty}명</div>
		</div>
		
		<div style="display:flex">
			<div class="acomimage1">           <!-- 1번 가장 큰 이미지 불러오기 -->
			 <!--  <img class="img1">-->
			</div>
			<div class="acomimage2">
			<!-- <img class="img2"> -->
			</div>
			<div class="acomimage3"></div>
			<button id="plusimage" data-target="#myModal" data-toggle="modal" style="background-image:url('${pageContext.request.contextPath}/images/acomimage/purple.jpg')">
			이미지 더보기
			</button>
		</div>
		
		<div style="display:flex">
			<div class="roomservice"><text id="popular">숙소 내 인기시설</text>
			<div class="service" > </div>
		</div>
		
		<div class="review">
			<text id="titleScore">사용자 평점</text>
			<text id="Score">♥${param.score}</text>
		</div>
		
		<div class="location">구글 지도로 보기
		(서비스준비중입니다)
		</div>
	</div>
	
	
	<!--  네비바 설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
        $(()=>{
            //[1] 첫번째 탭에 해당하는 내용만 보여주기
            $('ul.panel li').not(':first').hide();
            //[2] ul.tab의 li a요소를 클릭했을 때 이벤트 처리
            //=> .selected 클래스를 추가하기
            $('ul.tab li a').click((e)=>{
                let $obj=$(e.currentTarget)
                $('ul.tab li a').removeClass('selected')
                if(!$obj.hasClass('selected')){
                    $obj.addClass('selected')
                }
                let showId=$obj.attr('href');
               // alert(showId)
               $('ul.panel li').not(showId).slideUp(1000);
               $(showId).slideDown(1000); 
            })

            //    클릭한 요소에 해당하는 내용을 효과 주어서 보여주기(slideDown()/slideUp())
        })
    </script>
	<!-- 네비게이션 바 연습 -->
<div class="container" id="con" style="margin:0; max-width:1332px;">	
<ul class="tab" style="background-color:white">
  <li>
    <a href="#roominfo" class="selected">객실 선택</a>
  </li>
  <li >
    <a href="#acominfo">숙소 정보</a>
  </li>
  <li >
    <a href="#facil">편의 시설</a>
  </li>
  <li >
    <a href="#acompoli">숙소 정책</a>
    
  </li>
</ul>
	<ul class="panel" style="background-color:#c4b0ff">
	<li id="roominfo" >
		<div class="infoo">
			<div class="room1" style="background-color:white"> 
			<img id="roomimage1">
			
			</div>
			
			<div class="room2" style="background-color:white">
			<img id="roomimage2">
			</div>
			
			<div class="room3" style="background-color:white">
			<img id="roomimage3">
			</div>
		</div>
	 </li>
	<li id="acominfo" style="background-color:white" style="border-radius: 30px"> </li>
	<li id="facil" style="background-color:white" style="border-radius: 30px"> </li>
	<li id="acompoli" style="background-color:white" style="border-radius: 30px"> </li>
	</ul>
	</div>
	
	
	</div><!-- 전체 div -->

	
	
	<!--  -->
	<%@ include file="/WEB-INF/views/acomview/imgpopup.jsp" %>
	
</body>
</html>