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
/* 			$("#wwhere").autocomplete({  //오토 컴플릿트 시작
				source: List,	// source는 data.js파일 내부의 List 배열
				focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
					return false;
				},
				minLength: 1,// 최소 글자수
				delay: 100,	//autocomplete 딜레이 시간(ms)
				//disabled: true, //자동완성 기능 끄기
			}); */
			
			$('#btnReset').click(function(e){
				e.preventDefault();
				
				if(confirm("작성된 내용을 초기화 하시겠습니까?")){					
					//확인
					wwwh_form.reset();
				}else{
					//취소
				}				
			})
			
			$('#btnList').click(function(e){	
				e.preventDefault();			
				
				location.href="${pageContext.request.contextPath}/trip_review_list";	
			});		
			
			$('#btnConsole').click(function(e){
				e.preventDefault();
				
				let wwhen1 = $('input[name=wwhen1]').val();
				let wwith = $('input[name=wwith]').val();
				console.log(wwhen1);
				console.log(wwith);
				console.log(editor.getHTML());
			})
			
			$('#btnSubmit').click(function(e){	
				e.preventDefault();	
				
				//valid check
				if($('input[name=review_title]').val().trim()==""){
					alert('제목을 입력하세요');
					$('input[name=review_title]').focus();
					return;
				}
				if($('input[name=user_id]').val().trim()==""){
					alert('작성자를 입력하세요');
					$('input[name=user_id]').focus();
					return;
				}
				if($('input[name=wwhere]').val().trim()==""){
					alert('여행지를 입력하세요');
					$('input[name=wwhere]').focus();
					return;
				}
				if($('input[name=wwhen1]').val().trim()==""){
					alert('출발일을 입력하세요');
					$('input[name=wwhen1]').focus();
					return;
				}
				if($('input[name=wwhen2]').val().trim()==""){
					alert('도착일을 입력하세요');
					$('input[name=wwhen2]').focus();
					return;
				}
				if(!$('input:radio[name=wwith]').is(":checked")){
					alert('누구와 여행했는지 체크해주세요');
					return;
				}
				if($('input[name=expence]').val().trim()==""){
					alert('비용을 입력하세요');
					$('input[name=expence]').focus();
					return;
				}				
				
				//submit
				$('#wwwh_form').attr('method', 'post');
				$('#wwwh_form').attr('action', 'reviewWrite');
				$('input[name=contents]').attr('value', editor.getHTML());
				/* $('input[name=contents]').attr('value', editor.getMarkdown()); */
								
				wwwh_form.submit();	
			});
		})
		
		/* 비용 입력시 자동 콤마 생성 
		function inputNumberFormat(obj) {
		    obj.value = comma(uncomma(obj.value));
		}		
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}		
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}*/
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
		<div id="wwwh"> <!-- (후기번호), 제목, 작성자, (작성일), (조회수), wwhere, wwhen1, wwhen2, wwith, expence, contents     -->	
			<form id="wwwh_form">				
				<div class="input-group mb-3">
					<span class="input-group-text">제목</span> 
					<input type="text" class="form-control" placeholder="제목을 입력해주세요" name="review_title">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">작성자</span> 
					<input type="text" class="form-control" placeholder="작성자" name="user_id">
				</div>	
				<div class="input-group mb-3">
					<span class="input-group-text">어디로</span> 
					<input type="text" class="form-control" placeholder="여행지를 입력해주세요" name="wwhere">
						   <!-- list="cityNameList"
							 <datalist id="cityNameList">
								<option value="발리, 인도네시아">
								<option value="괌, 미국">
							</datalist> -->
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">출발일</span> 
					<input type="date" class="form-control" pattern="yyyy/MM/dd" name="wwhen1">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">도착일</span> 
					<input type="date" class="form-control" pattern="yyyy/MM/dd" name="wwhen2">
				</div>			
				<div class="input-group mb-3">
					<span class="input-group-text">누구와</span> 
					<span class="form-control">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="wwith" id="1" value="부모님과">
						  <label class="form-check-label" for="1">부모님과</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="wwith" id="2" value="혼자여행">
						  <label class="form-check-label" for="2">혼자여행</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="wwith" id="3" value="친구와">
						  <label class="form-check-label" for="3">친구와</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="wwith" id="4" value="연인과">
						  <label class="form-check-label" for="4">연인과</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="wwith" id="5" value="아이와">
						  <label class="form-check-label" for="5">아이와</label>
						</div>
					</span>
				</div>	
				<div class="input-group mb-3">
					<span class="input-group-text">비용</span> 
					<input type="number" class="form-control" placeholder="총 여행 경비를 적어주세요" name="expence"
						   style="text-align: right">
						   <!-- onkeyup="inputNumberFormat(this)"  -->
					<span class="input-group-text">원</span> 
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
					        initialEditType: 'wysiwyg',
					        initialValue: "## 여행 후기를 작성해주세요",
					       	hooks: {
					            addImageBlobHook(blob, callback) {
					            	console.log(blob)
					            	/* await fetchUploadImage(blob).then((path) => {
					            	    console.log(path);
					            	    callback(path, blob.name); 
					            	});
					            	return false;	*/				            	
					            }
					        }
					    });
					</script>
				</div>	
				<input id="contents" type="hidden" name="contents">				
			</form>								
		</div>
	</div>	
</body>
</html>