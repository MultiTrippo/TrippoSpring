<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- jQuery 3.7.0 uncompressed -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- javascript파일 참조  -->
<!--     <script type="text/javascript" src="./js/trip_review/trip_review_form.js"></script> -->
<!-- ----------------- -->

<title>선택한 여행 후기 보기</title>

<!-- css파일 참조 -->
<link rel="stylesheet" type="text/css"
	href="css/trip_review/trip_review_form.css">
<!-- ---------- -->

<!-- javascript 기능 -->
	<script>
		$(function(){			
			$('#btnList').click(function(e){	
				e.preventDefault();			
				location.href="${pageContext.request.contextPath}/trip_review_list";	
			});		
			
			$('#btnWrite').click(function(e){	
				e.preventDefault();			
				location.href="${pageContext.request.contextPath}/trip_review_form";	
			});	
			
			$('#btnDelete').click(function(e){	
				e.preventDefault();			
				location.href="${pageContext.request.contextPath}/trip_review_form";	
			});	
		})
		
	</script>
<!-- ------------- -->
</head>
<body>
	<!-- Bootstrap js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
	<!-- ------------ -->

	<div id="background">
		<div id="container">
		
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">글번호</span> 
						<input type="text" class="form-control" name="review_num"
								aria-label="작성자" aria-describedby="basic-addon1" readonly
								value="${selectedReview.review_num }">
					</div>

					<div class="input-group mb-3" id="title">
						<span class="input-group-text" id="basic-addon1">제목</span> 
						<input type="text" class="form-control" name="review_title"
								aria-label="제목을 입력하세요" aria-describedby="basic-addon1" readonly
								value="${selectedReview.review_title }">
					</div>	
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">작성자</span> 
						<input type="text" class="form-control" name="user_id"
								aria-label="작성자" aria-describedby="basic-addon1" readonly
								value="${selectedReview.user_id }">
					</div>	
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">작성일</span> 
						<input type="text" class="form-control" name="created_at"
								aria-label="작성자" aria-describedby="basic-addon1" readonly
								value="${selectedReview.created_at }">
					</div>
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">조회수</span> 
						<input type="text" class="form-control" name="view_count"
								aria-label="작성자" aria-describedby="basic-addon1" readonly
								value="${selectedReview.view_count }">
					</div>
					<div>
						<button type="button" class="btn btn-outline-warning" id="btnWrite">후기 작성하기</button>
						<button type="button" class="btn btn-outline-warning" id="btnModify">후기 수정하기</button>
						<button type="button" class="btn btn-outline-warning" id="btnDelete">후기 삭제하기</button>
						<button type="button" class="btn btn-outline-warning" id="btnList">전체 목록으로</button>
					</div>
		</div>
	</div>
</body>
</html>