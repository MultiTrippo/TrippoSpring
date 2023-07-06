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
        var modalElement = document.getElementById("food_post-modal" + i);
        var ImageUrl = foodList[index].imgUrls;
        var urlList = ImageUrl.split(',');
        if (urlList.length > 1) {
        	ImageUrl=urlList[0];
        }
        imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
        titleElement.innerText = foodList[index].title;
        writerElement.innerText = "[" + foodList[index].writer + "]"; 
        modalElement.setAttribute("onclick", "openBoardModal("+foodList[index].postNo+")");
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
        var modalElement = document.getElementById("attr_post-modal" + i);
        var ImageUrl = AttrList[index].imgUrls;
        var urlList = ImageUrl.split(',');
        if (urlList.length > 1) {
        	ImageUrl=urlList[0];
        }
        imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
        titleElement.innerText = AttrList[index].title;
        writerElement.innerText = "[" + AttrList[index].writer + "]"; 
        modalElement.setAttribute("onclick", "openBoardModal("+AttrList[index].postNo+")");
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
	    var modalElement = document.getElementById("photospot_post-modal" + i);
	    var ImageUrl = PhotoSpotList[index].imgUrls;
	    var urlList = ImageUrl.split(',');
	    if (urlList.length > 1) {
	    	ImageUrl=urlList[0];
	    }
	    imgElement.src = "${request.contextPath}/images/board/Upload/" + ImageUrl;
	    titleElement.innerText = PhotoSpotList[index].title;
	    writerElement.innerText = "[" + PhotoSpotList[index].writer + "]";
	    modalElement.setAttribute("onclick", "openBoardModal("+PhotoSpotList[index].postNo+")");
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
    
    function openBoardModal(postNo) {
	  $.ajax({
	    url: '/boardShow',
	    type: 'GET',
	    data: {
	      postNo: postNo
	    },
	    cache: false,
	    success: function(response) {
	    	var htmlText = $(response).text(); // HTML 문자열을 jQuery 객체로 변환
	    	var index1 = htmlText.indexOf("{");
	    	var index2 = htmlText.indexOf("}");
	 		var jsonString = htmlText.substring(index1, index2+1);
	      $('#boardShowModal .modal-body').html(response);
	      loadScript('/js/board/boardShow.js', jsonString);
	      $('#boardShowModal').modal('show');
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
    
    function loadScript(url, jsonString) {
    	  var script = document.createElement('script');
    	  script.src = url;
    	  //alert(jsonString);
    	  script.setAttribute('jsonString', jsonString);
    	  document.head.appendChild(script);
    	  var bodyTag = document.getElementById("bodyTag");
    	  bodyTag.setAttribute("onload","putImage(0)");
    	}
    
    window.onload = function() {
          showFood(0);
          showAttr(0);
          showPhotoSpot(0);
      };
      
  </script>
</head>

<body id="bodyTag">
  <div id="page-wrap">
  <!-- <h1>Photo Slideshow</h1>

  <div>
    <h1>Board Title</h1>
  </div> -->

 <!-- 게시글 추가하는 modal ------------------- -->
  <!-- 모달 버튼 -->
  <div id="PostModalBtn-div">
  	<button id="addPostModal-btn" class="btn btn-light">게시글 작성하기</button>
  </div>
  <!-- 모달 -->
  <div id="addPostModal" class="modal">
    <div class="modal-content modal-dialog modal-dialog-scrollable">
      <span class="close">&times;</span>
      <!-- boardAdd.jsp 띄움 -->
      <jsp:include page="boardAdd.jsp" />
    </div>
  </div>
  <!-- ------------------------------------- -->
  
<!-- 게시글 보는 modal ------------------- -->
<div id="boardShowModal" class="modal fade shadow-lg show" tabindex="-1" role="dialog" aria-labelledby="boardShowModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Trippo's Photo Gallery</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        			<span aria-hidden="true">&times;</span>
      		</button>
      </div>
      <div class="modal-body">
      	
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- ------------------------------------- -->


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
					    <!-- 버튼을 클릭하면 모달 창이 나타나도록 하는 버튼 -->
						<a id="food_post-modal<%=i%>" data-toggle="modal" data-target="#viewPostModal" class="btn btn-warning detail-btn">게시글 보기</a>
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
	            <a id="attr_post-modal<%=i%>" class="btn btn-warning detail-btn">게시글 보기</a>
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
					    <a id="photospot_post-modal<%=i%>" class="btn btn-warning detail-btn">게시글 보기</a>
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
    var modal = document.getElementById("addPostModal");
    var modalButton = document.getElementById("addPostModal-btn");
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