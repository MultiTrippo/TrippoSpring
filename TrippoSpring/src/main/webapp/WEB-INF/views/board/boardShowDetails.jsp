<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Photo Gallery</title>
    <style>
        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .gallery-item {
            flex: 1 0 300px;
            max-width: 300px;
            display: none;
        }
        
        .gallery-item.show {
            display: block;
        }

        .gallery-item img {
            width: 100%;
            height: auto;
        }

        .post {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .post .post-image {
            flex: 0 0 200px;
            max-width: 200px;
        }

        .post .post-image img {
            width: 100%;
            height: auto;
        }

        .comments {
            margin-top: 20px;
        }

        .comment {
            margin-bottom: 10px;
        }

        .show-more {
            margin-top: 10px;
        }
    </style>
    
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
    
    function putImage() {
        <%for (int i = 0; i < 9; i++) {%>
		var img<%=i%> = document.getElementById("gallery-img<%=i%>");
		img<%=i%>.src = images[<%=i%>];
		if(<%=i%><4){
			var galleryItems = document.getElementsByClassName("gallery-item");
			galleryItems[<%=i%>].classList.toggle("show");	
		}
		<%}%>
	}
    
    function showMore() {
        var galleryItems = document.getElementsByClassName("gallery-item");

        for (var i = 4; i < galleryItems.length; i++) {
            galleryItems[i].classList.toggle("show");
        }

        var showMoreButton = document.getElementById("show-more-button");
        showMoreButton.classList.toggle("hidden");
    }
    </script>
</head>
<body onload="putImage();">
    <h1>Photo Gallery</h1>

    <div class="gallery">
        <%-- 필요한 만큼 사진 갤러리 아이템 추가 (차후에 db에서 이미지 개수 받아서 수정 예정)--%>
        <%
		for (int i = 0; i < 9; i++) {
		%>
		<%-- 사진 갤러리 부분 --%>
        <div class="gallery-item">
            <img src="" id="gallery-img<%=i%>" alt="GalleryImage">
        </div>
		<%
		}
		%>
    </div>
	<div id="show-more-button">
        <button class="btn btn-primary" onclick="showMore()">더보기</button>
    </div>


    <div class="post-content">
        <h2>게시글 제목</h2>
        <p>게시글 내용</p>
    </div>


    <div class="comments">
        <%-- 댓글 부분 --%>
        <div class="comment">
            <strong>작성자:</strong> 댓글 내용
        </div>
        <%-- 필요한 만큼 댓글 추가 --%>
    </div>

    <form action="댓글_작성_처리_페이지" method="post">
        <h3>댓글 작성</h3>
        <label for="comment-author">작성자:</label>
        <input type="text" id="comment-author" name="author" required>
        <br>
        <label for="comment-content">내용:</label>
        <textarea id="comment-content" name="content" required></textarea>
        <br>
        <input type="submit" value="댓글 작성">
    </form>
</body>
</html>
