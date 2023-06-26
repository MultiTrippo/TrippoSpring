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
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->
<title>여행 후기 목록</title>

<!-- javascript 기능 -->
<script>
	$(function() {
		$('#btnWrite')
				.click(
						function(e) {
							e.preventDefault();
							location.href = "${pageContext.request.contextPath}/trip_review_form";
						});
	})
</script>
<!-- ------------- -->
</head>
<body>
	<h1>trip_review_list.jsp</h1>

	<div>
		<button type="button" class="btn btn-outline-warning" id="btnWrite">후기
			작성하기</button>
	</div>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">후기번호</th>
					<th scope="col">제목</th>
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
						<td>${list.user_id }</td>
						<td>${list.created_at }</td>
						<td>${list.view_count }</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
	</div>
</body>
</html>