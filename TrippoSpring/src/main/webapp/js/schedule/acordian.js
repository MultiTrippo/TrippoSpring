
$(document).ready(function() {
	var pageId = "kyjPG";
	getFixList(pageId);

	var fixContainer = document.getElementById("fixContainer");
	fixContainer.style.display = "block";
	var accordionCount = 0;
	
	$("#fixAddBtn").click(function() {
	  var fixTitle = document.getElementById("fixTitle");
	  var title = fixTitle.value.trim();
	
	  if (title === "") {
	  	return;
	  }
	 
	    // AJAX 데이터 전송
	    $.ajax({
	    	url: "/fixInsert",
	    	type: "POST",
	    	data: {
	    		p_name: title,
	    		page_id : pageId
	    	},
	    	success: function() {
	    		accordionCount++;
	
			    var accordion = document.createElement("div");
			    accordion.className = "panelDiv";
			    accordion.innerHTML = `
			      <div class="accordion" onclick="toggleAccordion(${accordionCount})">${title}</div>
			      <div id="content${accordionCount}">
				      <div>
				        <input type="color" id="colorPicker${accordionCount}" class="color-picker">
				        <button class="btn" onclick="addLocation(${accordionCount})">핀 생성</button>
				   	  </div>
				        <textarea id="textarea${accordionCount}" class="editable"></textarea>
				       <div>
				        <button class="save" onclick="save(${accordionCount})">저장</button>
				        <button class="delete" onclick="remove(${accordionCount})">삭제</button>
			           </div>
			      </div>
			    `;
			
			    fixContainer.appendChild(accordion);
	    
	   			fixTitle.value = "";
	    
	    	},
	    	error:function(){
	    		console.log("Failed to insert Fix data.");
    		}
	    });
	    
	    
	  });
	  
	  // Fix 목록을 가져오는 함수
	  function getFixList(pageId) {
	  	$.ajax({
	  		url: "fixList?page_id="+pageId,
	  		type: "GET",
	  		dataType:'json',
	  		success: function(response) {
	  			var fixList = response;
	  			console.log(JSON.stringify(fixList));
	  			
	  			for(var i = 0; i < fixList.length; i++) {
	  				var fixTitle = fixList[i].p_name;
	  				var fixMemo = fixList[i].p_memo;
	  				var fixColor = fixList[i].p_color;
	  				var fixLat = fixList[i].lat;
	  				var fixLng = fixList[i].lng;
	  				
	  				var accordion = document.createElement("div");
	  				
				    accordion.className = "panelDiv";
				    accordion.innerHTML = `
				      <div class="accordion" onclick="toggleAccordion(${accordionCount})">${fixTitle}</div>
				      <div id="content${accordionCount}">
					      <div>
					        <input type="color" id="colorPicker${accordionCount}" class="color-picker" value="${fixColor}">
					        <button class="btn" onclick="addLocation(${accordionCount})">핀 생성</button>
					   	  </div>
					        <textarea id="textarea${accordionCount}" class="editable">${fixMemo}</textarea>
					       <div>
					        <button class="save" onclick="save(${accordionCount})">저장</button>
					        <button class="delete">삭제</button>
				           </div>
				      </div>
				    `;
				
				    fixContainer.appendChild(accordion);
	  			}
  			},
	  		error: function() {
	  			console.log("Failed to get Fix List.");
	  		}
	  	});
	  }
	
	
	function toggleAccordion(accordionIndex) {
	  var content = document.getElementById("content" + accordionIndex);
	  if (content.style.display === "none") {
	    content.style.display = "block";
	  } else {
	    content.style.display = "none";
	  }
	}
	
	function addLocation(accordionIndex) {
	  // 구글 맵 API를 통해 좌표를 찍고 값을 가져와서 처리하는 로직 (구현 필요)
	  console.log("Add Location for Accordion " + accordionIndex);
	}
	
	function save(accordionIndex) {
	  var colorPicker = document.getElementById("colorPicker" + accordionIndex);
	  var input = document.getElementById("input" + accordionIndex).value;
	  var textarea = document.getElementById("textarea" + accordionIndex).value;
	
	  console.log("Accordion " + accordionIndex);
	  console.log("색상: " + colorPicker.value);
	  console.log("입력값: " + input);
	  console.log("메모: " + textarea);
	  console.log("위도와 경도: " + lat + ", : " + lng);
	}
	
	$(document).on("click", ".delete", function() {
	  var fixContainerId = $(this).closest(".panelDiv");
	  //var accordion = document.getElementsByClassName("panelDiv")[accordionIndex - 1];
	  //accordion.parentNode.removeChild(accordion);
	
	  $.ajax({
	    url: "/fixDelete",
	    type: "POST",
	    data: {
	      fix_id : fixContainerId.index() + 1,
	      page_id : pageId
	    },
	    success: function() {
	      fixContainerId.remove();
	      console.log("Fix deleted successfully.");
	    },
	    error: function() {
	      console.log("Failed to delete Fix.");
	    }
	  });
	});
});