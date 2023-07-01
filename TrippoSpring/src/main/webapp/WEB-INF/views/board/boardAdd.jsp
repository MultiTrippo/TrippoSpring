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
<title>Create New Post</title>
<!-- jQuery import -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function() {
    $.ajax({
        url: '/resources/board/cityInfo.json',
        dataType: 'json',
        success: function(data) {
            // 서버로부터 JSON 데이터를 성공적으로 받아왔을 때 실행되는 함수
            // data 변수에는 JSON 데이터가 포함됩니다.
            
            // JSON 데이터를 처리하는 코드를 작성하세요.
            // 예를 들어, 데이터를 화면에 출력하려면 다음과 같이 할 수 있습니다
			//var countries = [];
			//var cityMap = {};
			
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
            
            var countryDD = document.getElementById("country");
            <%for (int i=0; i< 73; i++) {%>
	    		var selection<%=i%> = document.createElement("option");
	    		selection<%=i%>.innerText = countries[<%=i%>];
	    		selection<%=i%>.value = countries[<%=i%>];
	    		selection<%=i%>.id = countries[<%=i%>];
	    		countryDD.appendChild(selection<%=i%>);
    		<%}%>
    		
    		// cityMap 객체를 전역 범위로 이동하여 다른 함수에서도 액세스할 수 있도록 합니다.
            window.cityMap = cityMap;
    		
    		 // 결과 출력
            //$('#result').text(JSON.stringify(cityMap));
        },
        error: function() {
            console.log('JSON 파일을 불러오는데 실패했습니다.');
        }
    });
});



function updateCityDropdown() {
    var selectedCountry = document.getElementById('country').value;
    var cityDropdown = document.getElementById('city');
    cityDropdown.innerHTML = ''; // 도시 드롭다운 옵션 초기화

    var cityList = cityMap[selectedCountry]; // 선택한 국가에 해당하는 도시 리스트 가져오기

    // 도시 드롭다운에 도시 옵션 추가
    for (var i = 0; i < cityList.length; i++) {
        var city = cityList[i];
        var option = document.createElement('option');
        option.value = city;
        option.text = city;
        cityDropdown.appendChild(option);
    }
}
        
	
</script>

<style>
    .preview-image {
      width: 100px;
      height: auto;
      margin: 5px;
      border: 1px solid #ccc;
      padding: 2px;
    }
</style>

</head>
<body>
<!--  enctype="multipart/form-data" -->
    <h1>Create New Post</h1>
	
	<div id="result"></div>
	
    <form id=postForm action="${pageContext.request.contextPath}/addPost" method="post" enctype="multipart/form-data">
        <label for="writer">Writer:</label>
        <input type="text" id="writer" name="writer" required>
        <br><br>
        
        <label for="category">Category:</label>
        <select id="category" name="category">
        	<option selected>--- 카테고리를 선택하세요 ---</option>
            <option value="Food">맛집</option>
            <option value="PhotoSpot">포토스팟</option>
            <option value="Attraction">관광지</option>
        </select>
        <br><br>
        
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <br><br>
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" required></textarea>
        <br><br>
        
        <label for="imgUrls">Image:</label>
        <div id="upload-container">
        	<input type="file" name="images[]" accept="image/*">
    	</div>
    	<br>
  		<div id="preview-container"></div>

        <br><br>
        <label for="country">Country:</label>
        <select id="country" name="country" onchange="updateCityDropdown()">
        	<option selected>--- 국가를 선택하세요 ---</option>
        </select>
        
        <br><br>
        <label for="city">City:</label>
        <select id="city" name="city">
        	<option selected>--- 나라를 선택하세요 ---</option>
        </select>
        <br><br>
        <input type="submit" value="Create">
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
          deleteButton.setAttribute("class", "delete-button");
          deleteButton.innerText = "Delete";
          deleteButton.addEventListener("click", function () {
            // 이미지 삭제 버튼 클릭 시 해당 이미지 삭제
            img.parentNode.removeChild(img);
            deleteButton.parentNode.removeChild(deleteButton);
          });

          // 이미지와 삭제 버튼을 컨테이너에 추가
          previewContainer.appendChild(img);
          previewContainer.appendChild(deleteButton);
        };

        reader.readAsDataURL(file); // 파일을 읽어서 이미지 URL 생성
      }
    }

    var fileInput = document.querySelector('input[type="file"]');
    fileInput.addEventListener("change", handleFileSelect);
    </script>
</body>
</html>
