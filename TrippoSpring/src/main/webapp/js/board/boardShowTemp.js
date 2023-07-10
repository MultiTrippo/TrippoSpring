	var vo = JSON.parse(document.currentScript.getAttribute('jsonString')); // JSON 문자열을 JavaScript 객체로 변환
	var commentList = JSON.parse(document.currentScript.getAttribute('commentJson'));

	//var postJson = '${postJson}'; // JSON 형태의 문자열로 가져오기
	//var vo = JSON.parse(postJson); // JSON 문자열을 JavaScript 객체로 변환
	//var commentJson = '${commentJson}';
	//var commentList = JSON.parse(commentJson);
	//alert(vo.city);
	
	var images = vo.imgUrls;
	var imageList = images.split(',');
	
	function putImage() {
	    putComment(commentList);
	    var gallery = document.getElementById("gallery");
	    for (var i = 0; i < imageList.length; i++) {
	        var galleryItem = document.createElement("div");
	        galleryItem.setAttribute("class", "gallery-item");
	        galleryItem.setAttribute("id", "gallery-item" + i);

	        var img = document.createElement("img");
	        img.setAttribute("class", "gallery-img");
	        img.setAttribute("src", "images/board/Upload/" + imageList[i]);
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
	    //alert(postWriter);
	    var postDate = document.getElementById("post-date");
	    postDate.innerText = vo.uploadedDate;
	    var postCountry = document.getElementById("countrySpan");
	    postCountry.innerText = vo.country;
	    var postCity = document.getElementById("citySpan");
	    postCity.innerText = vo.city;

	    if (imageList.length < 5) {
	        var showMoreBtn = document.getElementById("showMore");
	        showMoreBtn.setAttribute("hidden", true);
	    }
	}
	
	function putComment(commentList) {
		var commentBox = document.getElementById('commentBox');
		commentBox.innerHTML='';
		

		for(var i = 0; i<commentList.length; i++) {
			var commentNow = commentList[i];
			var commentSet = document.createElement("div");
			commentSet.setAttribute("class","buttonSet");
			
			var icon = document.createElement("img");
			icon.setAttribute("src", "images/board/person-fill.svg");
			icon.setAttribute("alt", "iconImage");
			icon.setAttribute("class","icon");
			
			var userName = document.createElement("p");
			userName.setAttribute("id", "username-item"+i);
			userName.setAttribute("class", "username-item")
			userName.innerText = commentNow.username + ": ";
			var commentItem = document.createElement("p");
			commentItem.setAttribute("id", "comment-item"+i);
			commentItem.setAttribute("class", "comment-item");
			commentItem.innerText = commentNow.commentText;
			
			
			var commentInfo = document.createElement("div");
			commentInfo.setAttribute("class", "commentInfo");
			
			var uid = "${loginUser.id}"
			var commentDelete = document.createElement("button");
			commentDelete.setAttribute("class", "delete-btn btn btn-primary btn-sm");
			commentDelete.setAttribute("value", commentNow.postNo);
			commentDelete.setAttribute("onclick", "deleteComment("+commentNow.postNo+","+commentNow.commentNo+")");
			commentDelete.innerText = "삭제";
			commentInfo.appendChild(icon);
			commentInfo.appendChild(userName);
			commentInfo.appendChild(commentItem);
			commentSet.appendChild(commentInfo);
			if (uid === commentNow.username) {
	            commentSet.appendChild(commentDelete);
	        }
			
	        commentBox.appendChild(commentSet);
	    }
	}//putComment -----------------------------
	
	function deleteComment(TargetPostNo, TargetCommentNo) {
	    console.log(TargetPostNo);
	    $.ajax({
	        type: 'POST',
	        url: '/commentDelete',
	        data: 'targetPostNo=' + TargetPostNo + "&targetCommentNo=" + TargetCommentNo,
	        success: function (res) {
	            var newCommentList = JSON.parse(JSON.stringify(res.comment));
	            var commentInput = document.getElementById("commentText");
	            commentInput.value = null;
	            var usernameInput = document.getElementById("username");
	            if ("${loginUser.id}" === null) {
				    usernameInput.value = "로그인 후 이용하세요";
				} else {
				    usernameInput.value = "${loginUser.id}";
				}

	            putComment(newCommentList);
	        },

	        error: function (e) {
	            alert(e.status);
	        }
	    })
	}
	
	
	function putImage() {
		putComment(commentList);
		var gallery = document.getElementById("gallery");
		for (var i = 0; i < imageList.length; i++) {
			var galleryItem = document.createElement("div");
			galleryItem.setAttribute("class", "gallery-item");
			galleryItem.setAttribute("id", "gallery-item" + i);

			var img = document.createElement("img");
			img.setAttribute("class", "gallery-img");
			img.setAttribute("src", "images/board/Upload/" + imageList[i]);
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
		//alert(postWriter);
		var postDate = document.getElementById("post-date");
		postDate.innerText = vo.uploadedDate;
		var postCountry = document.getElementById("countrySpan");
		postCountry.innerText = vo.country;
		var postCity = document.getElementById("citySpan");
		postCity.innerText = vo.city;
		
		if(imageList.length < 5) {
			var showMoreBtn = document.getElementById("showMore");
			showMoreBtn.setAttribute("hidden", true);
		}
	}

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
	
	function send() {
	    var username = document.getElementById('username').value;
	    if (username.trim() === '' || username.trim() === '로그인 후 이용하세요') {
	        alert('로그인 후 이용하세요');
	        return false;
	    }

	    var commentText = document.getElementById('commentText').value;
	    if (commentText.trim() === '') {
	        alert('댓글 내용을 입력하세요');
	        document.getElementById('commentText').focus();
	        return false;
	    }

	    $.ajax({
	        type: 'POST',
	        url: '/boardShowSend',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            postNo: vo.postNo,
	            username: username,
	            commentText: commentText,
	        }),
	        success: function (res) {
	            var newCommentList = JSON.parse(JSON.stringify(res.comment));
	            var commentInput = document.getElementById("commentText");

	            commentInput.value = null;

	            var usernameInput = document.getElementById("username");
				if ("${loginUser.id}" === null) {
				    usernameInput.value = "로그인 후 이용하세요";
				} else {
				    usernameInput.value = "${loginUser.id}";
				}
	            

	            putComment(newCommentList);
	        },

	        error: function (e) {
	            alert(e.status);
	        }
	    })
	}
	
	/* deletePost(${postNo})
	openEditor(${postNo}) */
	
	window.onload = function() {
        putImage();
        putComment(commentList);
 
    	var usernameBox = document.getElementById("username");
    	if ("${loginUser.id}" === null) {
    	    usernameBox.value = "로그인 후 이용하세요";
    	} else {
    	    usernameBox.value = "${loginUser.id}";
    	}

    };