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

<!-- 글꼴 -->
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<title>여행 후기 작성하기</title>

<!-- css파일 참조 -->
	<link rel="stylesheet" type="text/css" href="css/trip_review/trip_review_form.css">
	<link rel="stylesheet" type="text/css" href="css/trip_review/form.css">
<!-- ---------- -->

<!-- javascript 기능 -->
	<script>
		$(function(){
				
			
			$('#btnReset').click(function(e){
				e.preventDefault();
				
				wwwh_form.reset();
			})
			
			$('#btnList').click(function(e){	
				e.preventDefault();			
				
				location.href="${pageContext.request.contextPath}/trip_review_list";	
			});		
			
			$('#btnConsole').click(function(e){
				e.preventDefault();
				
				console.log(editor.getHTML());
			})
			
			$('#btnSubmit').click(function(e){	
				e.preventDefault();								
										
				$('#wwwh_form').attr('method', 'post');
				$('#wwwh_form').attr('action', 'reviewWrite');
				$('input[name=contents]').attr('value', editor.getHTML());
				/* $('input[name=contents]').attr('value', editor.getMarkdown()); */
				
				
				wwwh_form.submit();	
			});
		})
		
	</script>
<!-- ------------- -->

   
<!-- TOAST UI Editor CSS -->
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>

<body>
<!-- icon -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

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



	
	
	<div class="sidebar">
		<h1 class="logo">글 작성 도구</h1>
		<div>
			<button type="button" class="btn btn-outline-warning" id="btnSubmit">글작성</button>
			<button type="button" class="btn btn-outline-warning" id="btnReset">다시쓰기</button>
			<button type="button" class="btn btn-outline-warning" id="btnList">글목록</button>
			<button type="button" class="btn btn-outline-warning" id="btnConsole">콘솔</button>
		</div>
		<div class="menus">
			<a href="#"><ion-icon name="heart"></ion-icon>Home</a>
		</div>
	</div>
		
	<div id="container">			
		<div id="wwwh"> <!-- (후기번호), 제목, 작성자, (작성일), (조회수), wwhere, wwhen, wwith, expence, contents     -->	
			<form id="wwwh_form">				
				<div class="input-group mb-3">
					<span class="input-group-text">제목</span> 
					<input type="text" class="form-control" placeholder="제목을 입력해주세요" name="review_title">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="user_id">
				</div>		
				<div class="form-control">
					<div id="editor"></div>
					<!-- NHN Cloud TOAST UI Editor CDN -->
					<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
					<!-- TOAST UI Editor 생성 JavaScript 코드 -->						
					<script>
						const editor = new toastui.Editor({
					        el: document.querySelector('#editor'),
					        previewStyle: 'vertical',
					        height: '700px',
					        initialValue: "## 여행 후기를 작성해주세요",
					       	hooks: {
					            addImageBlobHook(blob, callback) {
					            	console.log(blob)
					            	/* await fetchUploadImage(blob).then((path) => {
					            	    console.log(path);
					            	    callback(path, blob.name);
					            	});
					            	return false; */					            	
					            }
					        }
					    });
					</script>
				</div>	
				<input id="contents" type="hidden" name="contents">	
				
<!--			<div class="input-group mb-3">
					<span class="input-group-text">어디로</span> 
					<input type="text" class="form-control" placeholder="여행지를 입력해주세요" autocomplete="on" name="wwhere">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">출발일</span> 
					<input type="date" class="form-control" name="wwhen">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">도착일</span> 
					<input type="date" class="form-control">
				</div>			
				<div class="input-group mb-3">
					<span class="input-group-text">비용</span> 
					<input type="text" class="form-control" placeholder="총 여행 경비를 적어주세요" name="expences">
					<span class="input-group-text">₩</span> 
				</div>	 -->					
			</form>								
		</div>
	</div>	
</body>
</html>