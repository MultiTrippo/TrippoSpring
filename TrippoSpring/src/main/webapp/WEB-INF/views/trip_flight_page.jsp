<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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

<title>Flight Reservation</title>

</head>
<body>
<!-- Bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- ------------ -->
<body>

<div style="background-color:#D2EFFF">
	<div id="flight_header" style="background-color:white">
		<div id="container">
		<input type='button' class="btn-two small rounded" style="background-color:#C6D7F3;" value="왕복" > <input type='button' class="btn-two small rounded" value="편도" style="background-color:white; color:black">
		</div>	
		<br>
			<div id="container_two">
			<span class="btn-two rounded bordered" >서울</span>
			<a href="https://kr.lovepik.com/images/png-cell-phone-icon.html"></a>
			<span class="btn-two rounded">뉴욕</span>
			<span class="btn-two">2023.07.12.수</span>
			<span class="btn-two">2023.07.15.토</span>
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
	<h1> api 적용중....</h1>
	</div>
</div>
</body>
</html>