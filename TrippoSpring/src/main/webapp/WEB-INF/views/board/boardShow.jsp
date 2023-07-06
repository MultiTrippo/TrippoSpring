<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./../../../css/board/boardShow.css">
<script>
	var postJson = '${postJson}'; // JSON 형태의 문자열로 가져오기
	var vo = JSON.parse(postJson); // JSON 문자열을 JavaScript 객체로 변환
	var images = vo.imgUrls;
	var imageList = images.split(',');
	//alert(vo.city);

	function putImage() {
		var gallery = document.getElementById("gallery");
		for (var i = 0; i < imageList.length; i++) {
			var galleryItem = document.createElement("div");
			galleryItem.setAttribute("class", "gallery-item");
			galleryItem.setAttribute("id", "gallery-item" + i);

			var img = document.createElement("img");
			img.setAttribute("class", "gallery-img");
			img.setAttribute("src",
					"${request.contextPath}/images/board/Upload/"
							+ imageList[i]);
			img.setAttribute("id", "gallery-img" + i);
			img.setAttribute("alt", "GalleryImage");

			galleryItem.appendChild(img);
			gallery.appendChild(galleryItem);

			if (i < 4) {
				galleryItem.classList.add("show");
			}
		}
		var postTitle = document.getElementById("post-title");
		postTitle.innerText = vo.title;
		var postContent = document.getElementById("post-content");
		postContent.innerText = vo.content;
		var postWriter = document.getElementById("post-writer");
		postWriter.innerText = vo.writer;
		alert(postWriter);
		var postDate = document.getElementById("post-date");
		postDate.innerText = vo.uploadedDate;
		var postCountry = document.getElementById("countrySpan");
		postCountry.innerText = vo.country;
		var postCity = document.getElementById("citySpan");
		
		postCity.innerText = vo.city;
	}

	var isOpen = false;
	function showMore() {
		var galleryItems = document.getElementsByClassName("gallery-item");
		for (var i = 4; i < galleryItems.length; i++) {
			galleryItems[i].classList.toggle("show");
		}

		var showMoreButton = document.getElementById("show-more-button");
		showMoreButton.classList.toggle("hidden");

		var showMoreBtn = document.getElementById("showMore");
		isOpen = !isOpen;
		if (isOpen === true) {
			showMoreBtn.innerText = "숨기기";
			showMoreBtn.setAttribute("class", "btn btn-primary");
		} else {
			showMoreBtn.innerText = "더보기"
			showMoreBtn.setAttribute("class", "btn btn-info");
		}

	}
	
	window.onload = function() {
        putImage(0);
    };
</script>
</head>


<body>
	<!-- <body> -->
	<!-- <h1>Photo Gallery</h1> -->

	<div id="content-wrap">
		<!-- LEFT --------------------------------------- -->
		<div id="left">
			<div id="scroll-view">
				<div class="gallery" id="gallery"></div>
			</div>
			<div id="show-more-button">
				<button class="btn btn-info" id="showMore" onclick="showMore()">더보기</button>
			</div>
		</div>
		<!-- LEFT END ----------------------------------- -->
		<!-- RIGHT --------------------------------------- -->
		<div id="right">
			<div class="post-content">
				<h2 id="post-title" style="color: #fc4141; font-weight: bold">게시글
					제목</h2>
				<h5 style="color: #4d4d4d; font-weight: 600">
					<span id="citySpan"></span>, <span id="countrySpan"></span>
				</h5>
				<p>
					<span style="font-weight: 600">작성자: </span><span id="post-writer"
						style="color: #282e91;"></span>
				</p>
				<p>
					<span style="font-weight: 600">작성일: </span><span id="post-date"
						style="color: #282e91;"></span>
				</p>
				<p id="post-content">게시글 내용</p>
			</div>

			<div class="comments">
				<%-- 댓글 부분 --%>
				<div class="comment">
					<strong>작성자:</strong> 댓글 내용
				</div>
				<%-- 댓글 추가 --%>
				<form id="comment-form" action="댓글_작성_처리_페이지" method="post">
					<hr>
					<label class="showLabel" for="comment-author">작성자:</label> <input
						type="text" id="comment-author" name="author" required> <br>
					<label class="showLabel" for="comment-content">내용:</label>
					<textarea id="comment-content" name="content" required></textarea>
					<br> <label class="showLabel"></label> <input id="comment-btn"
						type="submit" class="btn btn-info" value="댓글 작성">
				</form>
			</div>
		</div>
		<!-- RIGHT END ----------------------------------- -->
	</div>
</body>


</html>
