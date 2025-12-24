
let map;
let marker = L.marker();
let latlngField;

document.addEventListener('DOMContentLoaded', () => {
  latlngField = document.querySelector('.latlng');
  let initialCoord = latlngField.textContent;
  
  if (initialCoord) {
    map = L.map('map').setView(initialCoord.split(', '), 11.5);
    setMarker(initialCoord.split(', '));
  } else {
    map = L.map('map').setView([43.6529148, -79.3853107], 11.5);
  }

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);
});

function setMarker(latlng) {
  marker
    .setLatLng(latlng)
    .addTo(map);
}
