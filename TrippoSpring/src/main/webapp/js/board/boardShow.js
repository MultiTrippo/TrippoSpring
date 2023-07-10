	var vo = JSON.parse(document.currentScript.getAttribute('jsonString')); // JSON 문자열을 JavaScript 객체로 변환
	var commentList = JSON.parse(document.currentScript.getAttribute('commentJson'));

	var images = vo.imgUrls;
	var imageList = images.split(',');
	