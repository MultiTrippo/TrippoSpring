<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">

<!-- 반응형 웹을 위한 부트스르랩 설정 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- css 참조 -->
		<link rel="stylesheet" type="text/css" href="css/acom/Acomsearch.css">
		
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
<title>숙소 리스트 페이지</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 자동완성 -->
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI library -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />


<!-- 자동 완성 api 불러오기  -->
<script>
$(function(){
	  date();
	  auto();

})


function date() {
  $("#check-in").datepicker({
    dateFormat: "yy-mm-dd", // Customize the date format if needed
    onSelect: function(dateText, inst) {
      // Handle the check-in date selection if desired
    }
  });

  $("#check-out").datepicker({
    dateFormat: "yy-mm-dd",
    onSelect: function(dateText, inst) {
      // Handle the check-out date selection if desired
    }
  });
}
 function auto(){
		var complete = $('#Ra9').val();
		console.log("complete="+complete)
	 const settings = {//자동완성 api 
			  
				async: true,
				crossDomain: true,
				url: 'https://apidojo-booking-v1.p.rapidapi.com/locations/auto-complete?text='+complete+'&languagecode=ko',
				method: 'GET',
				headers: {
					'X-RapidAPI-Key': '',
					'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
				}
			};

			$.ajax(settings).done(function (response) {
				console.log(response);
				var str="<ul>"
				$.each(response,function(index,city){
					//console.log(city.label)
					str+="<li><a href='#' onclick='autoSet(\""+city.label+"\")'>"+city.label+"</a></li>";
					//alert(str)
					console.log(str)
				})
				str+="</ul>";
				$('#lst2').html(str).show('slow');
				$('#lst1').show('slow')
			}); 
}//function auto() 자동완성기능 
function autoSet(label){
	$('#Ra9').val(label);
	$('#lst1').hide();
	$('#lst2').hide();
}
	  
	</script>

</head>
<body>
	<form class="searchform" action="http://localhost:9090/myapp/acomlist" method="get">
		<div class="searchbox">
			<div class="locationsc"><!-- 목적지 선택  -->
				<img class="iconimg" src="image/acomimage/airicon.png" alt="Trripo" >
				<input name="dest" class="destination" placeholder="어디로 여행하세요?" data-destination="1" 
				autocomplete="on" id="Ra9" onchange="auto()">
					 <div id="lst1" class="listbox"	 style="display:none">
	 	<div id="lst2" class="blist" style="display:none">
	 	</div>
	 </div>
			</div><!-- 위치검색창 div -->
			<div class="date">
			<label for="check-in">Check-in Date:</label>
			<input type="text" id="check-in" name="check-in" placeholder="체크인날짜를 골라주세요"/>
			<label for="check-out">Check-out Date:</label>
			<input type="text" id="check-out" name="check-out"placeholder="체크아웃날짜를 골라주세요" />
			<!-- ---------------------------- -->

	 <!-- ---------------------------- -->
			
			</div>
			<div class="adult">인원수설정</div>
			<button type="submit" class="sc button">검색버튼</button>
		</div>
	<!-- 이제 인원수 선택 해야함 -->	
	</form>
</body>
</html>