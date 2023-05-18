$("#gm").attr("src", "https://maps.googleapis.com/maps/api/js?key=AIzaSyCybN4vCYTR72Vt_3uPpK2PNAucp6FGq3k&callback=initMap");
var MyPlacesWithDistance = {};
var distince_km;
var distination_name;
var price;
var c_lant;
var c_lang;
var d_lant;
var d_lang;
console.log("hello Naim");

function initMap() {
    
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8,
        center: { lat: 37.7749, lng: -122.4194 }
    });
    if (navigator.geolocation) {
        console.log("hello");
        navigator.geolocation.getCurrentPosition(function (position) {
            const pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var markerA = new google.maps.Marker({
                position: pos,
                map: map,
                title: "Your current location"
            });
            // current location and assigen it to varibles
            c_lant = pos.lat;
            c_lang = pos.lng;
           

            let previousMarker;
            google.maps.event.addListener(map, "click", function (event) {
                if (previousMarker) {
                    previousMarker.setMap(null);
                }
                var markerB = new google.maps.Marker({
                    position: event.latLng,
                    map: map,
                    title: "Selected location"
                });
                previousMarker = markerB;
                var distance = getDistance(markerA, markerB);
             
                distince_km = distance;
                document.getElementById('msg').innerHTML = " Distance : " + `<strong>` + distance + `</strong>` + ` KM`;
            });
            map.setCenter(pos);
           
            ////////////////////////////////////////////
            $('#myInput').keyup(function (e) {
                if (e.keyCode == 40 || e.keyCode == 38 || e.keyCode == 13) {
                    return;
                }
                document.getElementById('msg').innerHTML = "";
                var inputt = $("#myInput").val();
                var placesmenu = document.getElementById("places");
                const options = {
                    method: 'GET',
                    accept: 'application/json',
                };
                MyPlacesWithDistance = [];
                var PlaceName = "";
                fetch('https://api.mymappi.com/v2/places/autocomplete?apikey=5fc88605-585c-4066-a585-b21665dbf2c0&q=' + inputt + '&source_lat=' + pos.lat + '&source_lon=' + pos.lng + '&auto_focus=true', options)
                    .then(response => response.json())
                    .then(function (response) {
                       // console.log(response.data);
                        placesmenu.innerHTML = "";
                        response.data.forEach(function (element) {
                            placesmenu.innerHTML += `<option value="${element.display_name}"><strong>${element.display_name}</strong></option>`
                            MyPlacesWithDistance[element.display_name] = element.distance_to_source;
                           
                          /*  d_lant = element.lat;
                            d_lang = element.lon;
                            console.log(element.lat);
                            console.log(element.lon);*/
                           /* var url1 = 'https://api.mymappi.com/v2/geocoding/direct?apikey=5fc88605-585c-4066-a585-b21665dbf2c0&q=' + element.display_name + '&source_lat=' + pos.lat + '&source_lon=' + pos.lng;
                            const options1 = {
                                method: 'GET',
                                headers: {
                                    'X-RapidAPI-Key': '80e99d87e6mshbdcd9fafec69812p13e1f4jsn04bcfc6f658b',
                                    'X-RapidAPI-Host': 'mymappi.p.rapidapi.com'
                                }
                            };

                            try {
                                fetch(url1, options1)
                                    .then(response1 => response1.json())
                                    .then(function (response1) {
                                        console.log(response1);
                                    })
                            }
                            catch (error) {
                                console.error(error);
                            }*/




                        });
                        if (response.status === "OK") {
                            PlaceName = $("#places").find(":selected").val();
                            distance = MyPlacesWithDistance[PlaceName];
                            
                            if (distance != null) {
                                distince_km = distance;
                                distination_name = PlaceName;
                                
                                document.getElementById('msg').innerHTML = " Distance : " + `<strong>` + distance + `</strong>` + ` KM`;
                            }
                        }
                    }).catch(err => console.error(err));


                PlaceName = $("#places").find(":selected").val();
                console.log(PlaceName);
                $('#places').change(function (e) {
                    PlaceName = $("#places").find(":selected").val();
                    distance = MyPlacesWithDistance[PlaceName];
                   
                    if (distance != null) {
                        distince_km = distance;
                        distination_name = PlaceName;
                        document.getElementById('msg').innerHTML = " Distance : " + `<strong>` + distance + `</strong>` + ` KM`;
                    }
                });
                if (inputt === "") {
                    distance = "";
                    document.getElementById('msg').innerHTML = "";
                }
            });
        });
    }
}
function getDistance(markerA, markerB) {
    const R = 6371; // Radius of the Earth in kilometers
    const lat1 = markerA.getPosition().lat();
    const lng1 = markerA.getPosition().lng();
    const lat2 = markerB.getPosition().lat();
    const lng2 = markerB.getPosition().lng();
    c_lant = lat1;
    c_lang = lng1;
    d_lant = lat2;
    d_lang = lng2;
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLng = (lng2 - lng1) * Math.PI / 180;
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
        Math.sin(dLng / 2) * Math.sin(dLng / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distance = R * c;
    /*document.getElementById('cust_lant').innerHTML = pos.lat;
    document.getElementById('cust_lang').innerHTML = pos.lng;
    document.getElementById('dest_lant').innerHTML = element.lat;
    document.getElementById('dest_lang').innerHTML = element.lon;*/
    return distance.toFixed(1); // Returns distance in kilometers
}





   

