
let map = null;
let marker;
let latlngField;

function initializeMap() {
  console.log("display-map, turbo:load");
  const MapContainer = document.getElementById('display-map');
  if (!MapContainer) return;

  latlngField = document.querySelector('.latlng');

  marker = L.marker();

  let initialCoord = latlngField.textContent;
  
  if (initialCoord) {
    map = L.map('display-map').setView(initialCoord.split(', '), 11.5);
    setMarker(initialCoord.split(', '));
  } else {
    map = L.map('display-map').setView([43.6529148, -79.3853107], 11.5);
  }

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);
}

function setMarker(latlng) {
  marker
    .setLatLng(latlng)
    .addTo(map);
}

document.addEventListener('turbo:load', initializeMap);
document.addEventListener('turbo:before-render', () => {
  console.log("display-map, turbo:before-render");
  if (map) {
    map.remove();
    map = null;
  }
});
