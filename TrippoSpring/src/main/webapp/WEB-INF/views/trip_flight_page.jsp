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
		<input type='button' class="btn-two small rounded" value="편도" onclick="toggleFlightType('ONE_WAY')"> 
			<input type='button' class="btn-two small rounded" value="왕복" style="background-color:white; color:black" onclick="toggleFlightType('ROUND_TRIP')">		</div>	
		<br>
			<div id="container_two">
<span class="btn-two rounded bordered" ><input id="airport_dep" type="text" onchange="getAirport_dep(this.value)"></span>
<button id="swap-button" type="button" style="background-color:#9BD4DB">전환</button>
			<span class="btn-two rounded"><input id="airport_arr" type="text" value="" onchange="getAirport_arr(this.value)"></span>
			<span class="btn-two"><input type="text" id="datepicker" style="border:0"></span>
			<span class="btn-two"><input type="text" id="datepicker_round" style="border:0"></span>
				<select name="ppl" id="ppl">
		 	   	 <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				</select>
				<select name="seat_class" id="seat_class">
		 	   	 <option value="ECONOMY">Economy</option>
				  <option value="PREMIUM_ECONOMY">Premium Economy</option>
				  <option value="BUSINESS">Business</option>
				  <option value="FIRST">First</option>
				</select>
			<span class=flight_set><button type="submit" style="background-color:#9BD4DB">검색하기</button></span>
		
			</div>
	</div>
	<br>
	<div id="flight_body" style="background-color:white" >
	
<div id="flight-details" style="width: 100%; height: 100%;">
  <p></p>
</div>
	<script>
	
	let airport_departure;
	let airport_arrival;
	let ppl=$("#ppl option:selected").text(); //인원수
	let seat_class=$("#seat_class option:selected").text(); //좌석등급
	let oneway_time= $("#datepicker").text();
	let round_time= $("#datepicker_round").text();
	function getAirport_dep(val){
		airport_departure=val;
		//console.log(val);
		//test2(val);
	}//출발공항
	function getAirport_arr(val){
		airport_arrival=val;
		//console.log(val);
		//test2(val);
	}//도착공항
	function getOnewayTime(val){
		oneway_time=val;
	}
	function getRoundTime(val){
		round_time=val;
	}
	function toggleFlightType(flightType) {
	    var roundTripElements = $(".flight-info-round");
	    if (flightType === "ROUND_TRIP") {
	        roundTripElements.show();
	        $(".btn-two[value='편도']").css("background-color", "#D2EFFF");
	        $(".btn-two[value='왕복']").css("background-color", "#C6D7F3");
	    } else {
	        roundTripElements.hide();
	        $(".btn-two[value='편도']").css("background-color", "#C6D7F3");
	        $(".btn-two[value='왕복']").css("background-color", "#D2EFFF");
	    }
	}//--------------편도/왕복
		const settings = {
				
				async: true,
				crossDomain: true,
				url: 'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=ICN&destinationAirportCode=JFK&date=2023-07-12&itineraryType=ROUND_TRIP&sortOrder=PRICE&numAdults=1&numSeniors=0&classOfService=ECONOMY&returnDate=2023-07-19&pageNumber=1&currencyCode=USD',
				method: 'GET',
				headers: {
					'X-RapidAPI-Key': '',
					'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com'
				}
			};
		$.ajax(settings).done(function (response) {
		    var flights = response.data.flights;
		    var flightNumbers = [];
		    
		    for (var i = 0; i < Math.min(flights.length, 10); i++) {
		    	var flightNumber = flights[i].segments[0].legs[0].flightNumber;
		     
		    	//	if (flightNumbers.includes(flightNumber)) {
		     	 //      continue; // Skip this flight if the flight number is already present
		        //}
		    	//flightNumbers.push(flightNumber);
		    	
		        var result = "";
		       // if (flights[i].segments.legs.layovers.length === 0) {
		        result += "<div class='flight-info' style='border: 0.5px solid black; padding: 10px;'>";
		        result += "<img src='" + flights[i].segments[0].legs[0].operatingCarrier.logoUrl + "'/> ";
		        result += "<strong>" + flights[i].segments[0].legs[0].operatingCarrier.displayName + "</strong><br>";
		        result += "가격: " + "<strong>" + flights[i].purchaseLinks[0].totalPrice + "$ </strong><br>";
		        result += "배급업체: " + "<strong>" + flights[i].purchaseLinks[0].providerId + " </strong><br>";
		        result += "좌석등급: " + flights[i].segments[0].legs[0].classOfService + "<br>";
		        result += "항공편 번호: " + flights[i].segments[0].legs[0].flightNumber + "<br>";
		        result += "출발 시간: " + flights[i].segments[0].legs[0].departureDateTime + "<br>";
		        result += "출발 공항: " + flights[i].segments[0].legs[0].originStationCode + "<br>";
		        result += "도착 시간: " + flights[i].segments[0].legs[0].arrivalDateTime + "<br>";
		        result += "도착 공항: " + flights[i].segments[0].legs[0].destinationStationCode + "<br>";
		        result += "</div>";
		        
		        //result += "상품명: " + "<strong>" + response.data.flights[i].purchaseLinks[0].commerceName + "</strong><br>";
		        result += "<div class='flight-info-round' style='border: 0.5px solid black; padding: 10px; display: none;'>"
				result += "좌석등급 (왕복): " + response.data.flights[i].segments[0].legs[1].classOfService + "<br>";
				result += "항공편 번호 (왕복): " + response.data.flights[i].segments[0].legs[1].flightNumber + "<br>";
				result += "항공사 이름 (왕복): " + response.data.flights[i].segments[0].legs[1].operatingCarrier.displayName + "<br>";
				result += "항공사 이미지 (왕복): " + "<img src='" + response.data.flights[i].segments[0].legs[1].operatingCarrier.logoUrl + "'/><br>";
				result += "출발 시간 (왕복): " + response.data.flights[i].segments[0].legs[1].departureDateTime + "<br>";
				result += "도착 시간 (왕복): " + response.data.flights[i].segments[0].legs[1].arrivalDateTime + "<br>";
				result += "출발 공항 (왕복): " + response.data.flights[i].segments[0].legs[1].originStationCode + "<br>";
				result += "도착 공항 (왕복): " + response.data.flights[i].segments[0].legs[1].destinationStationCode + "<br>";
		        result += "</div>"; // 새로운 항공편을 감싸는 </div>
		       // }
				var flightElement = $("<div>").addClass("flight-info").html(result); // 새로운 div를 생성하고 클래스를 추가하여 스타일을 적용
		        $("#flight-details").append(flightElement);
		    }
		});
	</script>
	<!-- calendar function -->
	<script>
	$(document).ready(function() {
  	$("#datepicker").datepicker();
/*   		onSelect: function(){
  			var date= $.datepicker.formatDate("yyyy-mm-dd"),$("datepicker").datepicker("getDate"));
  			
  			date=$("#datepicker").val();
  		}
  	}); */
  	$("#datepicker_round").datepicker();
  	/* 	onSelect: function(){
  			var date= $.datepicker.formatDate("yyyy-mm-dd"),$("datepicker_round").datepicker("getDate"));
  	
  			date=$("#datepicker_round").val();
  		}
  	}); */
  	
	});//--- readyfunction
	
	$("#swap-button").click(function() {
  	    var origin = $(".container_two .rounded.bordered").text();
  	    var destination = $(".container_two .rounded:not(.bordered)").text();

  	    $(".container_two .rounded.bordered").text(destination);
  	    $(".container_two .rounded:not(.bordered)").text(origin);
  	  });
	</script>
	</div>
</div>
</body>
</html>