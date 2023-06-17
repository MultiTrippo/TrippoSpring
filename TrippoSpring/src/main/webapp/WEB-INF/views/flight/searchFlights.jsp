<!-- searchFlights.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공편 검색 결과</title>
</head>
<body>
    <h1>항공편 검색 결과</h1>
    <table>
        <tr>
            <th>항공편 번호</th>
            <th>출발지</th>
            <th>도착지</th>
            <th>출발일</th>
            <th>출발시간</th>
            <th>도착시간</th>
            <th>가격</th>
            <th></th>
        </tr>
        <tr>
            <td>1</td>
            <td>서울</td>
            <td>도쿄</td>
            <td>2023-06-20</td>
            <td>09:00</td>
            <td>12:00</td>
            <td>100,000원</td>
            <td><a href="passengerInfo.jsp?flightId=1">선택</a></td>
        </tr>
        <!-- 검색 결과 행 추가 -->
    </table>
</body>
</html>
