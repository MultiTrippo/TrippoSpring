    

$(document).ready(function() {
    // 페이지 로드 시 ETC 목록을 가져오는 함수 호출
    //var pageId = $("#pageId").val();
    var pageId = "kyjPG";
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
            data: {
                etc: textValue,
                page_id : pageId
            },
            success: function() {
                // 등록 성공 시 새로운 ETC 아이템 생성
                var newDiv = $("<div>").addClass("containerDiv");
                var newInnerDiv = $("<div>").html("<span>" + textValue + "</span><button class='editButton'>Edit</button><button class='deleteButton'>Delete</button>");
                newDiv.append(newInnerDiv);
                $("#etcContainer").append(newDiv);

                // 입력 필드 초기화
                $("#textInput").val("");
            },
            error: function() {
                console.log("Failed to insert ETC data.");
            }
        });

       
    });

    // ETC 목록을 가져오는 함수
    function getEtcList(pageId) {
        $.ajax({
            url: "/etcList?page_id="+pageId,
            type: "GET",
            dataType:'json',           
            success: function(response) {
                var etcList = response;//.selectEtc;
	 			console.log(JSON.stringify(etcList));
                for (var i = 0; i < etcList.length; i++) {
                    var etcData = etcList[i].etc;
                    var etcNo = etcList[i].etc_id;

                    var newDiv = $("<div>").addClass("containerDiv");
                    newDiv.attr("data-etcId", etcNo);// etcid 속성으
                    var newInnerDiv = $("<div>").html("<span>" + etcData + "</span><button class='editButton'>Edit</button><button class='deleteButton'>Delete</button>");
                    newDiv.append(newInnerDiv);
                    $("#etcContainer").append(newDiv);
                }
            },
            error: function() {
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
            var etcId = containerDiv.data("etcId");

            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                url: "/etcUpdate",
                type: "POST",
                data: {
                    etc_id: etcId,
                    etc: newText,
                    page_id : pageId
                },
                success: function() {
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
    
    	
        var confirmation = confirm("Are you sure you want to delete this item?");

        if (confirmation) {
            var containerDiv = $(this).closest(".containerDiv");
			var etcId = containerDiv.data("etcId");  // 등록할 때 설정한 데이터 속성으로부터 etc_id 가져오기

            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                url: "/etcDelete",
                type: "POST",
                data: {
                    etc_id: etcId,
                    page_id: pageId
                },
                success: function() {
                    containerDiv.remove();
                    console.log("ETC data deleted successfully.");
                },
                error: function() {
                    console.log("Failed to delete ETC data.");
                }
            });
        }
    });
});
