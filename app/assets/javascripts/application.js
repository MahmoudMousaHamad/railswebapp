// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require_tree .
//= require bootstrap
//= require underscore
//= require gmaps/google


$(document).ready(function(){
    initLocationMap();
    $('.sidenav').sidenav();
    $('.tabs').tabs();
    $('.collapsible').collapsible();
    $('.materialboxed').materialbox();
    $('.modal').modal_m();
});


  $('.pagination > li > a').on('click', function(){
    $('.pagination > li').removeClass('active');
    $('.pagination > li').addClass('active');
  });

  
  function copyCitation(id) {
    var copyText = document.getElementById(id);
    copyText.select();
    document.execCommand('copy');
    M.toast({html: 'Copied!'});
  }

  function initLocationMap() {
    var lat = $('#show-map-location').data('lat');
    var lng = $('#show-map-location').data('lng');

    var myCoords = new google.maps.LatLng(lat, lng);

    var mapOptions = {
        center: myCoords,
        zoom: 14
    };

    var map = new google.maps.Map(document.getElementById('show-map-location'), mapOptions);

    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
    });
    marker.setMap(map);
  }