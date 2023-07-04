<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/trip_review/trip_review_form.css">
	<link rel="stylesheet" type="text/css" href="css/trip_review/form.css">
<!-- ---------- -->

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



<!-- javascript 기능 -->
<script>
	/* 웹브라우저 뒤로가기 클릭시 조회수 reload를 위함 */
	window.onpageshow = function(event){
		if(event.persisted){
			document.location.reload();
		}
	};
	
	/* jQuery로 버튼 클릭 이벤트 */
	$(function() {
		$('#btnWrite').click(function(e) {
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/trip_review_form";
		});	
		
		$('#btnList').click(function(e){	
			e.preventDefault();			
			
			location.href="${pageContext.request.contextPath}/trip_review_list";	
		});	
		
		
		
		let paginationForm = $("#paginationForm");
		
		/* 페이지네이션 */
		$(".page-link").on("click", function(e){
			e.preventDefault(); 			

			paginationForm.find("input[name='currPage']").val($(this).attr("href"));
			paginationForm.attr("action", "/myapp/trip_review_search");
			paginationForm.submit();
		});
		
		/* 검색버튼 */
		$('#btnCityListSearch').click(function(e){
			e.preventDefault();
			
			//valid check
			if($('input[name=keyword]').val().trim()==""){
				alert('검색어를 입력하세요');
				$('input[name=keyword]').focus();
				return;
			}
			
			//submit
			let val = $("input[name='keyword']").val();
			paginationForm.find("input[name='keyword']").val(val);
			paginationForm.find("input[name='currPage']").val(1);
			paginationForm.attr("action", "/myapp/trip_review_search");
			paginationForm.submit();			
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
		<h1 class="logo">${pagingVO.cri.keyword } 후기</h1>
		<div class="searchbar">
			<input name="keyword" list="city" type="text" placeholder="검색할 여행지를 입력하세요" value="${pagingVO.cri.keyword }">
				<datalist id="city">
					<option value="">
				</datalist>
			<button id="btnCityListSearch" class="btnCityListSearch">
				<ion-icon name="search-outline"></ion-icon>
			</button>
		</div>
		<div>
			<button type="button" class="customBtn" id="btnWrite">
				<ion-icon name="create"></ion-icon>후기 작성하기</button>
			<button type="button" class="customBtn" id="btnList">
				<ion-icon name="receipt"></ion-icon>글목록으로</button>
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
	 				<c:forEach items="${getAllListWithPaging }" var="list">
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
		<div id="paginationDiv">
			<div>
			  <ul class="pagination" id="pagination">
				<c:if test="${pagingVO.prev }">			    
					<li class="page-item">
					  <a class="page-link" href='${pagingVO.firstBlock -1 }' aria-label="Previous">
					    <span aria-hidden="true">&laquo;</span>
					  </a>
					</li>
			    </c:if>	
			    <c:forEach begin="${pagingVO.firstBlock }" end="${pagingVO.lastBlock }" var="page">
			    	<li class="page-item ${pagingVO.cri.currPage == page? 'active':'' }">
			    		<a class="page-link" href='${page }'>${page }</a></li>
			    </c:forEach>
			    <c:if test="${pagingVO.next }">
				    <li class="page-item">
				      <a class="page-link" href='${pagingVO.lastBlock +1 }' aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				</c:if>
			  	</ul>
			</div>
		</div>
		
		<!-- pagination의 값 전달하기 -->
		<form id="paginationForm" method="get">
			<input type="hidden" name="currPage" value="${pagingVO.cri.currPage }">
			<input type="hidden" name="amount" value="${pagingVO.cri.amount }">
			<input type="hidden" name="keyword" value="${pagingVO.cri.keyword }">
		</form>
		
		
	</div>
</body>
</html>