//var postJson = '${postJson}'; // JSON 형태의 문자열로 가져오기
//var vo = JSON.parse(postJson); 

$(document).ready(function() {
  // 도시 드롭다운 업데이트 함수
  function updateCityEditDropdown() {
    var selectedCountry = document.getElementById('countryEdit').value;
    var cityDropdown = document.getElementById('cityEdit');
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
      url: '/resources/board/cityInfoEdit.json',
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
        var countryDD = document.getElementById("countryEdit");
        for (var i = 0; i < countries.length; i++) {
          var option = document.createElement("option");
          option.setAttribute("id", countries[i]);
          option.innerText = countries[i];
          option.value = countries[i];
          countryDD.appendChild(option);
        }

        // cityMap 객체를 전역 범위로 이동하여 다른 함수에서도 액세스할 수 있도록 합니다.
        window.cityMap = cityMap;

        // 도시 드롭다운 초기화
        updateCityEditDropdown();

        // 원본 게시물에서 지정된 국가가 선택되도록 설정
        selectCountry(vo.country);

        // 도시 드롭다운이 동적으로 업데이트되므로 setTimeout을 사용하여 도시 드롭다운 업데이트 후에 값 선택합니다.
        setTimeout(function() {
          selectCity(vo.city);
        }, 100);
      },
      error: function() {
        console.log('JSON 파일을 불러오는데 실패했습니다.');
      }
    });
  }

  function selectCountry(country) {
    var countryDropdown = document.getElementById('countryEdit');
    var options = countryDropdown.options;

    for (var i = 0; i < options.length; i++) {
      if (options[i].text === country) {
        options[i].selected = true;
        break;
      }
    }

    // 변경 이벤트를 발생시킴
    var changeEvent = new Event('change');
    countryDropdown.dispatchEvent(changeEvent);
  }

  function selectCity(city) {
    var cityDropdown = document.getElementById('cityEdit');
    var options = cityDropdown.options;

    for (var i = 0; i < options.length; i++) {
      if (options[i].text === city) {
        options[i].selected = true;
        break;
      }
    }

    // 변경 이벤트를 발생시킴
    var changeEvent = new Event('change');
    cityDropdown.dispatchEvent(changeEvent);
  }

  // 나머지값도 넣어주기
  document.getElementById('writerEdit').value = vo.writer;
  document.getElementById('titleEdit').value = vo.title;
  document.getElementById('contentEdit').value = vo.content;
  document.getElementById('categoryEdit').value = vo.category;

  // 페이지 로드 후 초기화 함수 호출
  setDropdown();
  $('#countryEdit').on('change', updateCityEditDropdown);

  // Load uploaded images
  var uploadedImages = vo.imgUrls.split(',');
  for (var i = 0; i < uploadedImages.length; i++) {
    var imageUrl = uploadedImages[i];
    displayPreviewImage(imageUrl);
  }

  // Handle file select event
  function handleFileSelect(event) {
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var reader = new FileReader();
      reader.onload = function(e) {
        var imageUrl = e.target.result;
        displayPreviewImage(imageUrl);
      };
      reader.readAsDataURL(file);
    }
  }

  // Add event listener for file input change event
  var fileInput = document.getElementById('fileEdit');
  fileInput.addEventListener('change', handleFileSelect);

  // Display preview image
  function displayPreviewImage(imageUrl) {
    // Create preview image element
    var img = document.createElement("img");
    img.setAttribute("class","preview-imageEdit");
    if (imageUrl.includes("image_")){
    	img.src = "images/board/Upload/"+imageUrl;
    }
    else {
    	img.src = imageUrl;
    }
    img.className = "preview-imageEdit";

    // Create delete button
    var deleteButton = document.createElement("button");
    deleteButton.type = "button";
    deleteButton.setAttribute("class","deleteEdit-btn delete-button btn btn-danger");
    deleteButton.innerText = "Delete";
    deleteButton.addEventListener("click", function() {
      deletePreviewImage(img);
    });

    // Create preview container
    var previewContainer = document.createElement("div");
    previewContainer.setAttribute("class", "preview-setEdit");
    previewContainer.appendChild(img);
    previewContainer.appendChild(deleteButton);

    // Append preview container to the preview container element
    var previewContainerElement = document.getElementById("preview-containerEdit");
    previewContainerElement.appendChild(previewContainer);
  }

  // Delete preview image
  function deletePreviewImage(img) {
    var previewContainer = img.parentNode;
    var previewContainerElement = document.getElementById("preview-containerEdit");
    previewContainerElement.removeChild(previewContainer);
  }

});

// 폼 제출 이벤트 핸들러 등록
function editDone() {
  var writer = document.getElementById('writerEdit').value;
  var title = document.getElementById('titleEdit').value;
  var content = document.getElementById('contentEdit').value;
  var country = document.getElementById('countryEdit').value;
  var city = document.getElementById('cityEdit').value;
  var category = document.getElementById('categoryEdit').value;

  // Get the list of uploaded images
  var uploadedImages = [];
  var previewImages = document.getElementsByClassName('preview-imageEdit');
  for (var i = 0; i < previewImages.length; i++) {
    uploadedImages.push(previewImages[i].src);
  }
  
//Create a Map to hold image name and URI
  var imageMap = new Map();
	
  var now = new Date();
  var formattedNow = now.getTime(); // 타임스탬프를 밀리초로 얻음
  var images = previewImages;
  
  // Add image name and URI to the Map
  for (var i = 0; i < images.length; i++) {
    var image = images[i];
    var imageName = 'image_' + writer + i + '_' + formattedNow + '.jpg';
    if ((image.src).includes("image_")){
    	imageName = image.src;
    	imageMap.set(imageName.slice(42), imageName);
    }    
    else{
    	imageMap.set(imageName, image.src);
    }
  }

  // Convert the Map to JSON format
  var imageMapJson = JSON.stringify(Array.from(imageMap.entries()));

  // AJAX를 사용하여 데이터를 컨트롤러로 전송
  $.ajax({
    type: 'POST',
    url: '/editPostDone',
    data: {
    	imageMapJson: imageMapJson,
      	writer: writer,
      	category: category,
      	title: title,
      	content: content,
      	country: country,
      	city: city,
      	postNo: vo.postNo,
    },
    success: function(res) {
      // 성공적으로 응답을 받았을 때 실행되는 코드
      alert("성공적으로 수정하였습니다.");
      location.href="/boardList";
    },
    error: function(e) {
      // 요청이 실패했을 때 실행되는 코드
      alert("수정을 실패하였습니다.");
      console.log(e.status);
      location.href="/boardList";
    }
  });
}