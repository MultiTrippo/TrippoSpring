<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="css/flight_reservation.css">
<title>flight result here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ------ -->
</head>
<body>
<script>
$(document).ready(function() {
    // 항공결제 내역을 가져와서 화면에 표시하는 함수
    function showFlightPaymentDetails() {
        // 항공결제 내역을 가져오는 Ajax 요청 설정
        const settings = {
            async: true,
            crossDomain: true,
            url: '항공결제_내역_조회_API_URL',
            method: 'GET',
            headers: {
                'API-Key': 'API_KEY',
                'Content-Type': 'application/json'
            }
        };

        // Ajax 요청 보내기
        $.ajax(settings).done(function(response) {
            // 항공결제 내역을 성공적으로 가져왔을 때 실행되는 부분
            const flightPaymentDetails = response.data;

            // 내역을 화면에 표시하는 부분
            $('#partner-logo').html('<img src="' + flightPaymentDetails.partnerLogoUrl + '" alt="Logo"/>');
            $('#provider-id').text(flightPaymentDetails.providerId);
            $('#commerce-name').text('상품명: ' + flightPaymentDetails.commerceName);
            $('#total-price').text('가격: ' + flightPaymentDetails.totalPrice + '원');
 
        }).fail(function() {
            // 항공결제 내역을 가져오지 못했을 때 실행되는 부분
            console.error('Failed to fetch flight payment details.');
        });
    }

    // 페이지 로드 시 항공결제 내역을 가져와서 표시
    showFlightPaymentDetails();
});
</script>
</body>
</html>