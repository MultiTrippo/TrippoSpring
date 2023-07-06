$(document).ready(function() {
    // 페이지 로드 시 ETC 목록을 가져오는 함수 호출
    //var pageId = $("#pageId").val();
    var urlParams = new URLSearchParams(window.location.search);
    var pageId = urlParams.get('page_id');
    getEtcList(pageId);
    
    // Add 버튼 클릭 시 이벤트 처리
    $("#addButton").click(function() {
        var textValue = $("#textInput").val().trim();

        if (textValue === "") {
            return;
        }

       
        // AJAX를 사용하여 데이터를 서버로 전송
        $.ajax({
            url: "/etcInsert",
            type: "POST",
            dataType: 'json',
            data: {
                etc: textValue,
                page_id : pageId
            },
            success: function(res) {
                // 등록 성공 시 새로운 ETC 아이템 생성
                var etcDiv =  document.createElement("div");
                etcDiv.className  = "containerDiv";
                console.log(res);
                console.log(res.etc_id);
                etcDiv.setAttribute("data-etcId", res.etc_id);
                
                etcDiv.innerHTML = `
                	<div class="etcDiv">
                		<Text id="etcText">${textValue}</Text>
                		<span id="buttons">
                			<button class="editButton">수정</button>
                			<button class="deleteButton">삭제</button>
            			</span>
                	</div> 
            	`;
                
                etcContainer.appendChild(etcDiv);

                // 입력 필드 초기화
                textInput.value = "";
            },
            error: function() {
                console.log("Failed to insert ETC data.");
            }
        });

       
    });

    // ETC 목록을 가져오는 함수
    function getEtcList(pageId) {
    $.ajax({
        url: "/etcList?page_id=" + pageId,
        type: "GET",
        dataType: "json",
        success: function (response) {
            var etcList = response;
            console.log(JSON.stringify(etcList));

            var container = $("#etcContainer"); // jQuery 객체로 변환

            container.empty();

            var rowSize = 3;
            var rowDiv;

            for (var i = 0; i < etcList.length; i++) {
                var etcData = etcList[i].etc;
                var etcId = etcList[i].etc_id;

                if (i % rowSize === 0) {
                    rowDiv = document.createElement("div");
                    rowDiv.className = "rowDiv";
                    container.append(rowDiv); // jQuery의 append() 메서드로 변경
                }

                var newDiv = document.createElement("div");
                newDiv.className = "containerDiv";
                newDiv.setAttribute("data-etcId", etcId);
                newDiv.innerHTML = `
                    <Text id='etcText'> ${etcData}</Text>
                    <span id='buttons'>
                        <button class='editButton'>수정</button>
                        <button class='deleteButton'>삭제</button>
                    </span>
                `;

                rowDiv.appendChild(newDiv);
            }

        },
        error: function () {
            console.log("Failed to get ETC list.");
        }
    });
}

    // Edit 버튼 클릭 시 이벤트 처리
    $(document).on("click", ".editButton", function() {
        var textSpan = $(this).siblings("span");
        var textValue = textSpan.text();
        var newText = prompt("Enter the updated text", textValue);

        if (newText !== null) {
            textSpan.text(newText);
            
             // 등록할 때 설정한 데이터 속성으로부터 etc_id 가져오기
            var containerDiv = $(this).closest(".containerDiv");
            var etcId = containerDiv.attr("data-etcId");
	
			console.log("up-etcid:" + etcId);
            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                url: "/etcUpdate",
                type: "POST",
                dataType: 'json',
                data: {
                    etc_id: etcId,
                    etc: newText,
                    page_id : pageId
                },
                success: function() {
                	 // 내용을 수정한 후에 화면에 반영
                	containerDiv.find("#etcText").text(newText);
                    console.log("ETC data updated successfully.");
                },
                error: function() {
                    console.log("Failed to update ETC data.");
                }
            });
        }
    });

    // Delete 버튼 클릭 시 이벤트 처리
    $(document).on("click", ".deleteButton", function() {

        var confirmation = confirm("정말로 삭제하시겠습니까?");
        

        if (confirmation) {
            var containerDel = $(this).closest(".containerDiv");
			var etcId = containerDel.attr("data-etcId");  // 등록할 때 설정한 데이터 속성으로부터 etc_id 가져오기

			console.log("etcId : " + etcId);
			
            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                url: "/etcDelete",
                type: "POST",
                dataType: 'json',
                data: {
                    etc_id:  etcId,
                    page_id: pageId
                },
                success: function() {
                    containerDel.remove();
                    console.log("ETC data deleted successfully.");
                },
                error: function() {
                    console.log("Failed to delete ETC data.");
                }
            });
        }
    });
});
