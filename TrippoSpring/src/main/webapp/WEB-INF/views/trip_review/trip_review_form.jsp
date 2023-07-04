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
			
/* 			$('#btnConsole').click(function(e){
				e.preventDefault();
				
				let wwhen1 = $('input[name=wwhen1]').val();
				let wwith = $('input[name=wwith]').val();
				console.log(wwhen1);
				console.log(wwith);
				console.log(editor.getHTML());
			}) */
			
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
								
				wwwh_form.submit();	
				alert("후기가 작성 되었습니다");
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
			<button type="button" class="customBtn" id="btnSubmit">
				<ion-icon name="checkbox"></ion-icon>후기 올리기</button>
			<button type="button" class="customBtn" id="btnReset">
				<ion-icon name="refresh-circle"></ion-icon>다시 쓰기</button>
			<button type="button" class="customBtn" id="btnList">
				<ion-icon name="receipt"></ion-icon>글목록으로</button>
			<!-- <button type="button" class="customBtn" id="btnConsole">콘솔</button> -->
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
					<input type="text" list="city" class="form-control" placeholder="여행지를 입력해주세요" name="wwhere">
						   				<datalist id="city">
											<option value="방콕, 태국">
											<option value="부다페스트, 헝가리">
											<option value="싱가포르, 싱가포르">
											<option value="헬싱키, 핀란드">
											<option value="뭄바이, 인도">
											<option value="델리, 인도">
											<option value="프놈펜, 캄보디아">
											<option value="발리, 인도네시아">
											<option value="자카르타, 인도네시아">
											<option value="마닐라, 필리핀">
											<option value="카사블랑카, 모로코">
											<option value="키예프, 우크라이나">
											<option value="리옹, 프랑스">
											<option value="파리, 프랑스">
											<option value="마르세유, 프랑스">
											<option value="바르샤바, 폴란드">
											<option value="이스탄불, 터키">
											<option value="나이로비, 케냐">
											<option value="하바나, 쿠바">
											<option value="유후인, 일본">
											<option value="도쿄, 일본">
											<option value="교토, 일본">
											<option value="오사카, 일본">
											<option value="베이징, 중국">
											<option value="상하이, 중국">
											<option value="홍콩, 중국">
											<option value="오스틴, 미국">
											<option value="뉴욕, 미국">
											<option value="디트로이트, 미국">
											<option value="로스엔젤레스, 미국">
											<option value="라스베가스, 미국">
											<option value="마이애미, 미국">
											<option value="보스턴, 미국">
											<option value="샌프란시스코, 미국">
											<option value="시애틀, 미국">
											<option value="시카고, 미국">
											<option value="애틀란타, 미국">
											<option value="워싱턴DC, 미국">
											<option value="필라델피아, 미국">
											<option value="퀘백, 캐나다">
											<option value="몬트리올, 캐나다">
											<option value="밴쿠버, 캐나다">
											<option value="오타와, 캐나다">
											<option value="토론토, 캐나다">
											<option value="산티아고, 칠레">
											<option value="프라하, 체코">
											<option value="베른, 스위스">
											<option value="취리히, 스위스">
											<option value="제네바, 스위스">
											<option value="발렌시아, 스페인">
											<option value="마드리드, 스페인">
											<option value="바르셀로나, 스페인">
											<option value="리스본, 포르투갈">
											<option value="울란바토르, 몽골">
											<option value="하노이, 베트남">
											<option value="브라질리아, 브라질">
											<option value="상파울루, 브라질">
											<option value="맨체스터, 영국">
											<option value="더블린, 아일랜드">
											<option value="아테네, 그리스">
											<option value="케이프타운, 남아프리카공화국">
											<option value="암스테르담, 네덜란드">
											<option value="카트만두, 네팔">
											<option value="오슬로, 노르웨이">
											<option value="오클랜드, 뉴질랜드">
											<option value="타이베이, 대만">
											<option value="코펜하겐, 덴마크">
											<option value="뒤셀도르프, 독일">					
											<option value="드레스덴, 독일">
											<option value="뮌헨, 독일">
											<option value="베를린, 독일">
											<option value="함부르크, 독일">
											<option value="모스크바, 러시아">
											<option value="블라디보스톡, 러시아">
											<option value="쿠알라룸푸르, 말레이시아">
											<option value="멕시코시티, 멕시코">
											<option value="칸쿤, 멕시코">
											<option value="스톡홀름, 스웨덴">
											<option value="두바이, 아랍에미레이트">
											<option value="런던, 영국">
											<option value="버밍엄, 영국">
											<option value="에든버러, 영국">
											<option value="옥스포드, 영국">
											<option value="케임브릿지, 영국">
											<option value="멜버른, 호주">
											<option value="브리즈번, 호주">
											<option value="시드니, 호주">
											<option value="캔버라, 호주">
											<option value="카이로, 이집트">
											<option value="로마, 이탈리아">
											<option value="밀라노, 이탈리아">
										</datalist>
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
					        initialValue: "## 여행 후기를 작성해주세요"
					       	/*,hooks: {
					            addImageBlobHook(blob, callback) {
					            	console.log(blob)
					            	 await fetchUploadImage(blob).then((path) => {
					            	    console.log(path);
					            	    callback(path, blob.name); 
					            	});
					            	return false;					            	
					            }
					        }*/
					    });
					</script>
				</div>	
				<input id="contents" type="hidden" name="contents">				
			</form>								
		</div>
	</div>	
</body>
</html>