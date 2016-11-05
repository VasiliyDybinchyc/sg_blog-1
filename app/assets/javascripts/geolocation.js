function gmap_show(geolocation) {
  var myLatLng = {lat: Number(geolocation.lat), lng: Number(geolocation.lng)};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    icon: "http://maps.google.com/mapfiles/ms/icons/orange-dot.png"
  });
}

function gmap_form(geolocation) {
  var myLatlng = new google.maps.LatLng(Number(geolocation.lat), Number(geolocation.lng));

  var mapOptions = {
    zoom: 12,
    center: myLatlng
  }
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      icon: "http://maps.google.com/mapfiles/ms/icons/orange-dot.png"
  });

  var markerOnMap;

  function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: map
      });
    }
  }

  google.maps.event.addListener(map, 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_lat").value = event.latLng.lat();
    document.getElementById("map_lng").value = event.latLng.lng();
  });

// To add the marker to the map, call setMap();
marker.setMap(map);
}
