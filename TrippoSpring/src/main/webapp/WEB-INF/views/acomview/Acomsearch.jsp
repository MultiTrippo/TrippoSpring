<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">

<style>
body {
   background-image:
      url('${pageContext.request.contextPath}/images/acomimage/back.jpg');
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

<!-- 반응형 웹을 위한 부트스르랩 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="css/acom/Acomsearch.css">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<title>Trippo 숙소검색</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 자동완성 -->
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI library -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
<!-- 글꼴  -->
<link
   href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
   rel="stylesheet">

<!-- 자동 완성 api 불러오기  -->
<script>
   $(function() {
      date();
      auto();

      

      document.searchform.addEventListener("keydown", event => {
         if(event.code == "Enter") {
            event.preventDefault();
            auto();
         }
      })
   })

   function date() {
      $("#check-in").datepicker({
         dateFormat : "yy-mm-dd", // Customize the date format if needed
         onSelect : function(dateText, inst) {
            // Handle the check-in date selection if desired
            $("check-in").text(dateText);

         }
      });

      $("#check-out").datepicker({
         dateFormat : "yy-mm-dd",
         onSelect : function(dateText, inst) {
            // Handle the check-out date selection if desired

         }
      });
   }
   function auto() {
      var complete = $('#Ra9').val();
      if (!complete)
         return;
      console.log("complete=" + complete)
      const settings = {//자동완성 api 

         async : true,
         crossDomain : true,
         url : 'https://apidojo-booking-v1.p.rapidapi.com/locations/auto-complete?text='
               + complete + '&languagecode=ko',
         method : 'GET',
         headers : {
            'X-RapidAPI-Key' : 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
            'X-RapidAPI-Host' : 'apidojo-booking-v1.p.rapidapi.com'
         }
      };

      $.ajax(settings).done(
            function(response) {
               console.log(response);
               var str = "<ul>"
               $.each(response, function(index, city) {

                  let obj = {
                     label : city.label,
                     dest_id : city.dest_id,
                     dest_type : city.dest_type
                  }
                  //console.dir(obj);
                  //console.log(city.label)
                  /*str += "<li><a href='#' onclick='autoSet(" + obj
                        + ")'>" + city.label + "</a></li>";*/

                  str += "<li><a href='#' onclick='autoSet(\""
                        + city.label + "\",\"" + city.dest_id + "\",\""
                        + city.dest_type + "\")'>" + city.label
                        + "</a></li>";

                  //alert(str)
                  console.log(str)
               });//$.each()

               str += "</ul>";
               $('#lst2').html(str).show('slow');
               $('#lst1').show('slow')

               //************dest_id 불러오기***********

               /* $.ajax(settings).done(function (response) {
               console.log(JSON.stringify(response.));
               test(response.data);
               }); */

            });//done()
   }////function auto() 자동완성기능 
   function autoSet(label, dest_id, dest_type) {

      $('#Ra9').val(label);
      $('#dest_id').val(dest_id)
      $('#dest_type').val(dest_type)
      $('#lst1').hide();
      $('#lst2').hide();
   }

   // ------------버튼 구성------------
   function adjustValue(people, operation) {
      var input = document.getElementById(people);
      var value = parseInt(input.value);

      if (operation === '+') {
         value++;
      } else if (operation === '-' && value > 0) {
         value--;
      }

      input.value = value;
   }
   
   
   
</script>




</head>
<body>
   <%@ include file="/inc/top.jspf"%>
   <%-- <div class="page" style="background-image:url('${pageContext.request.contextPath}/images/acomimage/back.jpg')"> --%>

   <div class="page-wrapper">
      <div class="acomsearch-title-div">
         <h1 class="trippo">Trippo가 회원님에게 맞는 숙소를 찾아드립니다</h1>
      </div>

      <div class="card-body">
         <form class="searchform" name="searchform"
            action="${pageContext.request.contextPath}/acomlist" method="get">
            <input type="hidden" name="dest_ids" id="dest_id"> <input
               type="hidden" name="search_type" id="dest_type">

            <div class="searchbox">
               <div class="locationsc">
                  <!-- 목적지 선택  -->
                  <%-- <img class="iconimg"
                  src="${pageContext.request.contextPath}/images/acomimage/airicon.jpg"
                  alt="Trripo"> --%>
                  <div>
                     <div class="input-group">
                        <label for="Ra9" class=check-in>여행지:</label> <input name="dest"
                           class="destination" placeholder="어디로 여행하세요?"
                           data-destination="1" autocomplete="on" id="Ra9">
                     </div>
                  </div>

                  <!-- onkeyup="auto()" -->
                  <div id="lst1" class="listbox">
                     <div id="lst2" class="blist"></div>
                  </div>
               </div>

               <!-- 위치검색창 div -->
               <div class="date">
                  <div class="row-checkInOut">
                     <div class="input-group">
                        <label for="check-in" class=check-in>체크인 날짜:</label> <input
                           type="text" id="check-in" name="arrival_date"
                           placeholder="체크인날짜를 골라주세요" />
                     </div>

                     <div class="input-group">
                        <label for="checkout" class=check-out>체크아웃 날짜:</label> <input
                           type="text" id="check-out" name="departure_date"
                           placeholder="체크아웃날짜를 골라주세요" />
                     </div>
                  </div>
               </div>
               <!-- ---------------------------- -->

               <!-- --------------인원수 선택 버튼 -------------- -->
               <div class="people">
                  <h4 class="people-title">인원수를 설정해주세요</h4>
                  <div class="row-peopleCnt">
                     <div class="adult">                        
                        <label for="adults">어른 수:</label> 
                        <input type="number"
                           id="adults" name="guest_qty" value="0" readonly size="1">
                        <input type="button" onclick="adjustValue('adults', '+')"
                           value="+" class="btnPlusMinus"> 
                        <input type="button"
                           onclick="adjustValue('adults', '-')" value="-" class="btnPlusMinus">
                     </div>
                     
                     <div class="child">
                        <label for="children">아이 수:</label> 
                        <input type="number"
                           id="children" name="children_qty" value="0" readonly size="1">
                        <input type="button" onclick="adjustValue('children', '+')"
                           value="+" class="btnPlusMinus"> 
                        <input type="button"
                           onclick="adjustValue('children', '-')" value="-" class="btnPlusMinus">
                     </div>
                     
                     <div class="room">
                        <label for="rooms">방 개수:</label> 
                        <input type="number" id="rooms"
                           name="room_qty" value="0" readonly size="1"> 
                        <input
                           type="button" onclick="adjustValue('rooms', '+')" value="+" class="btnPlusMinus">
                        <input type="button" onclick="adjustValue('rooms', '-')"
                           value="-" class="btnPlusMinus">
                     </div>
                     
                  </div>
               </div>

               <!-- 검색버튼 -->                     
               <div>
                  <button class="scbut" type="submit">검 색</button>
               </div>
            </div>

         </form>
      </div>
   </div>
   <!-- </div> -->
   <!-- ----------------------------------------------- -->
   <!-- -----------------------------------------------  -->
</body>
</html>