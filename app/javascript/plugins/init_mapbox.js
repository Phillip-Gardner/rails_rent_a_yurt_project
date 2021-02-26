import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/elizaplowden/cklkvfp771udy17qnl7purtig',


    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((markers) => {
      const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

      const element = document.createElement('div');
      element.className = 'markers';
      element.style.backgroundImage = `url('${markers.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '19px';
      element.style.height = '25px';


      new mapboxgl.Marker(element)
        .setLngLat([ markers.lng, markers.lat ])
        .setPopup(popup)
        .addTo(map);
    });
   fitMapToMarkers(map, markers);
  }
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 13, duration: 0 });
};



export { initMapbox };

