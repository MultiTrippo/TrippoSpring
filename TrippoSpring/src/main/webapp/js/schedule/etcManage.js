var addButton = document.getElementById("addButton");
var etcContainer = document.getElementById("etcContainer");

addButton.addEventListener("click", function(e) {

  var textInput = document.getElementById("textInput");
  var textValue = textInput.value.trim();

  if (textValue === "") {
    return;
  }

  var newDiv = document.createElement("div");
  newDiv.className = "containerDiv";

  var newInnerDiv = document.createElement("div");
  newInnerDiv.innerHTML = "<span>" + textValue + "</span><button class='editButton'>수정</button><button class='deleteButton'>삭제</button>";
  newDiv.appendChild(newInnerDiv);

  etcContainer.appendChild(newDiv);
  
  // AJAX를 사용하여 데이터를 서버로 전송
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/etcInsert"); // etcInsert 서버 스크립트의 경로로 수정
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    
  xhr.onreadystatechange = function() {
  
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
      // 성공적으로 데이터가 처리되었을 때 수행할 작업
      console.log("Data inserted successfully.");
    } else {
    	console.log("데이터 보내기 실패");
	}
  };
  
  var data = "etc=" + encodeURIComponent(textValue);
  
  //var data = {
 //   etc: textValue
 // };
  
  //xhr.send(JSON.stringify(data));

  xhr.send(data);
  
  e.preventDefault();
  textInput.value = "";
  console.log("텍스트초기화");
});

etcContainer.addEventListener("click", function(event) {
  var target = event.target;

  if (target.classList.contains("editButton")) {
    var textSpan = target.parentNode.querySelector("span");
    var textValue = textSpan.textContent;
    var newText = prompt("수정할 내용을 입력하세요", textValue);

    if (newText !== null) {
      textSpan.textContent = newText;

      // AJAX를 사용하여 수정된 데이터를 서버로 전송
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "/etcUpdate"); // etcUpdate 서버 스크립트의 경로로 수정
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
      xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
          // 성공적으로 데이터가 처리되었을 때 수행할 작업
          console.log("Data updated successfully.");
        }
      };
      
      var data = "etc=" + encodeURIComponent(newText);
      xhr.send(data);
    }
  } else if (target.classList.contains("deleteButton")) {
    var containerDiv = target.parentNode.parentNode;
    containerDiv.removeChild(target.parentNode);

    // AJAX를 사용하여 데이터 삭제를 서버로 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/etcDelete"); // etcDelete 서버 스크립트의 경로로 수정
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
        // 성공적으로 데이터가 처리되었을 때 수행할 작업
        console.log("Data deleted successfully.");
      }
    };
    var data = "etc=" + encodeURIComponent(textValue);
    xhr.send(data);

    if (containerDiv.childElementCount === 0) {
      etcContainer.removeChild(containerDiv);
    }
  }
});