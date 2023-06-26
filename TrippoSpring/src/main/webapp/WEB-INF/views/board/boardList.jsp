<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
		currentImageIndex=index;
        <%for (int i = 0; i < 5; i++) {%>
		index=index%(images.length);
		var test<%=i%> = document.getElementById("test<%=i%>");
    	test<%=i%>.innerText=currentImageIndex;
		var img<%=i%> = document.getElementById("slideshow-image<%=i%>");
		img<%=i%>.src = images[index++];
		<%}%>
	}

	function previousImage() {
		if (currentImageIndex === 0) {
			showImage(images.length -1);
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



<button type="button" class="btn btn-info" onclick="location.href='/addPost';">게시글 작성</button>
<body onload="showImage(0);">
	<h1>Photo Slideshow</h1>

	<div>
		<h1>Board Title</h1>
	</div>
	
	<div class="dropdown show">
		  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Dropdown link
		  </a>
		
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		    <a class="dropdown-item" href="#">Action</a>
		    <a class="dropdown-item" href="#">Another action</a>
		    <a class="dropdown-item" href="#">Something else here</a>
		  </div>
		</div>
	<div id="wrap" >
		<div id="food" >
			<span class="title">맛집 정보</span>
				<div id="slideshow-container">
					<button class="btn btn-primary" onclick="previousImage()">◀</button>
					<div class="contents-container">
						<%
						for (int i = 0; i < 5; i++) {
						%>
							<div class="post-wrapper text-white bg-info" style="max-width: 18rem;">
								<img id="slideshow-image<%=i%>" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
							
								<div class="card-body">
								    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								    <a href="#" class="btn btn-warning">Go somewhere</a>
								</div>
							</div>
						<%
						}
						%>
					</div>
					<button class="btn btn-primary" onclick="nextImage()">▶</button>
				</div>
		</div>

		<div id="photographySpot">
			<h1>인생 사진 스팟</h1>
			<div id="slideshow-container">
					<button class="btn btn-primary" onclick="previousImage()">◀</button>
					<div class="contents-container">
						<%
						for (int i = 0; i < 5; i++) {
						%>
							<div class="post-wrapper" style="max-width: 18rem; ">
								<img id="slideshow-image<%=i%>" class="card-img-top img-wrapper" src="" alt="Slideshow Image" />
							
								<div class="card-body">
								    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
								    <a href="#" class="btn btn-warning">Go somewhere</a>
								</div>
							</div>
						<%
						}
						%>
					</div>
					<button class="btn btn-primary" onclick="nextImage()">▶</button>
				</div>
		</div>

		<div id="attraction">
			<h1>관광지 추천</h1>
			<div id="slideshow-container">
				<button onclick="previousImage()">Previous</button>
				<%
				for (int i = 0; i < 5; i++) {
				%>
				<div class="image-wrapepr" style="background-color: 'red'">
					<img id="slideshow-image<%=i%>" class="slideshow-img" src=""
						alt="Slideshow Image" />
					<h1 id="test<%=i%>">Hello</h1>
					<p>제목:</p>
					<p>작성자:</p>
					<p>조회수:</p>
				</div>
				<%
				}
				%>
				<button onclick="nextImage()">Next</button>
			</div>
		</div>
	</div>
</body>
</html>