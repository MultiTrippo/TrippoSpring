<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>자유게시판</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/board/boardList.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script>
    var images = [
      "https://www.theluxeinsider.com/wp-content/uploads/2020/10/IthaaUnderseaRestaurant.jpg",
      "https://i.insider.com/5805e479dd0895c84b8b46da?width=1000&format=jpeg&auto=webp",
      "https://www.fodors.com/wp-content/uploads/2021/09/shutterstock_724425730.jpg",
      "https://i.ytimg.com/vi/amKiW5ExPys/maxresdefault.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHxuEofzOcjqyGZjYY-EiNYalUMBtx_XrbtqEoOlbe_kpvrgoddJHqtl-_EkZA8wW1nLg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSq0QitN7LXOqSWQD0MVLotoD4t_XyaLNi0nEqDX4A3LQWlXvL64Ey-nfx0K1ZrJOfBcg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5K1QtFVZSu7sRFWrotIPOAt83FGtOLzttlw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOYKv3AxhH1JuW27bkYwtR68ZDe9tV3KP4bGUe8xk0QJqSbakTX4wcXJzLdiFJKdkBX4s&usqp=CAU",
      "https://i.insider.com/57d04c58b996eb93008b6683?width=600&format=jpeg&auto=webp"
      // Add more image URLs as needed
    ];

    var currentImageIndex = 0;

    function showImage(index) {
      currentImageIndex = index;
      for (var i = 0; i < 5; i++) {
        index = index % images.length;
        var testElement = document.getElementById("test" + i);
        testElement.innerText = currentImageIndex;
        var imgElement = document.getElementById("slideshow-image" + i);
        imgElement.src = images[index++];
      }
    }

    function previousImage() {
      if (currentImageIndex === 0) {
        showImage(images.length - 1);
      } else {
        showImage(currentImageIndex - 1);
      }
    }

    function nextImage() {
      if (currentImageIndex === images.length - 1) {
        showImage(0);
      } else {
        showImage(currentImageIndex + 1);
      }
    }

    window.onload = function() {
      showImage(0);
    };
  </script>

  <style>
    .modal {
      display: none;
      /* position: fixed; */
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 50%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 500px !important; 
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <button type="button" class="btn btn-info" onclick="location.href='/addPost';">게시글 작성</button>
  <h1>Photo Slideshow</h1>

  <div>
    <h1>Board Title</h1>
  </div>

  <button id="modalButton" class="btn btn-primary">게시글 작성하기</button>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <jsp:include page="boardAdd.jsp" />
    </div>
  </div>

  <c:forEach items="${foodList}" var="post">
    <div class="post-wrapper">
      <!-- 게시물 내용 표시 -->
      <h1>${post.content}</h1>
      <h1>HELLO</h1>
      <!-- 게시물 이미지 표시 -->
      <%-- <img src="${request.contextPath}/images/board/Upload/${post.imgUrls[0]}"> --%>
    </div>
  </c:forEach>

  <div id="wrap">
    <div id="food">
      <span class="title">맛집 정보</span>
      <div id="slideshow-container">
        <button class="btn btn-primary" onclick="previousImage()">◀</button>
        <div class="contents-container">
          <c:forEach var="i" begin="0" end="4">
            <div class="post-wrapper text-white bg-info" style="max-width: 18rem;">
              <img id="slideshow-image${i}" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
              <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-warning myModal">Go somewhere</a>
              </div>
            </div>
          </c:forEach>
        </div>
        <button class="btn btn-primary" onclick="nextImage()">▶</button>
      </div>
    </div>

    <div id="photographySpot">
      <h1>인생 사진 스팟</h1>
      <div id="slideshow-container">
        <button class="btn btn-primary" onclick="previousImage()">◀</button>
        <div class="contents-container">
          <c:forEach var="i" begin="0" end="4">
            <div class="post-wrapper text-white bg-info" style="max-width: 18rem;">
              <img id="slideshow-image${i}" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
              <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-warning myModal">Go somewhere</a>
              </div>
            </div>
          </c:forEach>
        </div>
        <button class="btn btn-primary" onclick="nextImage()">▶</button>
      </div>
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
