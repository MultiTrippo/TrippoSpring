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
		<input type='button' class="btn-two small rounded"  value="편도" id="one_way" onclick="toggleFlightType('ONE_WAY')"> 
			<input type='button' class="btn-two small rounded"  value="왕복" style="background-color:white; color:black" onclick="toggleFlightType('ROUND_TRIP')">		</div>	
		<br>
			<div id="container_two">
<span class="btn-two rounded" ><img src="images/flightImages/plane.png" width=30px; height=30px;> <input id="airport_dep" style="border:none;border-right:0px;border-top:0px;border-left:0px;" type="text" onchange="getAirport_dep(this.value)"></span>
<!--  <button id="swap-button" type="button" style="background-color:#9BD4DB">전환</button> -->
			<span class="btn-two rounded"><img src="images/flightImages/plane.png" width=30px; height=30px;> <input id="airport_arr"  style="border:none;border-right:0px;border-top:0px;border-left:0px;" type="text" value="" onchange="getAirport_arr(this.value)"></span>
			<span class="btn-two"><img src="images/flightImages/calender.png" width=30px; height=30px;> <input type="text" id="datepicker" style="border:0"></span>
			<span class="btn-two" id=dateCome><img src="images/flightImages/calender.png" width=30px; height=30px;> <input type="text" id="datepicker_round" style="border:0"></span>
				<select name="ppl" id="ppl">
				<option>인원 수</option>
		 	   	 <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				</select>
				<select name="seat_class" id="seat_class">
				<option>좌석 등급</option>
		 	   	 <option value="ECONOMY">ECONOMY</option>
				  <option value="PREMIUM_ECONOMY">PREMIUM_ECONOMY</option>
				  <option value="BUSINESS">BUSINESS</option>
				  <option value="FIRST">FIRST</option>
				</select>
				<input type='button' class=flight_type style="display: none">
				
			<span class=flight_set><button type="submit" style="background-color:#9BD4DB" onclick="init()">검색하기</button></span>
			</div>
	</div>
	<br>
	<div id="flight_body" style="background-color:white" >
	
<div id="flight-details" style="width: 100%; height: 100%;">
  <p></p>
</div>
	<script>
	let ticketType = ""; // 편도OR왕복
	window.onload = function() {
	  ticketTypeByColor();
	};

	function ticketTypeByColor() {
	  var button = document.getElementById("one_way");
	  if (button.style.backgroundColor == "#D2EFFF") {
	    ticketType = "ROUND_TRIP";
	  } else {
	    ticketType = "ONE_WAY";
	  }
	  console.log(ticketType);
	  printTicketType();
	}

	function printTicketType() {
	  console.log(ticketType);
	}
	let timeStringDep=""; //가는편출발시간
	let timeStringArr=""; //가는편도착시간
	let timeStringDepR=""; //오는편출발시간
	let timeStringArrR=""; //오는편도착시간
	let airport_departure="";
	let airport_arrival=""; 
	let ppl=$("#ppl option:selected").text(); //인원수
	let seat_class=$("#seat_class option:selected").text(); //좌석등급
	let oneway_time;
	let round_time;
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
	    var dateOfCome = $("#dateCome");
	    if (flightType === "ROUND_TRIP") {
	        roundTripElements.show();
	        dateOfCome.show();
	        $(".btn-two[value='편도']").css("background-color", "#D2EFFF");
	        $(".btn-two[value='왕복']").css("background-color", "#C6D7F3");
	        ticketType="ROUND_TRIP";
	    } else {
	        roundTripElements.hide();
	        dateOfCome.hide();
	        $(".btn-two[value='편도']").css("background-color", "#C6D7F3");
	        $(".btn-two[value='왕복']").css("background-color", "#D2EFFF");
	        ticketType="ONE_WAY";
	    }
	}//--------------편도/왕복
	
	function init(){
		airport_departure=$('#airport_dep').val().toUpperCase();
		airport_arrival=$('#airport_arr').val().toUpperCase();
		ppl=$('#ppl').val();
		seat_class=$('#seat_class').val();
		oneway_time=$('#datepicker').val();
		round_time=$('#datepicker_round').val();
		 var onewayElement = document.getElementById("one_way");
		 var computedStyle = window.getComputedStyle(onewayElement);
		 var backgroundColor = computedStyle.backgroundColor;
		 ticketType = onewayElement.style.backgroundColor === "rgb(198, 215, 243)" ? "ONE_WAY" : "ROUND_TRIP";
		 console.log(onewayElement.style.backgroundColor);
		 console.log(ticketType);
		/* alert(airport_departure+"====================");
		alert(airport_departure);
		alert(airport_arrival);
		alert(ppl);
		alert(seat_class);
		alert(oneway_time);
		alert(round_time); */
		//let a=`https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=${airport_departure}&destinationAirportCode=${airport_arrival}&date=${oneway_time}&itineraryType=ROUND_TRIP&sortOrder=PRICE&numAdults=${ppl}&numSeniors=0&classOfService=${seat_class}&returnDate=${round_time}&pageNumber=1&nonstop=yes&currencyCode=USD`,
		//alert(a);				
	const settings = {
			async: true,
			crossDomain: true,
			//url: 'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=ICN&destinationAirportCode=JFK&date=2023-07-12&itineraryType=ROUND_TRIP&sortOrder=PRICE&numAdults=1&numSeniors=0&classOfService=ECONOMY&returnDate=2023-07-19&pageNumber=1&nonstop=yes&currencyCode=USD',
			url: `https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchFlights?sourceAirportCode=\${airport_departure}&destinationAirportCode=\${airport_arrival}&date=\${oneway_time}&itineraryType=\${ticketType}&sortOrder=PRICE&numAdults=\${ppl}&numSeniors=0&classOfService=\${seat_class}&returnDate=\${round_time}&pageNumber=1&nonstop=yes&currencyCode=USD`,
					method: 'GET',
			headers: {
				'X-RapidAPI-Key': '60c5ede577msh7e68a54b4501c1bp180965jsna4480f0218b9',
				'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com'
			}
		};
	
		$.ajax(settings).done(function (response) {
			
		    var flights = response.data.flights;
		    //alert(JSON.stringify(response));
		    
		    for (var i = 0; i < Math.min(flights.length, 10); i++) {
		    	//	if (flightNumbers.includes(flightNumber)) {
		     	 //      continue; // Skip this flight if the flight number is already present
		        //}
		    	//flightNumbers.push(flightNumber);
		    	timeStringDep=flights[i].segments[0].legs[0].departureDateTime;
		    	let timeStringDepTo=timeStringDep.substring(11,16);
		    	timeStringArr=flights[i].segments[0].legs[0].arrivalDateTime;
		    	let timeStringArrTo=timeStringArr.substring(11,16);
		        var result = "";
		        //if (flights.segments.legs[i].layovers.length === 0) {
		        result += "<div class='flight-info' style='border: 0.5px solid black; padding: 10px;'>";
		        result += "<img src='" + flights[i].segments[0].legs[0].operatingCarrier.logoUrl + "' width=60px, height=60px/> ";
		        result += "<strong style='font-size: 20pt;' >" + flights[i].segments[0].legs[0].operatingCarrier.displayName + "</strong> ";
		       //result += "좌석등급: " + flights[i].segments[0].legs[0].classOfService + "  ";
		        //result += "출발 시간: " + timeStringDepTo + " => 도착 시간: " +timeStringArrTo+ "    ";
		        if(flights[i].segments[0].legs[0].destinationStationCode != airport_arrival ){
		        	result +=  timeStringDepTo+"<span style='font-size: 0.9em; color: skyblue;'>"+flights[i].segments[0].legs[0].originStationCode +"</span> => "+timeStringArrTo+"<span style='font-size: 0.9em; color:skyblue;'>"+airport_arrival+ "</span>		";}
		        else{
		        	result +=  timeStringDepTo+"<span style='font-size: 0.9em; color: skyblue;'>"+flights[i].segments[0].legs[0].originStationCode +"</span> => "+timeStringArrTo+"<span style='font-size: 0.9em; color:skyblue;'>"+flights[i].segments[0].legs[0].destinationStationCode+ "</span>		";}
		        result += " 가격: <strong style='font-size: 15pt; text-align:right;' >" + Math.round(flights[i].purchaseLinks[0].totalPrice*1300).toLocaleString() + "원~ </strong><br>";
		        //result += "배급업체: " + "<strong>" + flights[i].purchaseLinks[0].providerId + " </strong><br>";
		        //result += "항공편 번호: " + flights[i].segments[0].legs[0].flightNumber + "<br>";
		        //result += "상품명: " + "<strong>" + response.data.flights[i].purchaseLinks[0].commerceName + "</strong><br>";
		        //result += "항공편 번호 (왕복): " + response.data.flights[i].segments[1].legs[0].flightNumber + "<br>";
				//result += "항공사 이름 (왕복): " + response.data.flights[i].segments[1].legs[0].operatingCarrier.displayName + "<br>";
				
				
		        //왕복표 관련
		    
		        if(ticketType="ROUND_TRIP" && flights[i].segments[1] != null){
		        timeStringDepR=flights[i].segments[1].legs[0].departureDateTime;
		    	let timeStringDepToR=timeStringDepR.substring(11,16);
		    	timeStringArrR=flights[i].segments[1].legs[0].arrivalDateTime;
		    	let timeStringArrToR=timeStringArrR.substring(11,16);
		         result += "<img src='" + response.data.flights[i].segments[1].legs[0].operatingCarrier.logoUrl + "' width=60px, height=60px/> ";
		        result += "<strong style='font-size: 20pt;' >" + flights[i].segments[1].legs[0].operatingCarrier.displayName + "</strong>	";
		       // result += "좌석등급 (왕복): " + response.data.flights[i].segments[1].legs[0].classOfService + "		";
				//result += "출발 시간: " + timeStringDepToR + " => 도착 시간: " +timeStringArrToR+ "	";
				result += timeStringDepToR+"<span style='font-size: 0.9em; color:skyblue;'>"+response.data.flights[i].segments[1].legs[0].originStationCode +"</span> => ";
				
				if(response.data.flights[i].segments[1].legs[0].destinationStationCode != airport_departure ){
				result += timeStringArrToR+"<span style='font-size: 0.9em; color:skyblue;'>"+airport_departure + "</span> (경유 포함)<br>";
				}else{result += timeStringArrToR+"<span style='font-size: 0.9em; color:skyblue;'>"+response.data.flights[i].segments[1].legs[0].destinationStationCode + "</span><br>";}
		        result += "</div>";
		        }// if -ticketType
		        else if(ticketType="ONE_WAY" ){
		        	result += "</div>";
		        }
		       
		        
		         //if(flights[i].segments[1] != null ){
		        //	 result += "<div class='flight-info-round' style='border: 0.5px solid black; padding: 10px; display: none;'>"
	var flightElement = $("<div>").addClass("flight-info").html(result); // 새로운 div를 생성하고 클래스를 추가하여 스타일을 적용
		        $("#flight-details").append(flightElement);
		    }//for--
		});
	}
	</script>
	<!-- calendar function -->
	<script>
	$(document).ready(function() {
		$("#datepicker").datepicker({

				dateFormat:"yy-mm-dd",
				dayNamesMin:["일", "월", "화", "수", "목", "금", "토"],
				monthNames:["1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월"],
							onSelect:function(d){
								var arr=d.split("-");
				oneway_time=arr[0].trim()+"-"+arr[1].trim()+"-"+arr[2].trim();
			}
		});

  	$("#datepicker_round").datepicker({

	dateFormat:"yy-mm-dd",
	dayNamesMin:["일", "월", "화", "수", "목", "금", "토"],
	monthNames:["1월", "2월", "3월", "4월", "5월", "6월",
				"7월", "8월", "9월", "10월", "11월", "12월"],
				onSelect:function(d){
					var arr=d.split("-");
	round_time=arr[0].trim()+"-"+arr[1].trim()+"-"+arr[2].trim();
			}
		});
	});//--- readyfunction
	
	
	/*$("#swap-button").click(function() {
  	    var origin = $(".container_two .rounded.bordered").text();
  	    var destination = $(".container_two .rounded:not(.bordered)").text();

  	    $(".container_two .rounded.bordered").text(destination);
  	    $(".container_two .rounded:not(.bordered)").text(origin);
  	  }); */
	</script>
	</div>
</div>
</body>
</html>