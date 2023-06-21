<!-- payment.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제</title>
</head>
<body>
    <h1>결제</h1>
    <form action="confirmation.jsp" method="post">
        <input type="hidden" name="flightId" value="<%= request.getParameter("flightId") %>">
        <!-- 결제 정보 입력 영역 -->
        <input type="submit" value="예약 완료">
    </form>
</body>
</html>