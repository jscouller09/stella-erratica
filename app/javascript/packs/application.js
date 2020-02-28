import "bootstrap";

// for space map
import "leaflet"
import "leaflet/dist/leaflet.css"

var map = L.map('map', {
    crs: L.CRS.Simple,
    minZoom: -5
});
var bounds = [[-26.5,-25], [1021.5,1023]];
var image = L.imageOverlay('uqm_map_full.png', bounds).addTo(map);
console.log(map);
console.log(bounds);
console.log(image);
map.fitBounds(bounds);
