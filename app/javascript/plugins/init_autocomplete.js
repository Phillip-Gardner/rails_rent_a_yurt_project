import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('yurt-location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
