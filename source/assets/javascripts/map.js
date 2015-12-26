if($("#ralnc_map").length > 0) {
  $.getScript("https://maps.googleapis.com/maps/api/js?libraries=geometry,places&callback=raleighMap");
}

function raleighMap() {
  var mapCenter = new google.maps.LatLng(35.7767244, -78.6454315),
      mapCanvas = document.getElementById('ralnc_map'),
      mapOptions = {
        center: mapCenter,
        zoom: 13,
        scrollwheel: false,
        draggable: true,
        disableDefaultUI: true,
        styles: [{
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            { hue: '#ffff00' },
            { saturation: 30 },
            { lightness: 10 }
          ]
        }],
        mapTypeId: google.maps.MapTypeId.ROADMAP
      },
      map = new google.maps.Map(mapCanvas, mapOptions),
      marker = new google.maps.Marker({
        position: mapCenter,
        map: map
      });
};
