<!-- indexform.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공예약</title>
</head>
<body>
    <h1>항공예약</h1>
    <form action="searchFlights.jsp" method="get">
        출발지: <input type="text" name="departure"><br>
        도착지: <input type="text" name="destination"><br>
        출발일: <input type="date" name="date"><br>
        <input type="submit" value="항공편 검색">
    </form>
</body>
</html>
