document.addEventListener('DOMContentLoaded', () => {
  const navbar = document.querySelector('.navbar');

  function handleScroll() {
    if (window.scrollY > 500) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  }

  window.addEventListener('scroll', handleScroll);

  // Initial check in case the user loads the page scrolled down
  handleScroll();
});