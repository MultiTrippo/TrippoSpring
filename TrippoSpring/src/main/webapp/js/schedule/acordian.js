// 페이지 전체 불러올 때로 선언해줌
$(document).ready(function() {
  // url 에서 page_id 값 가져오기
  var urlParams = new URLSearchParams(window.location.search);
  var pageId = urlParams.get('page_id');
  
  // fix 리스트 로딩할 떼 전체로 가져온다.
  getFixList(pageId);

  // 아코디언 블럭으로 생성하기 위해 하는 함수
  var fixContainer = document.getElementById("fixContainer");
  fixContainer.style.display = "block";
  var accordionCount = 0;

  // fix 추가하기 기능
  $("#fixAddBtn").click(function() {
    // 타이틀로 입력 받은 값 가져오기
    var fixTitle = document.getElementById("fixTitle");
    var title = fixTitle.value.trim();

	// 비어있다면 다시 돌려보내기
    if (title === "") {
      return;
    }

    // AJAX 데이터 전송
    $.ajax({
      url: "/fixInsert",
      type: "POST",
      dataType:'json',
      data: {
        p_name: title,
        page_id: pageId
      },
      success: function(res) {
      //alert(res.fix_id);
		// 아코디언 생성해줌
        accordionCount++;

        var accordion = document.createElement("div");
        accordion.className = "panelDiv";
        accordion.setAttribute("data-fixId", res.fix_id);
        
        accordion.innerHTML = `
          <div class="accordion" onclick="toggleAccordion(this)">${title}</div>
          <div class="content">
            <textarea class="editable"></textarea>
            <div>
              <button class="save">저장</button>
              <button class="delete">삭제</button>
            </div>
          </div>
        `;

        fixContainer.appendChild(accordion);

        fixTitle.value = "";
      },
      error: function() {
        console.log("Failed to insert Fix data.");
      }
    });
  });
  

  // Fix 목록을 가져오는 함수
  function getFixList(pageId) {
    $.ajax({
      url: "fixList?page_id=" + pageId,
      type: "GET",
      dataType: 'json',
      success: function(response) {
        var fixList = response;
        console.log(JSON.stringify(fixList));

        for (var i = 0; i < fixList.length; i++) {
          var fixTitle = fixList[i].p_name;
          var fixMemo = fixList[i].p_memo;
          var fixId = fixList[i].fix_id;

          var accordion = document.createElement("div");

          accordion.className = "panelDiv";
          accordion.setAttribute("data-fixId", fixId);
          accordion.innerHTML = `
            <div class="accordion" onclick="toggleAccordion(this)">${fixTitle}</div>
            <div class="content" style="display: none;">
              <textarea class="editable">${fixMemo}</textarea>
              <div>
                <button class="save">저장하기</button>
                <button class="delete">삭제하기</button>
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

  // 아코디언 클릭 이벤트 핸들러 등록
  $(document).on("click", ".accordion", function() {
    toggleAccordion(this);
  });

  // 아코디언 토글 기능
  function toggleAccordion(accordion) {
    var content = accordion.nextElementSibling;
    $(content).slideToggle();
  }

  // 아코디언 저장하기 버튼 눌렀을 때 - 업데이트 기능
  $(document).on("click", ".save", function() {
    var accordion = $(this).closest(".panelDiv");
    var textarea = accordion.find("textarea").val();
    
    // 등록할 때 설정한 데이터 속성으로부터 fix_id 가져오기
    var fixContainer = $(this).closest(".panelDiv");
    var fixId = fixContainer.attr("data-fixId");
    
    // AJAX를 사용하여 데이터를 서버로 전송
    $.ajax({
        url: "/fixUpdate",
        type: "POST",
        dataType: 'json',
        data: {
            fix_id: fixId,
            p_memo: textarea,
            page_id : pageId
        },
        success: function(res) {
            console.log("ETC data updated successfully.");
            //if(res.result>0){
            //	getFixList(pageId);
            //}
        },
        error: function() {
            console.log("Failed to update ETC data.");
        }
    });
    
    
    console.log("메모: " + textarea);
    
    
  });

  // 아코디언 삭제하기 버튼 
  $(document).on("click", ".delete", function() {
    var accordion = $(this).closest(".panelDiv");
    var fixContainerId = accordion.attr("data-fixId");

    $.ajax({
      url: "/fixDelete",
      type: "POST",
      dataType: 'json',
      data: {
        fix_id: fixContainerId,
        page_id: pageId
      },
      success: function() {
        accordion.remove();
        console.log("Fix deleted successfully.");
      },
      error: function() {
        console.log("Failed to delete Fix.");
      }
    });
  });
});
