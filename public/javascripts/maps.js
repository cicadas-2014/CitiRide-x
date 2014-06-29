function initialize(coords) {
  var myLatlng = new google.maps.LatLng(coords[0][0],coords[0][1]);
  console.log(myLatlng);
  var mapOptions = {
    zoom: 10,
    center: myLatlng
  }

  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  displayRoute1walk(coords[0],coords[1]);
  displayRoutebike(coords[1],coords[2]);
  displayRoute2walk(coords[2],coords[3]);

  map.setCenter(myLatlng);
}

function displayRoute1walk(start,start_station) {
  var directionsService = new google.maps.DirectionsService();
  var myLatlng = new google.maps.LatLng(start[0],start[1]);
  var myLatlng2 = new google.maps.LatLng(start_station[0],start_station[1]);

  var directionsDisplay = new google.maps.DirectionsRenderer();

  var request = {
    origin : myLatlng,
    destination : myLatlng2,
    travelMode : google.maps.TravelMode.WALKING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });

  // makeMarker( leg.start_location, icons.start, "start here" );

  directionsDisplay.setMap(map);

}

function displayRoutebike(start_station, next_station) {
  var directionsService = new google.maps.DirectionsService();
  var myLatlng = new google.maps.LatLng(start_station[0],start_station[1]);

  var myLatlng2 = new google.maps.LatLng(next_station[0],next_station[1]);

  var directionsDisplay = new google.maps.DirectionsRenderer();

  var request = {
    origin : myLatlng,
    destination : myLatlng2,
    travelMode : google.maps.TravelMode.BICYCLING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });

  directionsDisplay.setMap(map);
  directionsDisplay.setOptions( { suppressMarkers: true } );
}



function displayRoute2walk(next_station, destination) {
  var directionsService = new google.maps.DirectionsService();
  var myLatlng = new google.maps.LatLng(next_station[0],next_station[1]);

  var myLatlng2 = new google.maps.LatLng(destination[0],destination[1]);

  var directionsDisplay = new google.maps.DirectionsRenderer();

  var request = {
    origin : myLatlng,
    destination : myLatlng2,
    travelMode : google.maps.TravelMode.WALKING
  };

  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });

  directionsDisplay.setMap(map);
}

function renderMap(coords) {
  google.maps.event.addDomListener(window, 'load', initialize(coords));
}
