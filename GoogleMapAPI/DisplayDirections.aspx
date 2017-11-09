<%@ page language="C#" autoeventwireup="true" codebehind="DisplayDirections.aspx.cs" inherits="GoogleMapAPI.Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }
    </style>
</head>
<body>
    <!-- Load Map Here! -->
    <div id="map" style="margin: auto; width: 100%; border: 5px solid #112D4E; padding: 0px;"></div>
    <div id="directionsPanel" style="float:left;width:100%;height:100%"></div>
    <script>
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 7,
                center: { lat: -1.1670025, lng: 36.9673423 }
            });
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directionsPanel'));

            calculateAndDisplayRoute(directionsService, directionsDisplay);
            
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            directionsService.route({
                origin: new google.maps.LatLng(-1.1670025, 36.9673423),
                destination: new google.maps.LatLng(-1.2208749, 36.8034573),
                travelMode: 'DRIVING'
            }, function (response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=initMap">
    </script>
</body>
</html>
