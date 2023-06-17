<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		
		<!-- 반응형 웹을 위한 부트스르랩 설정 -->
		<meta name="viewport" content="width=device-width", initial-scale="1">
		
		<!-- css 참조 -->
		<link rel="stylesheet" type="text/css" href="css/trav_manage.css">
		
		<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
		
		<title>Trippo 일정 관리</title>
		
		<script defer src="js/arcodian.js"></script>
		<script defer src="js/googlemap.js"></script>
		  
	    
			
	</head>
	
	<body>
		
		<!-- header part -->
		<div>
		
		</div>
		
		<!-- main part -->
		<div class="body">
			<!-- save and share buttons -->
			<div class="buttons">
				<button class="share-button">
					<img alt="공유하기 버튼 이미지" src="images/share.png" style="width:20px;height:20px">
					<span>공유하기</span>
				</button>
				<button class="save-button">
					<img alt="저장하기 버튼 이미지" src="images/save.png" style="width:20px;height:20px">
					<span>저장하기</span>
				</button>
			</div>
			
			<!-- map and fix schedule -->	
			<div class="mains">
				<!-- map -->
				<div id="map">			
				</div>
				<script
			      defer
			      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrmeYmh2NFLAC4bRU_E5zW8ZJBpUuwh-0&callback=initMap"
			    ></script>
				
				<!-- schedule -->
				<div id="accordionContainer">
				    <button class="accordion" onclick="toggleAccordion(0)">
				    	<img alt="드롭다운 이미지" src="images/arrow.png" style="width:20px;height:20px;">
				    </button>
				    <div class="panel">
				      	<img alt="시계 아이콘 이미지" src="images/alarm.png" style="width:20px;height:20px;">
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
				<span>etc</span>
			
			</div>
		
		</div>
		
		<!-- footer part -->
		<div>
			
		</div>
		
	</body>
	
	 
</html>