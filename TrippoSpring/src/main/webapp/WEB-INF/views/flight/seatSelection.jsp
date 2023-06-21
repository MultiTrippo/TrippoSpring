<!-- seatSelection.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
</head>
<body>
    <h1>좌석 선택</h1>
    <form action="payment.jsp" method="post">
        <input type="hidden" name="flightId" value="<%= request.getParameter("flightId") %>">
        <!-- 좌석 선택 영역 -->
        <input type="submit" value="결제">
    </form>
</body>
</html>
