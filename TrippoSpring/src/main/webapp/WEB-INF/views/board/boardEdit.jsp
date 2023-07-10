<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>

<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.UUID" %>

<!DOCTYPE html>
<html>
<head>
<title>게시물 수정하기</title>
<!-- jQuery import -->

<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="./../../css/board/boardEdit.css">
</head>

<body id="bodyTag">
  <h1>게시글 수정 페이지</h1>
  <div id="result" onload='setDropdown()'></div>
  <form id="postformEdit">
    <label for="writerEdit">작성자:</label>
    <input type="text" id="writerEdit" name="writerEdit" readonly disabled required>
    <br><br>
    <!-- 카테고리 DropDown -->
    <label for="categoryEdit">카테고리:</label>
    <select id="categoryEdit" name="categoryEdit" class="btn btn-success btn-sm dropdown-toggle" required>
      <option selected value="">--- 카테고리를 선택하세요 ---</option>
      <option value="Food">맛집</option>
      <option value="PhotoSpot">포토스팟</option>
      <option value="Attraction">관광지</option>
    </select>
    <br><br>
    <!-- 글제목 Input -->
    <label for="titleEdit">글제목:</label>
    <input type="text" id="titleEdit" name="titleEdit" required>
    <br><br>
    <!-- 글내용 Input -->
    <label for="content">글내용:</label>
    <textarea id="contentEdit" name="contentEdit" rows="5" required></textarea>
    <br><br>
    <div class="fileWrapper" style="display: flex; flex-direction: row;">
      <label for="fileEdit" style="margin-top: auto; margin-bottom: -5px; padding:0px;">이미지<br>첨부하기:</label>
      <input type="file" id="fileEdit" name="imageFilesEdit" value="" multiple style="margin-top: auto;">
    </div>
    <div id="preview-containerEdit"></div>
    <!-- 국가 DropDown -->
    <br><br>
    <label for="countryEdit">국가:</label>
    <select id="countryEdit" name="countryEdit" class="btn btn-success btn-sm dropdown-toggle" required>
      <option value="" selected>--- 국가를 선택하세요 ---</option>
    </select>
    <br><br>
    <!-- 도시명 DropDown -->
    <label for="cityEdit">도시:</label>
    <select id="cityEdit" name="cityEdit" class="btn btn-success btn-sm dropdown-toggle" required></select>
    <br><br>
    <div>
    <input type="button" value="수정 완료" class="createEdit" onclick="editDone()">
      <!-- <button type="button" class="createEdit" onclick="editDone()">수정 완료</button> -->
    </div>
  </form>
</body>
</html>
