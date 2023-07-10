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
		<link rel="stylesheet" type="text/css" href="css/schedule/acordian.css">
		<link rel="stylesheet" type="text/css" href="css/schedule/googlemap.css" />
		<link rel="stylesheet" type="text/css" href="css/schedule/etc.css" />
		<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
		
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.css"/>
		
		<title>Trippo 일정 관리</title>
		
 		<script defer src="js/schedule/acordian.js"></script> 
		<script defer src="js/schedule/googlemap.js"></script>
		<script defer src="js/schedule/etcManage.js"></script>
		<script defer src="js/schedule/mapPinAdd.js"></script>
		  
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        
        <script src="https://cdn.jsdelivr.net/gh/mdbassit/Coloris@latest/dist/coloris.min.js"></script>    
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
    	<script type="text/javascript">
	    	function clip(){
	
	    		var url = '';
	    		var textarea = document.createElement("textarea");
	    		document.body.appendChild(textarea);
	    		url = window.document.location.href;
	    		textarea.value = url;
	    		textarea.select();
	    		document.execCommand("copy");
	    		document.body.removeChild(textarea);
	    		alert("URL이 복사되었습니다.")
	    	}
	    	
	    	function saveAlert() {
	    		alert("저장하기 완료")
	    	}
    	</script>
		
	</head>
	
	<body>
		
		<!-- header part -->
		<div id="header">
		<%@ include file="/inc/top.jspf" %> 
		</div>
	
		<!-- main part -->
		<div class="body">
			<!-- save and share buttons -->
			<div class="buttons">
		
				<button class="share-button" onclick="clip(); return false;">
				  <img alt="공유하기 버튼 이미지" src="images/schedule/share.png" style="width:20px;height:20px">
				  <span>공유하기</span>
				</button>
				<button class="save-button" onclick="saveAlert(); return false;">
				  <img alt="저장하기 버튼 이미지" src="images/schedule/save.png" style="width:20px;height:20px" >
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
				      src="https://maps.googleapis.com/maps/api/js?key=apikey&callback=initAutocomplete&libraries=places,visualization&v=weekly"
				      defer
				    ></script>
				    
			    </div>

				<!-- schedule -->
				<div class="schedule">
				<div id="accordionContainer">
					
						<!-- <button id="pinAddBtn"> 맵에 핀 추가 </button> -->
						<form action="fixInsert" method="post">
							<div class="addAccordian">
								
								<input type="text" id="fixTitle" placeholder="   하고 싶은 내용을 적어주세요.">
								<button type="button" id="fixAddBtn">추가</button>
							</div>
						</form>
						
						
						
						<div id="fixContainer"></div>
					
					</div>
					
								
				
				  
				    </div>
				    
				    
			  </div>
				
			

			</div>
		
			<!-- etc. parts -->
			<div class="etc">
				<span id="etcTitle">ETC.</span>
				<form action="etcInsert" method="post">
					<div id="EtcDiv">
			
						<input type="text" id="textInput" placeholder="   하고 싶은 내용을 적어주세요.">
						<button type="button" id="addButton">추가하기</button>			
					</div>
					
				</form>
				
				<input type="hidden" id="pageId" value="<%= request.getParameter("page_id") %>">
		
				<div id="etcContainer" class="etcContainer">
					
				</div>
			</div>
		
		</div>
		
		
		<!-- footer part -->
		<div>
			
		</div>
		
	</body>	
	
	 
</html>
