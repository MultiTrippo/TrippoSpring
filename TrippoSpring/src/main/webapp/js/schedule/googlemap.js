// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var data = {lat: null, lng: null}
var map;
var markers = [];

function initAutocomplete() {
  // 맵 생성 후 처음 나오는 화면 센터로 찍음
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.5400456, lng: 126.9921017 },
    zoom: 13,
    mapTypeId: "roadmap",
  });
  
  // Create the search box and link it to the UI element.
  const input = document.getElementById("pac-input");
  const searchBox = new google.maps.places.SearchBox(input);

 
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
  });

  let markers = [];

  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach((marker) => {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    const bounds = new google.maps.LatLngBounds();

    places.forEach((place) => {
      if (!place.geometry || !place.geometry.location) {
        console.log("Returned place contains no geometry");
        return;
      }

      const icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25),
      };

      // Create a marker for each place.
      markers.push(
        new google.maps.Marker({
          map,
          icon,
          title: place.name,
          position: place.geometry.location,
        })
      );
      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  
   // 핀을 생성하기 위한 버튼 클릭 이벤트 처리
  function addLocation(accordionIndex) {
    // 구글 맵에서 클릭 이벤트를 감지하여 핀 생성
    map.addListener("click", function (event) {
      var latLng = event.latLng; // 클릭된 위치의 위도와 경도

      // 핀 생성 로직을 추가
      createPin(latLng, accordionIndex);
    });
  }

  window.addLocation = addLocation;

}

window.initAutocomplete = initAutocomplete;


function createPin(latLng, accordionIndex) {
	// 이전에 생성된 마커가 있으면 제거합니다.
  if (marker) {
    marker.setMap(null);
  }
	

  // 구글 맵에 핀을 추가합니다.
  var marker = new google.maps.Marker({
    position: latLng,
    map: map,
  });

  // 위도와 경도 값을 accordion JavaScript로 전달하여 저장
  var lat = latLng.lat();
  var lng = latLng.lng();

  // accordion JavaScript 함수를 호출하여 값을 전달합니다.
  handlePinData(lat, lng, accordionIndex);
}

function handlePinData(lat, lng, accordionIndex) {
  // 값을 입력 요소에 할당합니다.
  var latLngInput = document.getElementById("latLngInput" + accordionIndex);
  if (latLngInput) {
    latLngInput.value = "위도: " + lat + ", 경도: " + lng;
    console.log(latLngInput.value);
  }
}