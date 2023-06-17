<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/board/boardList.css">
<title>자유게시판</title>

<script>
	// JavaScript code for the photo slideshow goes here...
	var images = [
            "https://www.theluxeinsider.com/wp-content/uploads/2020/10/IthaaUnderseaRestaurant.jpg",
            "https://i.insider.com/5805e479dd0895c84b8b46da?width=1000&format=jpeg&auto=webp",
            "https://www.fodors.com/wp-content/uploads/2021/09/shutterstock_724425730.jpg",
            "https://i.ytimg.com/vi/amKiW5ExPys/maxresdefault.jpg",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHxuEofzOcjqyGZjYY-EiNYalUMBtx_XrbtqEoOlbe_kpvrgoddJHqtl-_EkZA8wW1nLg&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSq0QitN7LXOqSWQD0MVLotoD4t_XyaLNi0nEqDX4A3LQWlXvL64Ey-nfx0K1ZrJOfBcg&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5K1QtFVZSu7sRFWrotIPOAt83FGtOLzttlw&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOYKv3AxhH1JuW27bkYwtR68ZDe9tV3KP4bGUe8xk0QJqSbakTX4wcXJzLdiFJKdkBX4s&usqp=CAU",
            "https://i.insider.com/57d04c58b996eb93008b6683?width=600&format=jpeg&auto=webp"
            // Add more image URLs as needed
        ];
	
	var currentImageIndex = 0;

    function showImage(index) {
        var img1 = document.getElementById("slideshow-image1");
        var img2 = document.getElementById("slideshow-image2");
        var img3 = document.getElementById("slideshow-image3");
        img1.src = images[index];
        img2.src = images[index+1];
        img3.src = images[index+2];
        for (int i=0;i<5;i++) {
        	
        }
        currentImageIndex = index;
    }

    function previousImage() {
        if (currentImageIndex === 0) {
            showImage(images.length - 1);
        } else {
            showImage(currentImageIndex - 1);
        }
    }

    function nextImage() {
        if (currentImageIndex === images.length - 1) {
            showImage(0);
        } else {
            showImage(currentImageIndex + 1);
        }
    }
	
</script>
</head>

<body onload="showImage(0);">
	<h1>Photo Slideshow</h1>

	<div>
		<h1>Board Title</h1>
	</div>

	<div id="wrap">
		<div id="food">
			<h1>맛집 정보</h1>
			<div id="slideshow-container">
				<button onclick="previousImage()">Previous</button>
					<img id="slideshow-image1" class="slideshow-img" src="" alt="Slideshow Image" />
					<img id="slideshow-image2" class="slideshow-img" src="" alt="Slideshow Image" />
					<img id="slideshow-image3" class="slideshow-img" src="" alt="Slideshow Image" />
					<%
						for(int i=0;i<5;i++){
					%>
					
					<%
						}
					%>
				<button onclick="nextImage()">Next</button>
			</div>
		</div>

		<div id="photographySpot">
			<h1>인생 사진 스팟</h1>
		</div>

		<div id="attraction">
			<h1>관광지 추천</h1>
		</div>
	</div>
</body>
</html>