<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>회원가입</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/member/signup.css">
<!-- ---------- -->

<!-- javascript -->
	<script>		
	$(function(){
		/* 아이디 중복체크 버튼 */
		$('.input-field-idCheck').click(function(e){
			e.preventDefault();
			
			//alert(window.location.pathname); ///myapp/signup
			$.ajax({
				url: "./idCheck",
				type: "post",
				dataType: "json",
				data: {
					"id": $('input[name=id]').val()
				},
				success: function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$('.input-field-idCheck').attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
				
			})
		})
		
		/* 이메일 중복체크 버튼 */
		$('.input-field-emailCheck').click(function(e){
			e.preventDefault();
			
			$.ajax({
				url: "./emailCheck",
				type: "post",
				dataType: "json",
				data: {
					"email": $('input[name=email]').val()
				},
				success: function(data){
					if(data == 1){
						alert("중복된 이메일입니다.");
					}else if(data == 0){
						$('.input-field-emailCheck').attr("value", "Y");
						alert("사용가능한 이메일입니다.");
					}
				}
				
			})
		})
		
		/* 비밀번호 확인 */
		$('#pwdConfirm').keyup(function(){
	
	        if($('#pwd').val() != $('#pwdConfirm').val()){
	          $('.pwdConfirm-div').html('비밀번호 일치X');
	        } else{
	          $('.pwdConfirm-div').html('비밀번호 일치O');
	        }
	
	    });
		
		/* 리셋버튼 */
		$('#formReset').click(function(e){
			e.preventDefault();
			
			if(confirm("작성된 내용을 초기화 하시겠습니까?")){					
				//확인
				signUpForm.reset();
			}else{
				//취소
			}				
		})	
		
		/* 회원가입버튼 */
		$('#formSubmit').click(function(e){	
			e.preventDefault();	
			
			//valid check
			if($('input[name=id]').val().trim()==""){
				alert('아이디를 입력하세요');
				$('input[name=id]').focus();
				return;
			}
			if($('input[name=name]').val().trim()==""){
				alert('이름을 입력하세요');
				$('input[name=name]').focus();
				return;
			}
			if($('input[name=password]').val().trim()==""){
				alert('비밀번호를 입력하세요');
				$('input[name=password]').focus();
				return;
			}
			if($('input[name=phone]').val().trim()==""){
				alert('폰번호를 입력하세요');
				$('input[name=phone]').focus();
				return;
			}
			if($('input[name=birth]').val().trim()==""){
				alert('생년월일을 입력하세요');
				$('input[name=birth]').focus();
				return;
			}
			if(!$('input:radio[name=gender]').is(":checked")){
				alert('성별을 체크해주세요');
				return;
			}
			if($('input[name=email]').val().trim()==""){
				alert('이메일을 입력하세요');
				$('input[name=email]').focus();
				return;
			}		
			
			//아이디 이메일 중복체크 확인
			if($('.input-field-idCheck').val()=='N'){
				alert('아이디 중복확인을 해주세요');
				return;
			}
			if($('.input-field-emailCheck').val()=='N'){
				alert('이메일 중복확인을 해주세요');
				return;
			}
			
			//비밀번호 확인
			if($('.pwdConfirm-div').text() == "비밀번호 일치X"){
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			
			//submit
			$('#signUpForm').attr('method', 'post');
			$('#signUpForm').attr('action', 'signupComplete');
							
			signUpForm.submit();	
			alert("가입이 완료 되었습니다");
		});
		
		
		
	})
	
	</script>

</head>
<body>
	 
<div class="wrapper">
	<div class="form-box">
		<div class="register-container" id="register">
			<div>				
				<header>회원가입</header>
			</div>
			<div>
				<form name="signUpForm" id="signUpForm">
					<div class="input-box-id">	
						<input type="text" class="input-field-id" name="id" placeholder="아이디를 입력하세요">
						<button type="button" class="input-field-idCheck" value="N">아이디 중복확인</button>								
					</div>
					<div class="input-box">	
						<input type="text" class="input-field" name="name" placeholder="이름을 입력하세요">								
					</div>
					<div class="input-box-email">	
						<input type="email" class="input-field-email" name="email" placeholder="이메일을 입력하세요">	
						<button type="button" class="input-field-emailCheck" value="N">이메일 중복확인</button>								
					</div>
					<div class="input-box">	
						<input type="password" class="input-field" name="password" id="pwd" placeholder="비밀번호를 입력하세요">								
					</div>
					<div class="input-box-pwdConfirm">	
						<input type="password" class="input-field-pwdConfirm" id="pwdConfirm" placeholder="비밀번호를 한번더 입력하세요">
						<div class="pwdConfirm-div"></div>								
					</div>
					<div class="input-box">	
						<input type="tel" class="input-field" name="phone" maxlength="11" placeholder="핸드폰번호를 (-)없이 입력하세요">								
					</div>
					<div class="input-box-row">	
						<div class="input-field-left">생년월일을 입력하세요</div>
						<input type="date" class="input-field-right" name="birth">								
					</div>
					<div class="input-box-row">
						<div class="input-field-left">성별을 선택하세요</div>
						<div class="input-field-right">
							<div class="female">
								<input type="radio" name="gender" id="0" value="0">
								<label for="0">여성</label>
							</div>
							<div>
								<input type="radio" name="gender" id="1" value="1">
								<label for="1">남성</label>
							</div>							
						</div>						  
					</div>
					
					<div class="btns-box">
						<button type="button" class="btns" id="formReset">다시 작성</button>
						<button type="button" class="btns" id="formSubmit">회원 가입</button>
					</div>
				</form>				
			</div>			
		</div>	
	</div>
</div> 
</body>
</html>