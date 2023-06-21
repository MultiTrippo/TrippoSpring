<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap css -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
<!-- ------------ -->

<!-- jQuery 3.7.0 uncompressed -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<!-- jQuery UI -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->

<!-- javascript파일 참조  --> 
<!--     <script type="text/javascript" src="./js/trip_review/trip_review_form.js"></script> -->
<!-- ----------------- --> 

<title>여행 후기 작성하기</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/trip_review/trip_review_form.css">
<!-- ---------- -->

<!-- javascript 기능 -->
	<script>
		$(function(){
			$('#btnSubmit').click(function(e){	
				e.preventDefault();
				
/* 				if(!$('#review_title').val()){
					alert('제목을 입력하세요.');
					$('#review_title').focus();
					return false;
				}
				
				//userid가 null일때
				if(!$('#user_id').val()){
					alert('글쓴이를 입력하세요.');
					$('#user_id').focus();
					return false;
				} */
				
				wwwh_form.submit();	
			});	
			
			$('#btnList').click(function(e){	
				e.preventDefault();			
				location.href="${pageContext.request.contextPath}/trip_review_list";	
			});			
		})
		
	</script>
<!-- ------------- -->
</head>
<body>
<!-- Bootstrap js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" 
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" 
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" 
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" 
		crossorigin="anonymous"></script>
<!-- ------------ -->
	
	<div id="background">
		<div id="container">
		
			<div id="wwwh">
				<form name="wwwh_form" method="post" action="reviewWrite">	
					<div class="input-group mb-3" id="title">
						<span class="input-group-text" id="basic-addon1">제목</span> 
						<input type="text" class="form-control" placeholder="제목을 입력하세요" name="review_title"
								aria-label="제목을 입력하세요" aria-describedby="basic-addon1">
					</div>	
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">작성자</span> 
						<input type="text" class="form-control" placeholder="작성자" name="user_id"
								aria-label="작성자" aria-describedby="basic-addon1">
					</div>			

						<button type="button" class="btn btn-outline-warning" id="btnSubmit">글작성</button>
						<button type="reset" class="btn btn-outline-warning" id="btnReset">다시쓰기</button>
						<button type="button" class="btn btn-outline-warning" id="btnList">글목록</button>
					</div>
				</form>								
		</div>
					
					<!-- <div class="input-group mb-3" id="title">
						<span class="input-group-text" id="basic-addon1">제목</span> 
						<input type="text" class="form-control" placeholder="제목을 입력하세요"
								aria-label="제목을 입력하세요" aria-describedby="basic-addon1">
					</div>
					
					<div class="input-group mb-3" id="date">
						<span class="input-group-text" id="basic-addon1">작성일</span> 
						<input type="text" class="form-control" placeholder="작성일"
								aria-label="작성일" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3" id="writer">
						<span class="input-group-text" id="basic-addon1">작성자</span> 
						<input type="text" class="form-control" placeholder="작성자"
								aria-label="작성자" aria-describedby="basic-addon1">
					</div>
	
					<div class="input-group mb-3" id="where">
						<span class="input-group-text" id="basic-addon1">어디로</span> 
						<input type="text" class="form-control" placeholder="여행지" autocomplete="on"
								aria-label="여행지" aria-describedby="basic-addon1">
					</div>
					
					<div class="input-group mb-3" id="depart">
						<span class="input-group-text" id="basic-addon1">출발일자</span> 
						<input type="date" class="form-control" placeholder="출발일자"
								aria-label="출발일자" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3" id="arrival">
						<span class="input-group-text" id="basic-addon1">도착일자</span> 
						<input type="date" class="form-control" placeholder="도착일자"
								aria-label="도착일자" aria-describedby="basic-addon1">
					</div>
					
					<div class="input-group mb-3" id="with">
						<span class="input-group-text" id="basic-addon1">누구와</span>
						<button type="button" class="btn btn-outline-warning">부모님과</button>
						<button type="button" class="btn btn-outline-warning">여자끼리</button>
						<button type="button" class="btn btn-outline-warning">남자끼리</button>
						<button type="button" class="btn btn-outline-warning">연인과</button>
						<button type="button" class="btn btn-outline-warning">아이와</button>
						<select class="form-select" id="inputGroupSelect02">
							<option selected>인원</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
						<label class="input-group-text" for="basic-addon1">명</label>
					</div>
					
					<div class="input-group mb-3" id="expences">
						<span class="input-group-text">비용</span>
						<input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
						<span class="input-group-text">₩</span>
					</div>
					
					<div class="input-group mb-3">
						<input type="file" class="form-control" id="inputGroupFile01">
					</div> -->
					
						
				
			
	
<!-- 			<div id="photo_text">
				<form name="photo_text" method="get" enctype="multipart/form-data">
					<input type="file" class="form-control" id="inputGroupFile01">
					<div id="preview">
						사진 미리보기
					</div>	
				</form>
			</div> -->
			
		</div>
	</div>
</body>
</html>