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
    // �װ����� ������ �����ͼ� ȭ�鿡 ǥ���ϴ� �Լ�
    function showFlightPaymentDetails() {
        // �װ����� ������ �������� Ajax ��û ����
        const settings = {
            async: true,
            crossDomain: true,
            url: '�װ�����_����_��ȸ_API_URL',
            method: 'GET',
            headers: {
                'API-Key': 'API_KEY',
                'Content-Type': 'application/json'
            }
        };

        // Ajax ��û ������
        $.ajax(settings).done(function(response) {
            // �װ����� ������ ���������� �������� �� ����Ǵ� �κ�
            const flightPaymentDetails = response.data;

            // ������ ȭ�鿡 ǥ���ϴ� �κ�
            $('#partner-logo').html('<img src="' + flightPaymentDetails.partnerLogoUrl + '" alt="Logo"/>');
            $('#provider-id').text(flightPaymentDetails.providerId);
            $('#commerce-name').text('��ǰ��: ' + flightPaymentDetails.commerceName);
            $('#total-price').text('����: ' + flightPaymentDetails.totalPrice + '��');
 
        }).fail(function() {
            // �װ����� ������ �������� ������ �� ����Ǵ� �κ�
            console.error('Failed to fetch flight payment details.');
        });
    }

    // ������ �ε� �� �װ����� ������ �����ͼ� ǥ��
    showFlightPaymentDetails();
});
</script>
</body>
</html>