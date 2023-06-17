<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공 예약</title>
</head>
<body>
    <h1>항공 예약</h1>

    <form action="reservation.jsp" method="post">
        <!-- 폼 입력 요소들 -->
    </form>

    <h2>예약 목록</h2>
    <table>
        <tr>
            <th>이름</th>
            <th>항공편</th>
            <th>날짜</th>
        </tr>
        <c:forEach items="${reservations}" var="reservation">
            <tr>
                <td>${reservation.name}</td>
                <td>${reservation.flight}</td>
                <td>${reservation.date}</td>
            </tr>
        </c:forEach>
    </table>

    <%-- Tripadvisor API를 사용하여 항공 정보 가져오기 
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="org.json.JSONArray" %>
    <%@ page import="org.json.JSONObject" %>
    <%@ page import="java.net.URL" %>
    
    
    <%-- 보류중--%> --%>