<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>자유게시판</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="./../../../css/board/boardList.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script>
  	/* Food --------------------------------------- */
    var currentFoodIdx = 0;
    var foodListJson = '${foodListJson}'; // JSON 형태의 문자열로 가져오기
    var foodList = JSON.parse(foodListJson); // JSON 문자열을 JavaScript 객체로 변환

    function showFood(index) {
      currentFoodIdx = index;

      for (var i = 0; i < 5; i++) {
        index = index % foodList.length;
        var imgElement = document.getElementById("food_slideshow-image" + i);
        var titleElement = document.getElementById("food_card-title" + i);
        var writerElement = document.getElementById("food_card-writer" + i);
        var contentElement = document.getElementById("food_card-text" + i);
        var ImageUrl = foodList[index].imgUrls;
        var urlList = ImageUrl.split(',');
        if (urlList.length > 1) {
        	ImageUrl=urlList[0];
        }
        imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
        titleElement.innerText = foodList[index].title;
        writerElement.innerText = "[" + foodList[index].writer + "]"; 
        contentElement.innerText = foodList[index++].content;
      }
    }
    
    function previousFood() {
      if (currentFoodIdx === 0) {
        showFood(foodList.length - 1);
      } else {
        showFood(currentFoodIdx - 1);
      }
    }

    function nextFood() {
      if (currentFoodIdx === foodList.length - 1) {
        showFood(0);
      } else {
        showFood(currentFoodIdx + 1);
      }
    }
    /* -------------------------------------------------- */
    
    /* Attraction --------------------------------------- */
    var currentAttrIdx = 0;
    var AttrListJson = '${AttrListJson}'; // JSON 형태의 문자열로 가져오기
    var AttrList = JSON.parse(AttrListJson); // JSON 문자열을 JavaScript 객체로 변환

    function showAttr(index) {
      currentAttrIdx = index;

      for (var i = 0; i < 5; i++) {
        index = index % AttrList.length;
        var imgElement = document.getElementById("attr_slideshow-image" + i);
        var titleElement = document.getElementById("attr_card-title" + i);
        var writerElement = document.getElementById("attr_card-writer" + i);
        var contentElement = document.getElementById("attr_card-text" + i);
        var ImageUrl = AttrList[index].imgUrls;
        var urlList = ImageUrl.split(',');
        if (urlList.length > 1) {
        	ImageUrl=urlList[0];
        }
        imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
        titleElement.innerText = AttrList[index].title;
        writerElement.innerText = "[" + AttrList[index].writer + "]"; 
        contentElement.innerText = AttrList[index++].content;
      }
    }

    function previousAttr() {
      if (currentAttrIdx === 0) {
        showAttr(AttrList.length - 1);
      } else {
    	  showAttr(currentAttrIdx - 1);
      }
    }

    function nextAttr() {
      if (currentAttrIdx === AttrList.length - 1) {
    	  showAttr(0);
      } else {
    	  showAttr(currentAttrIdx + 1);
      }
    }
    /* -------------------------------------------------- */
    
    /* Photoshot --------------------------------------- */
    var currentPhotoSpotIdx = 0;
	var PhotoSpotListJson = '${PhotoSpotListJson}'; // JSON 형태의 문자열로 가져오기
	var PhotoSpotList = JSON.parse(PhotoSpotListJson); // JSON 문자열을 JavaScript 객체로 변환
	
	function showPhotoSpot(index) {
	  currentPhotoSpotIdx = index;
	
	  for (var i = 0; i < 5; i++) {
	    index = index % PhotoSpotList.length;
	    var imgElement = document.getElementById("photospot_slideshow-image" + i);
	    var titleElement = document.getElementById("photospot_card-title" + i);
	    var writerElement = document.getElementById("photospot_card-writer" + i);
	    var contentElement = document.getElementById("photospot_card-text" + i);
	    var ImageUrl = PhotoSpotList[index].imgUrls;
	    var urlList = ImageUrl.split(',');
	    if (urlList.length > 1) {
	    	ImageUrl=urlList[0];
	    }
	    imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
	    titleElement.innerText = PhotoSpotList[index].title;
	    writerElement.innerText = "[" + PhotoSpotList[index].writer + "]"; 
	    contentElement.innerText = PhotoSpotList[index++].content;
	  }
	}
	
	function previousPhotoSpot() {
	  if (currentPhotoSpotIdx === 0) {
	    showPhotoSpot(PhotoSpotList.length - 1);
	  } else {
		  showPhotoSpot(currentPhotoSpotIdx - 1);
	  }
	}
	
	function nextPhotoSpot() {
	  if (currentPhotoSpotIdx === PhotoSpotList.length - 1) {
		  showPhotoSpot(0);
	  } else {
		  showPhotoSpot(currentPhotoSpotIdx + 1);
	  }
	}
    /* -------------------------------------------------- */
    
    window.onload = function() {
          showFood(0);
          showAttr(0);
          showPhotoSpot(0);
      };
  </script>

</head>

<body>
  <div id="page-wrap">
  	<button type="button" class="btn btn-info" onclick="location.href='/addPost';">게시글 작성</button>
  <h1>Photo Slideshow</h1>

  <div>
    <h1>Board Title</h1>
  </div>

  <button id="modalButton" class="btn btn-light">게시글 작성하기</button>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <jsp:include page="boardAdd.jsp" />
    </div>
  </div>
 

	
  <div id="wrap">
	<!-- 맛집 ================================================ -->
    <div id="food">
      <h1 class="section-title">-------- 맛집 추천 --------</h1>
      <div id="slideshow-container">
        <button class="slide-btn btn btn-light" onclick="previousFood()">◀</button>
        <div class="contents-container">
          <%
			for (int i = 0; i < 5; i++) {
			%>
				<div class="post-wrapper" style="max-width: 18rem; ">
					<img id="food_slideshow-image<%=i%>" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
				
					<div class="card-body">
					    <h5 id="food_card-title<%=i%>" class="food_card-title card-title"></h5>
					    <p id="food_card-writer<%=i%>" class="card-writer"></p>
					    <p id="food_card-text<%=i%>" class="food_card-text"></p>
					    <a href="#" class="btn btn-warning detail-btn ">게시글 보기</a>
					</div>
				</div>
			<%
			}
			%>
		</div>
        <button class="slide-btn btn btn-light" onclick="nextFood()">▶</button>
      </div>
    </div>
    <!-- ===================================================== -->
    
    
    <!-- 관광지 ================================================ -->
    <div id="attraction">
	  <h1 class="section-title">-------- 관광지 추천 --------</h1>
	  <div id="slideshow-container">
	    <button class="slide-btn btn btn-light" onclick="previousAttr()">◀</button>
	    <div class="contents-container">
	      <% for (int i = 0; i < 5; i++) { %>
	        <div class="post-wrapper" style="max-width: 18rem;">
	          <img id="attr_slideshow-image<%=i%>" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
	          <div class="card-body">
	            <h5 id="attr_card-title<%=i%>" class="attr_card-title card-title"></h5>
	            <p id="attr_card-writer<%=i%>" class="card-writer"></p>
	            <p id="attr_card-text<%=i%>" class="attr_card-text"></p>
	            <a href="#" class="btn btn-warning detail-btn">게시글 보기</a>
	          </div>
	        </div>
	      <% } %>
	    </div>
	    <button class="slide-btn btn btn-light" onclick="nextAttr()">▶</button>
	  </div>
	</div>
    <!-- ===================================================== -->
    
    <!-- 포토스팟 ================================================ -->
    <div id="photospot">
      <h1 class="section-title">-------- 포토스팟 추천 --------</h1>
      <div id="slideshow-container">
        <button class="slide-btn btn btn-light" onclick="previousPhotoSpot()">◀</button>
        <div class="contents-container">
          <%
			for (int i = 0; i < 5; i++) {
			%>
				<div class="post-wrapper" style="max-width: 18rem; ">
					<img id="photospot_slideshow-image<%=i%>" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
				
					<div class="card-body">
					    <h5 id="photospot_card-title<%=i%>" class="photospot_card-title card-title"></h5>
					    <p id="photospot_card-writer<%=i%>" class="card-writer"></p>
					    <p id="photospot_card-text<%=i%>" class="photospot_card-text"></p>
					    <a href="#" class="btn btn-warning detail-btn">게시글 보기</a>
					</div>
				</div>
			<%
			}
			%>
		</div>
        <button class="slide-btn btn btn-light" onclick="nextPhotoSpot()">▶</button>
      </div>
    </div>
    <!-- ===================================================== -->
    
  </div>
  </div>

  <script>
    var modal = document.getElementById("myModal");
    var modalButton = document.getElementById("modalButton");
    var span = document.getElementsByClassName("close")[0];

    modalButton.onclick = function() {
      modal.style.display = "block";
    };

    span.onclick = function() {
      modal.style.display = "none";
    };

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };
  </script>
 
</body>
</html>
