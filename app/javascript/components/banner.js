import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const typed = document.getElementById('banner-typed-text');
  if (typed) {
    new Typed('#banner-typed-text', {
      strings: ["Experience the best yurts in the world"],
      typeSpeed: 80,
      backSpeed: 25,
      loop: true
    });
  }

}

export { loadDynamicBannerText };
