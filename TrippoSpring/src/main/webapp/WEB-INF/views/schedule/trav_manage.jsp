<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		
		<!-- 반응형 웹을 위한 부트스르랩 설정 -->
		<meta name="viewport" content="width=device-width", initial-scale="1">
		
		<!-- css 참조 -->
		<link rel="stylesheet" type="text/css" href="css/schedule/trav_manage.css">
		<link rel="stylesheet" type="text/css" href="css/schedule/etc.css">
		<link rel="stylesheet" type="text/css" href="css/schedule/googlemap.css" />
		<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
		
		<title>Trippo 일정 관리</title>
		
<!-- 		<script defer src="js/schedule/arcodian.js"></script> -->
		<script defer src="js/schedule/googlemap.js"></script>
		<script defer src="js/schedule/etcManage.js"></script>
		  
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
    	<!-- <script type="module" src="js/schedule/index.js"></script> -->
		
	</head>
	
	<body>
		
		<!-- header part -->
		<div>
		
		</div>
		
		<!-- main part -->
		<div class="body">
			<!-- save and share buttons -->
			<div class="buttons">
				<!-- <Text>나라 선택 : </Text>
				<form method="post" enctype="multipart/form-data" id="country">
					<input type="text" id="pac-input" class="controls" placeholder="장소를 입력하세요">
					<button>검색</button>
					<input type="submit" value="이동" onclick="moveToPlace()">
				</form> -->
				
				<button class="share-button">
					<img alt="공유하기 버튼 이미지" src="images/schedule/share.png" style="width:20px;height:20px">
					<span>공유하기</span>
				</button>
				<button class="save-button">
					<img alt="저장하기 버튼 이미지" src="images/schedule/save.png" style="width:20px;height:20px">
					<span>저장하기</span>
				</button>
			</div>
			
			<div class="mains">
				<!-- map and fix schedule -->	
				<div id="maps">
					<!-- map -->	
					<input
				      id="pac-input"
				      class="controls"
				      type="text"
				      placeholder="Search Box"
				    />
				    <div id="map"></div>
				
				    <!-- 
				      The `defer` attribute causes the callback to execute after the full HTML
				      document has been parsed. For non-blocking uses, avoiding race conditions,
				      and consistent behavior across browsers, consider loading using Promises.
				      See https://developers.google.com/maps/documentation/javascript/load-maps-js-api
				      for more information.
				      -->
				    <script
				      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1vuGjfL_JMaJSEjZVpWB5tX8EMAk88G0&callback=initAutocomplete&libraries=places&v=weekly"
				      defer
				    ></script>
				    
			    </div>
			    
				<!-- schedule -->
				<div id="accordionContainer">
				    <button class="accordion" onclick="toggleAccordion(0)">
				    	<img alt="드롭다운 이미지" src="images/schedule/arrow.png" style="width:20px;height:20px;">
				    </button>
				    <div class="panel">
				      	<img alt="시계 아이콘 이미지" src="images/schedule/alarm.png" style="width:20px;height:20px;">
						<button>am</button>
						<div class="time">
							<div class="timeselect">
								<div class="time-selected-vaule">시간 선택</div>
							</div>
							
							<ul class="time-selected-options">
								
							</ul>
						</div>
				    </div>
			  </div>
				
			  <button onclick="addAccordion()">+</button>
				
				
				<!-- <div class="schedule">
					<div>
						<h2>1st - 2023.07.12</h2>
					</div>
				
					<div>
						<img>
						<span>예시 : 도쿄 밥집</span>
						<button class="dropdown-toggle" type="button">
							<img alt="드롭다운 이미지" src="images/arrow.png" style="width:20px;height:20px;">
						</button>
					</div>
					
					<div class="dropdown-content">
						<div>
							<img alt="시계 아이콘 이미지" src="images/alarm.png" style="width:20px;height:20px;">
							<button>am</button>
							<button>시간</button>
						</div>
						<div>
							<textarea></textarea>
						</div>
					</div>
				
				</div> -->

			</div>
		
			<!-- etc. parts -->
			<div class="etc">
				<span id="etcTitle">ETC.</span>
				<form action="etcInsert" method="post">
					<div>
						<input type="hidden" name="pageId" value="${pageId}">
						<input type="text" id="textInput" placeholder="하고 싶은 내용을 적어주세요.">
						<button type="button" id="addButton">추가하기</button>			
					</div>
					
				</form>
		
				<div id="etcContainer" class="etcContainer">
					<c:import url="/etcList"></c:import>
					
					<c:forEach var="data" items="${getEtcList}">
						<div class="etcDetailCon">
							<div>
								<span>${data.etc}</span>
								<button class="editButton">수정</button>
								<button class="deleteButton">삭제</button>
							</div>
						
						</div>
					
					</c:forEach>
				</div>
			</div>
		
		</div>
		
		<!-- footer part -->
		<div>
			
		</div>
		
	</body>
	
	 
</html>