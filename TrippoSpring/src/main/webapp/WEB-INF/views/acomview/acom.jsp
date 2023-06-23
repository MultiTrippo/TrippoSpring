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
	  init();
	  get_addr();
	  get_krname();
	  get_image1();
	  get_image2();
	  get_image3();
  })
  
  function init(){
	  const settings = {
  
			async: true,
			crossDomain: true,
			url: 'https://hotels-com-provider.p.rapidapi.com/v2/meta/convert/slug-id?slug=ho219115',
			method: 'GET',
			headers: {
				'X-RapidAPI-Key': '',
				'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
			}
		};

		$.ajax(settings).done(function (response) {
			console.log(JSON.stringify(response));
			test(response.data);
		});
  }//init()------------------------------호텔No로 id 불러옴--------
 
  function get_addr(){
	  const settings = {
				async: true,
				crossDomain: true,
				url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?domain=KR&locale=ko_KR&hotel_id=1105156',
				method: 'GET',
				headers: {
					'X-RapidAPI-Key': '',
					'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(JSON.stringify(response.summary.location.address.addressLine));
				let addr=response.summary.location.address.addressLine;
				$('div.acomname>h4').append(addr);
			});
  }//addr()-----------------------호텔ID로 주소 불러옴-----
  	function get_krname(){
  		const settings = {
  				async: true,
  				crossDomain: true,
  				url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?domain=KR&locale=ko_KR&hotel_id=1105156',
  				method: 'GET',
  				headers: {
  					'X-RapidAPI-Key': '',
  					'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
  				}
  			};

  			$.ajax(settings).done(function (response) {
  				console.log(JSON.stringify(response.summary.name));
  				let krname=response.summary.name;
  				$('div.acomname>h1').append(krname);
  			});
  }//get_krname()0-----------------숙소 한국 이름 가져옴----------------------------
		
  function test(hid){
			
			const settings = {
					async: true,
					crossDomain: true,
					url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/info?hotel_id='+hid+'&locale=en_GB&domain=AE',
					method: 'GET',
					headers: {
						'X-RapidAPI-Key': '',
						'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					console.log(JSON.stringify(response.propertyContentSectionGroups.aboutThisProperty.sections[0].bodySubSections[0].elements[0].header.text));
					let res=response.propertyContentSectionGroups.aboutThisProperty.sections[0].bodySubSections[0].elements[0].header.text;
					$('div.acomname>h3').append(res);
				});
		}// hid()---------------------------숙소 이름 불러옴(영문)-----------------
		
		function get_image1(){
			
			const settings = {
					async: true,
					crossDomain: true,
					url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?domain=KR&locale=ko_KR&hotel_id='+hid+'',
					method: 'GET',
					headers: {
						'X-RapidAPI-Key': '',
						'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					console.log(JSON.stringify(response.propertyGallery.images[0].image.url));
				 	let image1=response.propertyGallery.images[0].image.url
				 	$('div.acomimage1>img').attr('src', image1);
				});
		}
			//get_image1-----------------------숙소외관 이미지 불러옴----------------------
			
			
			function get_image2(){
			
			const settings = {
					async: true,
					crossDomain: true,
					url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?domain=KR&locale=ko_KR&hotel_id='+hid+'',
					method: 'GET',
					headers: {
						'X-RapidAPI-Key': '',
						'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					console.log(JSON.stringify(response.propertyGallery.images[1].image.url));
				 	let image2=response.propertyGallery.images[1].image.url
				 	$('div.acomimage2>img').attr('src', image2);
				});
		}
			//get_image2-----------------------2번째 이미지 불러옴----------------------
			
			function get_image3(){
			
			const settings = {
					async: true,
					crossDomain: true,
					url: 'https://hotels-com-provider.p.rapidapi.com/v2/hotels/summary?domain=KR&locale=ko_KR&hotel_id='+hid+'',
					method: 'GET',
					headers: {
						'X-RapidAPI-Key': '',
						'X-RapidAPI-Host': 'hotels-com-provider.p.rapidapi.com'
					}
				};

				$.ajax(settings).done(function (response) {
					console.log(JSON.stringify(response.propertyGallery.images[2].image.url));
				 	let image3=response.propertyGallery.images[2].image.url
				 	$('div.acomimage3>img').attr('src', image3);
				});
		}
			//get_image3-----------------------3번째 이미지 불러옴----------------------
			
			// api key 다 지웠음
		
	</script>

</head>
<body>
	<div class="acomname"> 
	<h1></h1>
	<h3></h3>
	<h4></h4>
	</div>
	<div class="acomcheckin"> 체크인 날짜</div>
	<div class="acomcheckout"> 체크아웃 날짜</div>
	<div class="people"> 인원수 선택</div>
	<div class="acomimage1">           <!-- 1번 가장 큰 이미지 불러오기 -->
	 <img class="img1">
	</div>
	<div class="acomimage2">
	<img class="img2">
	</div>
	<div class="acomimage3"><img class="img3">
	</div>
	<div class="plusimage">이미지 더보기</div>
	<div class="roomservice">숙소 내 인기시설</div>
	<div class="review">이용자 평점</div>
	<div class="location">구글 지도로 보기</div>
	
	
	
	
	
	
	
</body>
</html>