
console.log('Hello from slippy map');

let map;
let marker = L.marker();
let latlngField;
document.addEventListener('DOMContentLoaded', () => {
  map = L.map('map').setView([43.6529148, -79.3853107], 11.5);
  latlngField = document.querySelector('#user_latlng');

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);
  map.on('click', onMapClick);
});
function parseLatlng(number) {
  return number.toFixed(4);
}
function onMapClick(event) {
  console.log('click');
  marker
    .setLatLng(event.latlng)
    .addTo(map);
  
  let location = [event.latlng.lat, event.latlng.lng].map(parseLatlng);
  latlngField.value = location.join(', ');
}