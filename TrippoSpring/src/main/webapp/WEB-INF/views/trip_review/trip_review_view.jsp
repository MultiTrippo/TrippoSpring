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
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- javascript파일 참조  -->
<!--     <script type="text/javascript" src="./js/trip_review/trip_review_form.js"></script> -->
<!-- ----------------- -->

<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<title>선택한 여행 후기 보기</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/trip_review/trip_review_form.css">
	<link rel="stylesheet" type="text/css" href="css/trip_review/form.css">
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
				
				$('#hiddenForm').attr('action', 'deleteReview');
				$('#hiddenForm').attr('method', 'get');				
				hiddenForm.submit();				
			});	
			
			$('#btnModify').click(function(e){	
				e.preventDefault();		
				
				$('#hiddenForm').attr('action', 'modifyReview');
				$('#hiddenForm').attr('method', 'get');				
				hiddenForm.submit();				
			});
		})
		
	
		
	</script>
<!-- ------------- -->


<!-- TOAST UI Editor CSS -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/> -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
</head>
<body>
<!-- icon -->
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

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

	<div class="sidebar">
		<h1 class="logo">${selectedReview.user_id }님의 후기</h1>			
		<div>
			<button type="button" class="btn btn-outline-warning" id="btnWrite">후기 작성하기</button>					
			<button type="button" class="btn btn-outline-warning" id="btnList">전체 목록으로</button>
			<form name="hiddenForm" id="hiddenForm">
				<input type="hidden" name="review_num" value="<c:out value='${selectedReview.review_num }' />">
				<button type="button" class="btn btn-outline-warning" id="btnModify">후기 수정하기</button>
				<button type="button" class="btn btn-outline-warning" id="btnDelete">후기 삭제하기</button>
			</form>
		</div>	
		<div class="menus">
			<a href="#"><ion-icon name="heart"></ion-icon>Home</a>
		</div>
	</div>
	<div id="container">
		<div id="wwwh"> <!-- (후기번호), 제목, 작성자, (작성일), (조회수), wwhere, wwhen1, wwhen2, wwith, expence, contents     -->	
			<div class="input-group mb-3">
				<span class="input-group-text">후기번호</span> 
				<input type="text" class="form-control" name="review_num" readonly
						value="${selectedReview.review_num }">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">제목</span> 
				<input type="text" class="form-control" name="review_title" readonly
						value="${selectedReview.review_title }">
			</div>	
			<div class="input-group mb-3">
				<span class="input-group-text">작성자</span> 
				<input type="text" class="form-control" name="user_id" readonly
						value="${selectedReview.user_id }">
			</div>	
			<div class="input-group mb-3">
				<span class="input-group-text">작성일</span> 
				<input type="text" class="form-control" name="created_at" readonly
						value="${selectedReview.created_at }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">조회수</span> 
				<input type="text" class="form-control" name="view_count" readonly
						value="${selectedReview.view_count }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">어디로</span> 
				<input type="text" class="form-control" name="wwhere" readonly
						value="${selectedReview.wwhere }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">출발일</span> 
				<input type="text" class="form-control" name="wwhen1" readonly
						value="${selectedReview.wwhen1 }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">도착일</span> 
				<input type="text" class="form-control" name="wwhen2" readonly
						value="${selectedReview.wwhen2 }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">누구와</span> 
				<input type="text" class="form-control" name="wwith" readonly
						value="${selectedReview.wwith }">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비용</span> 
				<input type="text" class="form-control" name="expence" readonly
						value="${selectedReview.expence }" style="text-align: right">
				<span class="input-group-text">원</span>		
			</div>
			<div class="input-group-text">후기내용</div> 
			<div class="form-control">					
				<!-- NHN Cloud TOAST UI Viewer CDN -->
				<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
				<div id="viewer"></div>
				<!-- TOAST UI Viewer 생성 JavaScript 코드 -->						
				<script>
					const viewer = new toastui.Editor({
				        el: document.querySelector('#viewer'),
				        height: '100%',
				        initialValue: `${selectedReview.contents }`
				      });					      
				</script>
			</div>			
		</div>					
	</div>
</body>
</html>