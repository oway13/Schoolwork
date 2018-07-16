var marker2;
var infowindow2;
var map;
var directionsService;
var directionsDisplay;
var placesService;
var geocoder;
var pos;
var placenames;
var placeaddrs;
var markers = [];


//Set Up Map, Center at Assigned Coordinates, Get User's Geolocation
//Set Up the Geocode Object, Gets Locations from Place Table, Places the
//Markers
function initMap() {
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();

    var myLatLng = {
        lat: 44.9727,
        lng: -93.23540000000003
    };
    /* Create a map and place it on the div */
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 16,
        center: myLatLng
    });

    geocoder = new google.maps.Geocoder(); // Create a geocoder object
    getUserLocation();
    extractTable();
    for (var i = 0; i < placenames.length; i++) {
        geocodeAddress(geocoder, map, placeaddrs[i].innerHTML, placenames[i].innerHTML);
    }

} // end init map function definiton

// This function takes a geocode object, a map object, and an address, and 
// if successful in finding the address, it places a marker with a callback that shows an 
// info window when the marker is "clicked"
function geocodeAddress(geocoder, resultsMap, address, name) {
    geocoder.geocode({
        'address': address
    }, function (results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            marker2 = new google.maps.Marker({
                //icon: goldStar,
                map: resultsMap,
                position: results[0].geometry.location,
                title: name
            });
            markers.push(marker2);
            infowindow2 = new google.maps.InfoWindow({
                content: name
            });
            google.maps.event.addListener(marker2, 'click', createWindow(resultsMap, infowindow2, marker2));
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        } //end if-then-else
    }); // end call to geocoder.geocode function
} // end geocodeAddress function

// Function to return an anonymous function that will be called when the rmarker created in the 
// geocodeAddress function is clicked	
function createWindow(rmap, rinfowindow, rmarker) {
    return function () {
        rinfowindow.open(rmap, rmarker);
    }
} //end create (info) window

//Sets Directions Panel for Input Address
function calcRoute() {
    var start = pos; //Current Geolocation
    var end = document.getElementById("destination").value;
    var mode = document.getElementById("travel").value;
    var request = {
        origin: start,
        destination: end,
        travelMode: mode
    };
    directionsDisplay.setMap(map)
    directionsDisplay.setPanel(document.getElementById('directionsPanel'));
    directionsService.route(request,
        function (result, status) {
            if (status == 'OK') {
                directionsDisplay.setDirections(result)
            }
        }
    );
}

//Search for Nearby Places
function placeSearch() {
    var start = {
        lat: 44.9727,
        lng: -93.23540000000003
    };
    var radius = document.getElementById("radius").value;
    var type = document.getElementById("nearby").value;
    var request = {
        location: start,
        radius: radius,
        type: type
    };

    placesService = new google.maps.places.PlacesService(map);
    placesService.nearbySearch(request,
        function (results, status) {
            if (status == google.maps.places.PlacesServiceStatus.OK) {
                clearMarkers();
                for (var i = 0; i < results.length; i++) {
                    createMarker(results[i]);
                }
            }
        }
    );
}

function clearMarkers() {
    for (var j = 0; j < markers.length; j++) {
        markers[j].setMap(null);
    }
    markers = [];
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
    });
    markers.push(marker);

    google.maps.event.addListener(marker, 'click', function () {
        infowindow2.setContent(place.name);
        infowindow2.open(map, this);
    });
}


//Gets the User's Location using HTML5 Geolocation
function getUserLocation() {
    //Get Geolocation
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
        }, function () {
            pos = {
                lat: 44.9727,
                lng: -93.23540000000003
            };
        });
    } else {
        // Browser doesn't support Geolocation
        pos = {
            lat: 44.9727,
            lng: -93.23540000000003
        };
    }
}

function extractTable() {
    placenames = document.getElementsByClassName("placename");
    placeaddrs = document.getElementsByClassName("placeaddress");
}
