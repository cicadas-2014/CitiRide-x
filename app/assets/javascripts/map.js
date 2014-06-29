
function initialize(start_latitude, start_longitude) {
  var myLatlng = new google.maps.LatLng(start_latitude, start_longitude);

  var mapOptions = {
    zoom: 15,
    center: myLatlng
  }
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  displayRoute();
}

function displayRoute() {
  var directionsService = new google.maps.DirectionsService();
  var myLatlng = new google.maps.LatLng(40.74025878, -73.98409214);

  var myLatlng2 = new google.maps.LatLng(40.74025878, -73.9889214);

  var wp1 = new google.maps.LatLng(40.74425878, -73.98409214);

  var wp2 = new google.maps.LatLng(40.74425878, -73.9889214);

  wparr = [wp1,wp2];

  var waypoints = [];
  for (var i = 0; i < wparr.length; i++) {
    var address = wparr[i];
    if (address !== "") {
      waypoints.push({
        location: address,
        stopover: true
      });
    }
  }

  var directionsDisplay = new google.maps.DirectionsRenderer();

  directionsDisplay.setMap(map);

  var request = {
    origin : myLatlng,
    destination : myLatlng2,
    waypoints: waypoints,
    travelMode : google.maps.TravelMode.BICYCLING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

function add(){
  alert("hello");
}

function renderMap() {
  google.maps.event.addDomListener(window, 'load', initialize);
}
