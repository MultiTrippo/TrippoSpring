<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 팝업창 </title>
		<!-- css 참조 -->
		<!-- <link rel="stylesheet" type="text/css" href="css/acom/imgpopup.css"> -->
		
		 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> 
<title>Trippo 숙소 정보</title>
<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 참조 ( self ) -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  

</head>
<body>
<script>




const settings = {
	async: true,
	crossDomain: true,
	url: 'https://apidojo-booking-v1.p.rapidapi.com/properties/get-hotel-photos?hotel_ids=${param.hotel_id}&languagecode=en-us',
	method: 'GET',
	headers: {
		'X-RapidAPI-Key': 'bd1514d8fcmshc56f5e0cee38c07p131386jsn6498ffd0e6fd',
		'X-RapidAPI-Host': 'apidojo-booking-v1.p.rapidapi.com'
	}
};

$.ajax(settings).done(function (response) {
	//console.log(response.data);
	let arr=Object.values(response.data);
	 	console.log(arr[0]) 
	 	let uri_prefix='https://cf.bstatic.com';
	$.each(arr[0], function(i, data){
		if(i>=3 && i<=12){
			console.log(data[4])
			let img1=uri_prefix+data[4]
			$('#img'+(i-2)).attr('src', img1);
		}
	})

});
//$('img1').attr('src', img1);
 /* $(#img1).html(img1) */


</script>
<style>
.carousel-item img{
width:100%;
/* height:400px; */
}
</style>

<!-- ------------------------------------------ -->
<!-- The Modal -->
<div class="modal modal-fullsize" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">숙소 이미지</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="row">
<div class="col-12">
<div id="popup" class="carousel slide" data-ride="carousel" data-interval="2000">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#popup" data-slide-to="0" class="active"></li>
    <li data-target="#popup" data-slide-to="1"></li>
    <li data-target="#popup" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img id="img1" src="" alt="숙소 이미지 " class="img-fluid" >
    </div>
    <div class="carousel-item">
      <img id="img2" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
    <div class="carousel-item">
      <img id="img3" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img4" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img5" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img6" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img7" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img8" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img9" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
        <div class="carousel-item">
      <img id="img10" src="" alt="숙소 이미지"  class="img-fluid">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#popup" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#popup" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>

</div>
</div>
<!-- modal body -->
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>