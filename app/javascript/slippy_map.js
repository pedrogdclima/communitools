
let map;
let marker;
let latlngField;

function initializeMap() {
  console.log("slippy-map, turbo:render");

  const MapContainer = document.querySelector('.map');
  if (!MapContainer) return;

  if (MapContainer.id == 'edit-map') {
    setupEditMap();
  } else {
    setupDisplayMap();
  }
}

function setupEditMap() {
  latlngField = document.querySelector('#user_latlng');

  marker = L.marker();

  let initialCoord = latlngField.value;
  
  if (initialCoord) {
    // "43.6686, -79.3248"
    map = L.map('edit-map').setView(initialCoord.split(', '), 11.5);
    setMarker(initialCoord.split(', '));
  } else {
    map = L.map('edit-map').setView([43.6529148, -79.3853107], 11.5);
  }

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);

  map.on('click', onMapClick);
}

function setupDisplayMap() {
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

function parseLatlng(number) {
  return number.toFixed(4);
}

function onMapClick(event) {
  setMarker(event.latlng);
  
  let location = [event.latlng.lat, event.latlng.lng].map(parseLatlng);
  latlngField.value = location.join(', ');
}

document.addEventListener('turbo:render', initializeMap);
document.addEventListener('turbo:before-render', () => {
  console.log("slippy-map, turbo:before-render");
  if (map) {
    map.remove();
    map = null;
  }
});
initializeMap();
