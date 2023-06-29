<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="com.google.gson.JsonObject" %>


<!DOCTYPE html>
<html>
<head>
<title>Create New Post</title>
<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    
<script>
	// Define an object with country-city mappings
	var cityMap = {
	    "USA": ["New York", "Los Angeles", "Chicago"],
	    "Canada": ["Toronto", "Vancouver", "Montreal"],
	    "UK": ["London", "Manchester", "Edinburgh"]
	    // Add more country-city mappings here
	};
	
	// Function to update the city dropdown based on the selected country
	function updateCityDropdown() {
	    var countrySelect = document.getElementById("country");
	    var citySelect = document.getElementById("city");
	    var selectedCountry = countrySelect.options[countrySelect.selectedIndex].value;
	    var cities = cityMap[selectedCountry];
	
	    // Clear existing options
	    citySelect.innerHTML = "";
	
	    // Populate city options
	    for (var i = 0; i < cities.length; i++) {
	        var option = document.createElement("option");
	        option.value = cities[i];
	        option.text = cities[i];
	        citySelect.appendChild(option);
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

    <form id=postForm action="${pageContext.request.contextPath}/addPost" method="post" enctype="multipart/form-data">
        <label for="writer">Writer:</label>
        <input type="text" id="writer" name="writer" required>
        <br><br>
        
        <label for="category">Country:</label>
        <select id="category" name="category">
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
        	<c:import var="dataJson" url="/Users/minjikang/git/TrippoSpring/TrippoSpring/src/main/webapp/resources/board/cityInfo.json" />
			<%
			  String jsonString = (String) pageContext.getAttribute("cityInfo");
			
			  Gson gson = new Gson();
			  JsonElement jsonElement = gson.fromJson(jsonString, JsonElement.class);
			  JsonArray jsonArray = jsonElement.getAsJsonArray();
			
			  JsonObject jsonObject1 = jsonArray.get(0).getAsJsonObject();
			  String country1 = jsonObject1.get("나라").getAsString();
			  String city1 = jsonObject1.get("도시명").getAsString();
			
			  JsonObject jsonObject2 = jsonArray.get(1).getAsJsonObject();
			  String country2 = jsonObject2.get("나라").getAsString();
			  String city2 = jsonObject2.get("도시명").getAsString();
			
			  // 필요한 작업 수행
			%>
            <option value="USA">USA</option>
            <option value="Canada">Canada</option>
            <option value="UK">UK</option>
            <!-- Add more country options here -->
        </select>
        
        <br><br>
        <label for="city">City:</label>
        <select id="city" name="city"></select>
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
