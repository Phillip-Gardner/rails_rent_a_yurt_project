

//   const navbar = document.querySelector('.navbar');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('.navbar-lewagon-scrolled');
//       } else {
//         navbar.classList.remove('.navbar-lewagon-scrolled');
//       }
//     });
//   }
// }

const initUpdateNavbarOnScroll = () => {
  $(window).scroll(function () {
  if ($(window).scrollTop() >= 80) {
  $('.navbar').css({'box-shadow':'0 0px 0px 0 rgba(0, 0, 0, 10)', 'background':'transparent'});
  } else {
  $('.navbar').css('background','white',);
  }
  });
}

// const initUpdateNavbarOnScroll = () => {

//       $(window).scroll(function () {
//         var $nav = $(".navbar-lewagon");
//         $nav.toggleClass('scrolled'), $(this).scrollTop() > 50;
//       });
//   }


export { initUpdateNavbarOnScroll };
