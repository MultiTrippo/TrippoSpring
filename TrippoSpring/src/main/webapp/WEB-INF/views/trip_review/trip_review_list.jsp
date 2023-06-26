<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- ------------ -->

<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery UI -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<title>여행 후기 목록</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/trip_review/trip_review_form.css">
	<link rel="stylesheet" type="text/css" href="css/trip_review/form.css">
<!-- ---------- -->

<!-- javascript 기능 -->
<script>
	$(function() {
		$('#btnWrite').click(function(e) {
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/trip_review_form";
		});
	})
</script>
<!-- ------------- -->
</head>

<body>
<!-- icon -->
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!--  -->

	<div class="sidebar">
		<h1 class="logo">여행후기 목록</h1>
		<div class="searchbar">
			<input type="text" placeholder="검색할 여행지를 입력하세요">
			<button class="btnCityListSearch">
				<ion-icon name="search-outline"></ion-icon>
			</button>
		</div>
		<div>
			<button type="button" class="btn btn-outline-warning" id="btnWrite">후기	작성하기</button>
		</div>
		<div class="menus">
			<a href="#"><ion-icon name="heart"></ion-icon>Home</a>
		</div>
	</div>
	<div id="container">
		<div id="wwwh">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">후기번호</th>
						<th scope="col">제목</th>
						<th scope="col">여행지</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
	 				<c:forEach items="${getAllList }" var="list">
						<tr>
							<th scope="row">${list.review_num }</th>
							<td>
								<a href="/myapp/viewOneReview?review_num=${list.review_num }"
									style="text-decoration: none">${list.review_title }</a>								
							</td>
							<td>${list.wwhere }</td>
							<td>${list.user_id }</td>
							<td>${list.created_at }</td>
							<td>${list.view_count }</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>