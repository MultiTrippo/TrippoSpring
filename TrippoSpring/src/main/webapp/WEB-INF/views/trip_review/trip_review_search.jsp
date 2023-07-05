<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css파일 참조 -->
<link rel="stylesheet" type="text/css"
	href="css/trip_review/trip_review_search.css">
<!-- ---------- -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<title>여행 후기 목록</title>

<!-- javascript 기능 -->
<script>
	/* 웹브라우저 뒤로가기 클릭시 조회수 reload를 위함 */
	window.onpageshow = function(event) {
		if (event.persisted) {
			document.location.reload();
		}
	};

	/* jQuery로 버튼 클릭 이벤트 */
	$(function() {
		$('#btnWrite')
				.click(
						function(e) {
							e.preventDefault();
							location.href = "${pageContext.request.contextPath}/trip_review_form";
						});

		$('#btnList')
				.click(
						function(e) {
							e.preventDefault();

							location.href = "${pageContext.request.contextPath}/trip_review_list";
						});

		let paginationForm = $("#paginationForm");

		/* 페이지네이션 */
		$(".page-link").on(
				"click",
				function(e) {
					e.preventDefault();

					paginationForm.find("input[name='currPage']").val(
							$(this).attr("href"));
					paginationForm.attr("action", "/myapp/trip_review_search");
					paginationForm.submit();
				});

		/* 검색버튼 */
		$('#btnCityListSearch').click(function(e) {
			e.preventDefault();

			//valid check
			if ($('input[name=keyword]').val().trim() == "") {
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
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<!--  -->
	<%@ include file="/inc/top.jspf"%>
	<div class="wrapper">
		<div class="reviewTwoParts">
			<div class="reviewSidebar">
				<h1 class="reviewSidebarTitle">${pagingVO.cri.keyword }후기</h1>
				<div class="searchbar">
					<input name="keyword" list="city" type="text"
						placeholder="검색할 여행지를 입력하세요" value="${pagingVO.cri.keyword }">
					<datalist id="city">
						<option value="방콕, 태국">
						<option value="부다페스트, 헝가리">
						<option value="싱가포르, 싱가포르">
						<option value="헬싱키, 핀란드">
						<option value="뭄바이, 인도">
						<option value="델리, 인도">
						<option value="프놈펜, 캄보디아">
						<option value="발리, 인도네시아">
						<option value="자카르타, 인도네시아">
						<option value="마닐라, 필리핀">
						<option value="카사블랑카, 모로코">
						<option value="키예프, 우크라이나">
						<option value="리옹, 프랑스">
						<option value="파리, 프랑스">
						<option value="마르세유, 프랑스">
						<option value="바르샤바, 폴란드">
						<option value="이스탄불, 터키">
						<option value="나이로비, 케냐">
						<option value="하바나, 쿠바">
						<option value="유후인, 일본">
						<option value="도쿄, 일본">
						<option value="교토, 일본">
						<option value="오사카, 일본">
						<option value="베이징, 중국">
						<option value="상하이, 중국">
						<option value="홍콩, 중국">
						<option value="오스틴, 미국">
						<option value="뉴욕, 미국">
						<option value="디트로이트, 미국">
						<option value="로스엔젤레스, 미국">
						<option value="라스베가스, 미국">
						<option value="마이애미, 미국">
						<option value="보스턴, 미국">
						<option value="샌프란시스코, 미국">
						<option value="시애틀, 미국">
						<option value="시카고, 미국">
						<option value="애틀란타, 미국">
						<option value="워싱턴DC, 미국">
						<option value="필라델피아, 미국">
						<option value="퀘백, 캐나다">
						<option value="몬트리올, 캐나다">
						<option value="밴쿠버, 캐나다">
						<option value="오타와, 캐나다">
						<option value="토론토, 캐나다">
						<option value="산티아고, 칠레">
						<option value="프라하, 체코">
						<option value="베른, 스위스">
						<option value="취리히, 스위스">
						<option value="제네바, 스위스">
						<option value="발렌시아, 스페인">
						<option value="마드리드, 스페인">
						<option value="바르셀로나, 스페인">
						<option value="리스본, 포르투갈">
						<option value="울란바토르, 몽골">
						<option value="하노이, 베트남">
						<option value="브라질리아, 브라질">
						<option value="상파울루, 브라질">
						<option value="맨체스터, 영국">
						<option value="더블린, 아일랜드">
						<option value="아테네, 그리스">
						<option value="케이프타운, 남아프리카공화국">
						<option value="암스테르담, 네덜란드">
						<option value="카트만두, 네팔">
						<option value="오슬로, 노르웨이">
						<option value="오클랜드, 뉴질랜드">
						<option value="타이베이, 대만">
						<option value="코펜하겐, 덴마크">
						<option value="뒤셀도르프, 독일">
						<option value="드레스덴, 독일">
						<option value="뮌헨, 독일">
						<option value="베를린, 독일">
						<option value="함부르크, 독일">
						<option value="모스크바, 러시아">
						<option value="블라디보스톡, 러시아">
						<option value="쿠알라룸푸르, 말레이시아">
						<option value="멕시코시티, 멕시코">
						<option value="칸쿤, 멕시코">
						<option value="스톡홀름, 스웨덴">
						<option value="두바이, 아랍에미레이트">
						<option value="런던, 영국">
						<option value="버밍엄, 영국">
						<option value="에든버러, 영국">
						<option value="옥스포드, 영국">
						<option value="케임브릿지, 영국">
						<option value="멜버른, 호주">
						<option value="브리즈번, 호주">
						<option value="시드니, 호주">
						<option value="캔버라, 호주">
						<option value="카이로, 이집트">
						<option value="로마, 이탈리아">
						<option value="밀라노, 이탈리아">
					</datalist>
					<button id="btnCityListSearch" class="btnCityListSearch">
						<ion-icon name="search-outline"></ion-icon>
					</button>
				</div>
				<div>
					<button type="button" class="customBtn" id="btnWrite">
						<ion-icon name="create"></ion-icon>
						후기 작성하기
					</button>
					<button type="button" class="customBtn" id="btnList">
						<ion-icon name="receipt"></ion-icon>
						글목록으로
					</button>
				</div>
			</div>
			<div id="containerOnTheRight">
				<div id="insideReviewBoard">
					<div id="wwwh">
						<table class="custom-table">
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
										<td><a
											href="/myapp/viewOneReview?review_num=${list.review_num }"
											style="text-decoration: none">${list.review_title }</a></td>
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
						<div class="pagination">
							<c:if test="${pagingVO.prev }">
								<a class="page-link" href='${pagingVO.firstBlock -1 }'
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if>
							<c:forEach begin="${pagingVO.firstBlock }"
								end="${pagingVO.lastBlock }" var="page">
								<a
									class="page-link ${pagingVO.cri.currPage == page? 'active':'' }"
									href='${page }'>${page } </a>
							</c:forEach>
							<c:if test="${pagingVO.next }">
								<a class="page-link" href='${pagingVO.lastBlock +1 }'
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if>
						</div>
					</div>

					<!-- pagination의 값 전달하기 -->
					<form id="paginationForm" method="get">
						<input type="hidden" name="currPage"
							value="${pagingVO.cri.currPage }"> <input type="hidden"
							name="amount" value="${pagingVO.cri.amount }"> <input
							type="hidden" name="keyword" value="${pagingVO.cri.keyword }">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>