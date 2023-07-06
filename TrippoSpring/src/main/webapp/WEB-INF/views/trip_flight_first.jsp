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

<title>Flight Reservation_one</title>
 <style>
      div.full {
        width: 100%;
        height: 500px;
        border: 1px solid #003458;
      }
      div.left {
        width: 30%;
        float: left;
        box-sizing: border-box;
        background: #8977ad;
      }
      div.right {
        width: 70%;
        float: right;
        box-sizing: border-box;
        background: #ece6cc;
      }
 </style>
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
<div class="full">
<div class="left"></div>
<div class="right">
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
			<br>
			<span class="btn-two"><input type="text" id="datepicker" style="border:0"></span>
			<br>
			<span class="btn-two"><input type="text" id="datepicker_round" style="border:0"></span>
			<br>
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
				<form id="flightSearchForm" action="/trip_flight_page" method="get">
			<span class=flight_set>
			<button type="submit" style="background-color:#9BD4DB">검색하기</button>
			</span>
		
			</div>
	</div>
	<br>
	</div>  <!-- right -->
</div> <!-- full -->
	<script>
	
	let airport_departure;
	let airport_arrival;
	let ppl=$("#ppl option:selected").text(); //인원수
	let seat_class=$("#seat_class option:selected").text(); //좌석등급
	let oneway_time="";
	let round_time="";
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