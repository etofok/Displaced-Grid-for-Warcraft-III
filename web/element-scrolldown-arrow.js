document.addEventListener('DOMContentLoaded', function() {

    /* section scroll */
    const downarrow1 = document.querySelector('.scrolldown-arrow');
    if (!downarrow1) {
        return
    }

    const scrollToLayout = document.getElementById('scroll-to-layout');
    if (!scrollToLayout) {
        return
    }

    downarrow1.addEventListener('click', () => {
      scrollToLayout.scrollIntoView({ behavior: 'smooth' });
    });

});

function scrollToSection(section) {
    section.scrollIntoView({ behavior: 'smooth' });
}