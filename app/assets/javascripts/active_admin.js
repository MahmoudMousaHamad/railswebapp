//= require active_admin/base
//= require selectize

// $.getScript("//cdn.rawgit.com/mahnunchik/markerclustererplus/master/dist/markerclusterer.min.js")

$(document).ready(function () {
    $('select').selectize();
});

document.addEventListener("DOMContentLoaded", initMap);

function initMap () {
    var lat = $('input[id*="_lat"')[0].value;
    var lng = $('input[id*="_lng"')[0].value;

    // if not defined create default position
    if (!lat || !lng){
        lat=51.5;
        lng=-0.125;
        lat = $('input[id*="_lat"')[0].value = lat;
        lng = $('input[id*="_lng"')[0].value = lng;
    }

    var myCoords = new google.maps.LatLng(lat, lng);

    var mapOptions = {
        center: myCoords,
        zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('admin-add-map'), mapOptions);

    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });

    // refresh marker position and recenter map on marker
    function refreshMarker(){
        var lat = $('input[id*="_lat"')[0].value;
        var lng = $('input[id*="_lng"')[0].value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());   
    }

    // when input values change call refreshMarker
    $('input[id*="_lat"')[0].onchange = refreshMarker;
    $('input[id*="_lng"')[0].onchange = refreshMarker;

    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        $('input[id*="_lat"')[0].value = newlat;
        $('input[id*="_lng"')[0].value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());   
    });
}