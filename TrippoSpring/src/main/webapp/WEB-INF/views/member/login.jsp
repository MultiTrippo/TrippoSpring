<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery 3.7.0 uncompressed -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<!-- jQuery UI -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<title>로그인하기</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/member/login.css">
<!-- ---------- -->

<!-- javascript -->
	<script>
	$(function(){
		$("#loginComplete").click(function(e){
			e.preventDefault();			
			
			//valid check
			if($('input[name=id]').val().trim()==""){
				alert('아이디를 입력하세요');
				$('input[name=id]').focus();
				return;
			}
			if($('input[name=password]').val().trim()==""){
				alert('비밀번호를 입력하세요');
				$('input[name=password]').focus();
				return;
			}
			
			
			//submit
			$('#loginForm').attr('method', 'post');
			$('#loginForm').attr('action', 'loginComplete');
							
			loginForm.submit();	
		})
		
		$("#toSignUp").click(function(e){
			e.preventDefault();	
			location.href = "${pageContext.request.contextPath}/signup";
		})
		
	})
	</script>

</head>
<body>

<div class="wrapper">
	<div class="purple-box">
		<div class="login-container">
			<div>				
				<header>로그인</header>
			</div>
			<div>
				<c:if test="${result == 0 }">
					<div id="warning">	
						아이디 또는 비밀번호를 잘못입력하셨습니다.								
					</div>
				</c:if>
				<form name="loginForm" id="loginForm">
					<div class="input-box">	
						<input type="text" class="input-field" name="id" placeholder="아이디를 입력하세요">								
					</div>
					<div class="input-box">	
						<input type="password" class="input-field" name="password" placeholder="비밀번호를 입력하세요">								
					</div>
				</form>
			</div>
			<div>
				<button type="button" class="btns" id="loginComplete">로그인</button>
				<button type="button" class="btns" id="toSignUp">회원가입 하러가기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>