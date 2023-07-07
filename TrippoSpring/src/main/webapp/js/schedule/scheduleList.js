// 아이디 가져오기
var id = "${id}";
console.log("console id : " +id);

function reload(){
	setTimeout(function(){
		location.reload();
		},1000); // 3000밀리초 = 3초
}
// 처음 로딩 시 가져오게 하기 위해        
$(document).ready(function() {
	

    // 수정하기 이벤트
    $(document).on('click', '#editButton', function() {
        var title = $(this).closest("tr").find("#title");
        var titleValue = title.text();
        var pageId = $(this).closest("tr").attr("id").split("-")[1];

        var newTitle = prompt('새로운 여행 제목을 입력하세요:', titleValue);

        if (newTitle !== null) {
            // AJAX를 사용하여 데이터를 서버로 전송
            $.ajax({
                url: "/scheduleUpdate",
                type: "POST",
                dataType: 'json',
                data: {
                    id: id,
                    page_id: pageId,
                    trav_title: newTitle
                },
                success: function() {
                    // AJAX 요청이 성공하면 브라우저의 내용을 업데이트
                    title.text(newTitle);
                },
                error: function() {
                    alert("서버 요청에 실패했습니다.");
                }
            });
        }
    });

    // 삭제하기 기능
    $(document).on('click', '#deleteButton', function() {
        var pageId = $(this).closest("tr").attr("id").split("-")[1];

        $.ajax({
            url: "/scheduleDelete",
            type: "POST",
            dataType: 'json',
            data: {
                id: id,
                page_id: pageId
            },
            success: function() {
            	// 삭제 성공 시 해당 행 제거
                $(`#row-${pageId}`).remove();
                console.log("Schedule data delete successfully.");
            },
            error: function() {
                console.log("Failed to delete Schedule data.");
            }
        });
    });
});

// 추가하기 기능
$(function() {
    $('#titleBtn').click(function(e) {
        var textValue = $("#ScheduleInput").val().trim();

        if (textValue === "") {
            return;
        }

        // AJAX를 사용하여 데이터를 서버로 전송
        $.ajax({
            url: "/ScheduleInsert",
            type: "POST",
            dataType: 'json',
            data: {
                id: id,
                trav_title: textValue
            },
            success: function() {
                // 등록 성공 시 새로운 ETC 아이템 생성
                // 등록 성공 시 새로운 행 생성
                var newRow = $("<tr>").attr("id", "row-NEW");
                var td1 = $("<td>").text("NEW");
                var td2 = $("<td>").append($("<a>").attr("href", "/schedule?page_id=NEW").attr("id", "title").text(textValue));
                var td3 = $("<td>").text("현재 날짜");
                var td4 = $("<td>").append(
                    $("<button>").attr("id", "editButton").attr("data-id", "NEW").text("수정"),
                    $("<button>").attr("id", "deleteButton").attr("data-id", "NEW").text("삭제")
                );
                newRow.append(td1, td2, td3, td4);
                $("tbody").append(newRow);

                // 입력 필드 초기화
                $("#ScheduleInput").val("");
            },
            error: function() {
                console.log("Failed to insert Schedule data.");
            }
        });
    });
});
