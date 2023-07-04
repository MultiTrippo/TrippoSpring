<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script defer src="js/schedule/scheduleList.js"></script>

<title>개인 여행 계획 목록 페이지</title>


</head>
<body>
	<div>
		<form action="ScheduleInsert" method="post">
			<input type="text" id="ScheduleInput" placeholder="여행 제목을 입력해주세요.">
			<button type="button" id="titleBtn">여행 계획 작성</button>
		</form>
		
	</div>
	
	<div>	
		<table class="table">
			<thead>
				<tr>
					<th>여행 번호</th>
					<th>제목</th>
					<th>작성 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getAllScheduleList}" var="list">
					<tr id="row-${list.page_id}">
						<td>${list.page_id}</td>
						<td>
							<a href="/schedule?page_id=${list.page_id}" style="text-decoration:none">${list.trav_title}</a>
						</td>
						<td>${list.trav_date}</td>
						<td>
							<button id="editButton" data-id="${list.page_id}">수정</button>
							<button id="deleteButton" data-id="${list.page_id}">삭제</button>
						</td>
					</tr>
					
				
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>