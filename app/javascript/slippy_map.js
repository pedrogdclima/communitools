
let map;
let marker = L.marker();
let latlngField;

document.addEventListener('DOMContentLoaded', () => {
  latlngField = document.querySelector('#user_latlng');
  let initialCoord = latlngField.value;
  
  if (initialCoord) {
    // "43.6686, -79.3248"
    map = L.map('map').setView(initialCoord.split(', '), 11.5);
    setMarker(initialCoord.split(', '));
  } else {
    map = L.map('map').setView([43.6529148, -79.3853107], 11.5);
  }

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);

  map.on('click', onMapClick);
});

function setMarker(latlng) {
  marker
    .setLatLng(latlng)
    .addTo(map);
}

function parseLatlng(number) {
  return number.toFixed(4);
}

function onMapClick(event) {
  setMarker(event.latlng);
  
  let location = [event.latlng.lat, event.latlng.lng].map(parseLatlng);
  latlngField.value = location.join(', ');
}