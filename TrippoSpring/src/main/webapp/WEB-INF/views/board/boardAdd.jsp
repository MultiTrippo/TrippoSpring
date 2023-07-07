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


<!DOCTYPE html>
<html>
<head>
<title>새로운 게시물 작성하기</title>
<!-- jQuery import -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="./../../css/board/boardAdd.css">
</head>
<script>
$(document).ready(function() {
    // 도시 드롭다운 업데이트 함수
	function updateCityDropdown() {
	    var selectedCountry = document.getElementById('country').value;
	    var cityDropdown = document.getElementById('city');
	    cityDropdown.innerHTML = ''; // 도시 드롭다운 옵션 초기화
	
	    var cityList = cityMap[selectedCountry]; // 선택한 국가에 해당하는 도시 리스트 가져오기
	
	    if (cityList) {
	        // 도시 드롭다운에 도시 옵션 추가
	        var option = document.createElement('option');
	        option.value = "";
            option.text = "--- 도시를 선택하세요 ---";
            cityDropdown.appendChild(option);
	        for (var i = 0; i < cityList.length; i++) {
	            var city = cityList[i];
	            var option = document.createElement('option');
	            option.value = city;
	            option.text = city;
	            cityDropdown.appendChild(option);
	        }
	    }
	}


    // 서버에서 JSON 데이터를 가져와 도시 드롭다운 설정
    function setDropdown() {
        $.ajax({
            url: '/resources/board/cityInfo.json',
            dataType: 'json',
            success: function(data) {
                var countries = [];
                var cityMap = {};

                // 국가와 도시 매핑을 생성하기 위해 데이터를 반복합니다.
                for (var i = 0; i < data.length; i++) {
                    var country = data[i].나라;
                    var city = data[i].도시명;

                    // countries 배열에 국가를 추가합니다.
                    if (!countries.includes(country)) {
                        countries.push(country);
                    }

                    // cityMap 객체에 국가를 키로, 해당 국가의 도시 배열을 값으로 추가합니다.
                    if (cityMap.hasOwnProperty(country)) {
                        cityMap[country].push(city);
                    } else {
                        cityMap[country] = [city];
                    }
                }

                // 국가 드롭다운 설정
                var countryDD = document.getElementById("country");
                for (var i = 0; i < countries.length; i++) {
                    var option = document.createElement("option");
                    option.innerText = countries[i];
                    option.value = countries[i];
                    countryDD.appendChild(option);
                }

                // cityMap 객체를 전역 범위로 이동하여 다른 함수에서도 액세스할 수 있도록 합니다.
                window.cityMap = cityMap;

                // 도시 드롭다운 초기화
                updateCityDropdown();
            },
            error: function() {
                console.log('JSON 파일을 불러오는데 실패했습니다.');
            }
        });
    }

    
    // 페이지 로드 후 초기화 함수 호출
    setDropdown();
    $('#country').on('change', updateCityDropdown);

    // 폼 제출 이벤트 핸들러 등록
    $('#postform').submit(function(e) {
        var writer = document.getElementById('writer').value; // Access the value property
        var title = document.getElementById('title').value;
        var content = document.getElementById('content').value;
        var country = document.getElementById('country').value;
        var city = document.getElementById('city').value;
        var category = document.getElementById('category').value;
        
        if (category.length===''){
        	alert("카테고리를 선택해주세요.");
        	return false;
        }
        if (country.length===''){
        	alert("국가를 선택해주세요.");
        	return false;
        }
        if (city.length===''){
        	alert("도시를 선택해주세요.");
        	return false;
        }
        
        var images = document.getElementsByClassName('preview-image');
        if (images.length<1){
        	alert("적어도 하나의 이미지를 첨부해주세요.");
        	return false;
        }
        var now = new Date();
        var formattedNow = now.getTime(); // 타임스탬프를 밀리초로 얻음
        var hashMap = new Map();

        for (var i = 0; i < images.length; i++) {
            var image = images[i];
            var imageUri = image.src;
            hashMap.set('image_' + writer + i + '_' + formattedNow + '.jpg', imageUri);
        }

        // HashMap 데이터를 JSON 형태로 변환
        var hashMapJson = JSON.stringify(Array.from(hashMap.entries()));
        //alert(hashMapJson);
        
        
        // AJAX를 사용하여 데이터를 컨트롤러로 전송
        $.ajax({
            type: 'POST',
            url: '/addPost',
            data: {
                hashMapJson: hashMapJson,
                writer: writer,
                title: title,
                content: content,
                country: country,
                city: city,
                category: category,
            },
            success: function(res) {
                // 성공적으로 응답을 받았을 때 실행되는 코드
                alert("게시물을 성공적으로 등록하였습니다.");
                window.location.href = res.url;
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때 실행되는 코드
                console.log(error);
            }
        });
    });
});
</script>



</head>
<body>
<!--  enctype="multipart/form-data" -->
    <h1>게시글 작성 페이지</h1>
	
	<div id="result" onload='setDropdown()'></div>
	
    <form id="postform">

        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" required>
        <br><br>
        
        <!-- 카테고리 DropDown -->
        <label for="category">카테고리:</label>
        <select id="category" name="category" class="btn btn-info btn-sm dropdown-toggle">
        	<option selected value="">--- 카테고리를 선택하세요 ---</option>
            <option value="Food">맛집</option>
            <option value="PhotoSpot">포토스팟</option>
            <option value="Attraction">관광지</option>
        </select>
        <br><br>
        
        <!-- 글제목 Input -->
        <label for="title">글제목:</label>
        <input type="text" id="title" name="title" required>
        <br><br>
        
        <!-- 글내용 Input -->
        <label for="content">글내용:</label>
        <textarea id="content" name="content" rows="5" required></textarea>
        <br><br>


		<div style="display: flex; flex-direction: row;">
		    <label for="file" style="margin-top: auto; margin-bottom: -5px; padding:0px;">이미지<br>첨부하기:</label>
		    <input type="file" id="file" name="imageFiles" value="" multiple style="margin-top: auto;">
		</div>
  		<div id="preview-container"></div>

		<!-- 국가 DropDown -->
        <br><br>
        <label for="country">국가:</label>
        <select id="country" name="country" class="btn btn-info btn-sm dropdown-toggle" >
        	<option selected>--- 국가를 선택하세요 ---</option>
        </select>
        <br><br>
        
        <!-- 도시명 DropDown -->
        <label for="city">도시:</label>
        <select id="city" name="city" class="btn btn-info btn-sm dropdown-toggle" >
        	
        </select>
        <br><br>
        <div>
        	<input type="submit" value="게시물 올리기" class="create">
        </div>
    </form>
    
    <script>
    var uploadContainer = document.getElementById("upload-container");
    var previewContainer = document.getElementById("preview-container");

    function handleFileSelect(event) {
      var files = event.target.files; // 업로드된 파일들

      // 각 파일에 대한 미리보기 이미지 생성
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var reader = new FileReader();

        reader.onload = function (event) {
          var imageUrl = event.target.result;

          // 미리보기 이미지 요소 생성
          var img = document.createElement("img");
          img.setAttribute("src", imageUrl);
          img.setAttribute("class", "preview-image");
          
          
          // 선택 삭제 버튼 생성
          var deleteButton = document.createElement("button");
          deleteButton.setAttribute("type", "button");
          deleteButton.setAttribute("class", "delete-button btn btn-danger");
          deleteButton.innerText = "Delete";
          deleteButton.addEventListener("click", function () {
          // 이미지 삭제 버튼 클릭 시 해당 이미지 삭제
          img.parentNode.removeChild(img);
          deleteButton.parentNode.removeChild(deleteButton);
          });
          
          var preview_set = document.createElement("div");
          preview_set.setAttribute("class","preview_set");
          // 이미지와 삭제 버튼을 컨테이너에 추가
          preview_set.appendChild(img);
          preview_set.appendChild(deleteButton);
          previewContainer.appendChild(preview_set);
          /* previewContainer.appendChild(img);
          previewContainer.appendChild(deleteButton); */

          
        };
        
        

        reader.readAsDataURL(file); // 파일을 읽어서 이미지 URL 생성
      }
    }
    var fileInput = document.querySelector('input[type="file"]');
    fileInput.addEventListener("change", handleFileSelect);

    </script>
</body>
</html>
