
	var vo = JSON.parse(document.currentScript.getAttribute('jsonString')); // JSON 문자열을 JavaScript 객체로 변환
	console.info(vo);
	var images = vo.imgUrls;
	console.info(images);
	var imageList = images.split(',');

		console.info("I'm putImage()");
		var gallery = document.getElementById("gallery");
		for (var i = 0; i < imageList.length; i++) {
			var galleryItem = document.createElement("div");
			galleryItem.setAttribute("class", "gallery-item");
			galleryItem.setAttribute("id", "gallery-item" + i);

			var img = document.createElement("img");
			img.setAttribute("class", "gallery-img");
			img.setAttribute("src",
					"images/board/Upload/"
							+ imageList[i]);
			img.setAttribute("id", "gallery-img" + i);
			img.setAttribute("alt", "GalleryImage");

			galleryItem.appendChild(img);
			gallery.appendChild(galleryItem);

			if (i < 4) {
				galleryItem.classList.add("show");
			}
		}
		var postTitle = document.getElementById("post-title");
		postTitle.innerText = vo.title;
		var postContent = document.getElementById("post-content");
		postContent.innerText = vo.content;
		var postWriter = document.getElementById("post-writer");
		postWriter.innerText = vo.writer;
		var postDate = document.getElementById("post-date");
		postDate.innerText = vo.uploadedDate;
		var postCountry = document.getElementById("countrySpan");
		postCountry.innerText = vo.country;
		var postCity = document.getElementById("citySpan");
		postCity.innerText = vo.city;


	var isOpen = false;
	function showMore() {
		var galleryItems = document.getElementsByClassName("gallery-item");
		for (var i = 4; i < galleryItems.length; i++) {
			galleryItems[i].classList.toggle("show");
		}

		var showMoreButton = document.getElementById("show-more-button");
		showMoreButton.classList.toggle("hidden");

		var showMoreBtn = document.getElementById("showMore");
		isOpen = !isOpen;
		if (isOpen === true) {
			showMoreBtn.innerText = "숨기기";
			showMoreBtn.setAttribute("class", "btn btn-primary");
		} else {
			showMoreBtn.innerText = "더보기"
			showMoreBtn.setAttribute("class", "btn btn-info");
		}

	}
	
	window.onload = function() {
        putImage(0);
    };