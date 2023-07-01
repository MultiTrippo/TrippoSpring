<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="css/flight_reservation.css">
<!-- Bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- ------------ -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<title>Flight Reservation_two</title>

</head>
<body>
<!-- Bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- ------------ -->
<body>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<!-- calendar -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<!-- ------------- -->
<div style="background-color:#D2EFFF">
	<div id="flight_header" style="background-color:white">
		<div id="container">
		<input type='button' class="btn-two small rounded" style="background-color:#C6D7F3;" value="왕복" > <input type='button' class="btn-two small rounded" value="편도" style="background-color:white; color:black">
		</div>	
		<br>
			<div id="container_two">
<span class="btn-two rounded bordered" >서울</span>
			<span class="btn-two rounded">뉴욕</span>
			<span class="btn-two"><input type="text" id="datepicker" style="border:0"></span>
			<span class="btn-two"><input type="text" id="datepicker_round" style="border:0"></span>
				<select name="dropdown">
		 	   	 <option value="1ea">1명</option>
				  <option value="2ea">2명</option>
				  <option value="3ea">3명</option>
				  <option value="4ea">4명</option>
				  <option value="5ea">5명</option>
				</select>
			<span class=flight_set><button type="submit" style="background-color:#9BD4DB">검색하기</button></span>
		
			</div>
	</div>
	<br>
	<div id="flight_body" style="background-color:white" >
	
<div id="flight-details">
  <h3>항공권 상세 정보</h3>
  <p></p>
</div>
	<script>

	const settings = {
			async: true,
			crossDomain: true,
			url: 'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=BOM&destinationAirportCode=DEL&date=2023-07-03&itineraryType=ROUND_TRIP&sortOrder=PRICE&numAdults=1&numSeniors=0&classOfService=BUSINESS&returnDate=2023-07-13&pageNumber=1&currencyCode=USD',
			method: 'GET',
			headers: {
				'X-RapidAPI-Key': '',
				'X-RapidAPI-Host': ''
			}//api재적용
		};

	$.ajax(settings).done(function (response) {
		var result = "";
		result += "상품명: " + "<strong>" + response.data.flights[0].purchaseLinks[0].commerceName + "</strong><br>";
		result += "가격: " + "<strong>" + response.data.flights[0].purchaseLinks[0].totalPrice + "$ </strong><br>";
		result += "배급업체: " + "<strong>" + response.data.flights[0].purchaseLinks[0].providerId + " </strong><br>";
		
		result += "좌석등급: " + response.data.flights[0].segments[0].legs[0].classOfService + "<br>";
		result += "항공편 번호: " + response.data.flights[0].segments[0].legs[0].flightNumber + "<br>";
		result += "항공사 이름: " + response.data.flights[0].segments[0].legs[0].operatingCarrier.displayName + "<br>";
		result += "항공사 이미지: " + "<img src='" + response.data.flights[0].segments[0].legs[0].operatingCarrier.logoUrl + "'/><br>";
		result += "출발 시간: " + response.data.flights[0].segments[0].legs[0].departureDateTime + "<br>";
		result += "출발 공항: " + response.data.flights[0].segments[0].legs[0].originStationCode + "<br>";
		result += "도착 시간: " + response.data.flights[0].segments[0].legs[0].arrivalDateTime + "<br>";
		result += "도착 공항: " + response.data.flights[0].segments[0].legs[0].destinationStationCode + "<br>";
		
		//result += "좌석등급 (왕복): " + response.data.flights[0].segments[0].legs[1].classOfService + "<br>";
		//result += "항공편 번호 (왕복): " + response.data.flights[0].segments[0].legs[1].flightNumber + "<br>";
		//result += "항공사 이름 (왕복): " + response.data.flights[0].segments[0].legs[1].operatingCarrier.displayName + "<br>";
		//result += "항공사 이미지 (왕복): " + "<img src='" + response.data.flights[0].segments[0].legs[1].operatingCarrier.logoUrl + "'/><br>";
		//result += "출발 시간 (왕복): " + response.data.flights[0].segments[0].legs[1].departureDateTime + "<br>";
		//result += "도착 시간 (왕복): " + response.data.flights[0].segments[0].legs[1].arrivalDateTime + "<br>";
		//result += "출발 공항 (왕복): " + response.data.flights[0].segments[0].legs[1].originStationCode + "<br>";
		//result += "도착 공항 (왕복): " + response.data.flights[0].segments[0].legs[1].destinationStationCode + "<br>";
		
		$("p").append(result);
	});
	</script>
	<!-- calendar function -->
	<script>
	$(document).ready(function() {
  	$("#datepicker").datepicker();
  	$("#datepicker_round").datepicker();
	});
	</script>
	</div>
</div>
</body>
</html>