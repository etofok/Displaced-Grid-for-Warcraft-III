   const images = [
      'assets/gallery/wc3-01.jpg',
      'assets/gallery/wc3-02.jpg',
      'assets/gallery/wc3-03.jpg',
      'assets/gallery/wc3-04.jpg',
      'assets/gallery/wc3-05.jpg',
      'assets/gallery/wc3-06.jpg',
      'assets/gallery/wc3-07.jpg',
      'assets/gallery/wc3-08.jpg',
      'assets/gallery/wc3-09.jpg'
    ];

let currentImageIndex = 0;

function changeImage(direction) {
  currentImageIndex += direction;
  if (currentImageIndex < 0) {
    currentImageIndex = images.length - 1;
  } else if (currentImageIndex >= images.length) {
    currentImageIndex = 0;
  }
  document.getElementById('mainImage').src = images[currentImageIndex];
  updateThumbnails();
}

function createThumbnails() {
  const thumbnailsContainer = document.getElementById('thumbnails');

  if (!thumbnailsContainer) {
    return
  }

  images.forEach((image, index) => {
    const thumbnail = document.createElement('div');
    thumbnail.classList.add('button-slide-thumbnail');
    thumbnail.style.backgroundImage = `url(${image})`;
    thumbnail.addEventListener('click', () => {
      currentImageIndex = index;
      document.getElementById('mainImage').src = images[currentImageIndex]; // Ensure main image src update
      updateThumbnails();
    });
    thumbnailsContainer.appendChild(thumbnail);
  });
  updateThumbnails();
}

function updateThumbnails() {
  const thumbnails = document.querySelectorAll('.button-slide-thumbnail');

  if (!thumbnails) {
    return
  }
  
  thumbnails.forEach((thumbnail, index) => {
    if (index === currentImageIndex) {
      thumbnail.classList.add('active');
    } else {
      thumbnail.classList.remove('active');
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  createThumbnails();
  document.getElementById('mainImage').src = images[0]; // Load the first image on page load
});