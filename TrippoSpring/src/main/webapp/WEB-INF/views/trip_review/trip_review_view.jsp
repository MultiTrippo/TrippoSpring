<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery 3.7.0 uncompressed -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<title>선택한 여행 후기 보기</title>

<!-- css파일 참조 -->
<link rel="stylesheet" type="text/css"
	href="css/trip_review/trip_review_view.css">
<!-- ---------- -->

<!-- javascript 기능 -->
<script>
	$(function() {
		$('#btnList')
				.click(
						function(e) {
							e.preventDefault();
							location.href = "${pageContext.request.contextPath}/trip_review_list";
						});

		$('#btnWrite')
				.click(
						function(e) {
							e.preventDefault();
							location.href = "${pageContext.request.contextPath}/trip_review_form";
						});

		$('#btnDelete').click(function(e) {
			e.preventDefault();		

			if (confirm("정말 삭제하시겠습니까?")) {
				//확인
				$('#hiddenForm').attr('action', 'deleteReview');
				$('#hiddenForm').attr('method', 'get');
				hiddenForm.submit();
				alert("삭제가 완료 되었습니다");
			} else {
				//취소
			}
		});

		$('#btnModify').click(function(e) {
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
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
</head>
<body>
	<!-- icon -->
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

	<%@ include file="/inc/top.jspf"%>
	<div class="wrapper">
		<div class="reviewTwoParts">
			<div class="reviewSidebar">
				<h1 class="reviewSidebarTitle">${selectedReview.user_id }님의 여행후기</h1>
				
				<form name="hiddenForm" id="hiddenForm">
					<input type="hidden" name="review_num" value="<c:out value='${selectedReview.review_num }' />">
				</form>
				
				
				<div>
					<c:if test="${loginUser ne null }">
						<button type="button" class="customBtn" id="btnWrite">
							<ion-icon name="create"></ion-icon>
							후기 작성하기
						</button>
					</c:if>
					<button type="button" class="customBtn" id="btnList">
						<ion-icon name="receipt"></ion-icon>
						글목록으로
					</button>		
					<c:if test="${loginUser.id eq selectedReview.user_id }">								
						<button type="button" class="customBtn" id="btnModify">
							<ion-icon name="cut"></ion-icon>
							후기 수정하기
						</button>
						<button type="button" class="customBtn" id="btnDelete">
							<ion-icon name="trash"></ion-icon>
							후기 삭제하기
						</button>	
					</c:if>				
				</div>
			</div>
			<div id="containerOnTheRight">
				<div id="insideReviewBoard">
					<div id="wwwh">
						<!-- (후기번호), 제목, 작성자, (작성일), (조회수), wwhere, wwhen1, wwhen2, wwith, expence, contents     -->
						<div class="insteadOfForm">
							<div class="input-group-30-set">
							<div class="input-group-30">
								<span class="input-group-text">후기번호</span> <input type="text"
									class="form-control" name="review_num" readonly
									value="${selectedReview.review_num }">
							</div>
							<div class="input-group-30">
								<span class="input-group-text">작성일</span> <input type="text"
									class="form-control" name="created_at" readonly
									value="${selectedReview.created_at }">
							</div>
							<div class="input-group-30">
								<span class="input-group-text">조회수</span> <input type="text"
									class="form-control" name="view_count" readonly
									value="${selectedReview.view_count }">
							</div>
							</div>
							<div class="input-group">
								<span class="input-group-text">제목</span> <input type="text"
									class="form-control" name="review_title" readonly
									value="${selectedReview.review_title }">
							</div>
							
							<div class="input-group-50-set">
							<div class="input-group-50">
								<span class="input-group-text">어디로</span> <input type="text"
									class="form-control" name="wwhere" readonly
									value="${selectedReview.wwhere }">
							</div>
							<div class="input-group-50">
								<span class="input-group-text">작성자</span> <input type="text"
									class="form-control" name="user_id" readonly
									value="${selectedReview.user_id }">
							</div>							
							</div>
							
							<div class="input-group-50-set">
							<div class="input-group-50">
								<span class="input-group-text">출발일</span> <input type="text"
									class="form-control" name="wwhen1" readonly
									value="${selectedReview.wwhen1 }">
							</div>
							<div class="input-group-50">
								<span class="input-group-text">도착일</span> <input type="text"
									class="form-control" name="wwhen2" readonly
									value="${selectedReview.wwhen2 }">
							</div>
							</div>
							<div class="input-group-50-set">
								<div class="input-group-50">
									<span class="input-group-text">누구와</span> <input type="text"
										class="form-control" name="wwith" readonly
										value="${selectedReview.wwith }">
								</div>
								<div class="input-group-50">
									<span class="input-group-text">비용</span> <input type="text"
										class="form-control" name="expence" readonly
										value="${selectedReview.expence }" style="text-align: right">
									<span class="input-group-text">원</span>
								</div>
							</div>
							<!-- <div class="input-group-text">후기내용</div> -->
							<div class="form-control-viewer">
								<!-- NHN Cloud TOAST UI Viewer CDN -->
								<script
									src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
								<div id="viewer"></div>
								<!-- TOAST UI Viewer 생성 JavaScript 코드 -->
								<script>
									const viewer = new toastui.Editor(
											{
												el : document
														.querySelector('#viewer'),
												height : '700px',
												initialValue : `${selectedReview.contents }`
											});
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>