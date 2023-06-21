<!-- passengerInfo.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>승객 정보 입력</title>
</head>
<body>
    <h1>승객 정보 입력</h1>
    <form action="seatSelection.jsp" method="post">
        <input type="hidden" name="flightId" value="<%= request.getParameter("flightId") %>">
        이름: <input type="text" name="name"><br>
         연락처: <input type="text" name="contact"><br>
        <input type="submit" value="다음">
    </form>
</body>
</html>

