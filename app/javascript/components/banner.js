import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Experience the best yurts in the world"],
    typeSpeed: 80,
    backSpeed: 25,
    loop: true
  });
}

export { loadDynamicBannerText };
