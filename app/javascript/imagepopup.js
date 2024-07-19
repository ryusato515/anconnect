document.addEventListener('turbo:load', function() {
  const triggerPopup = document.getElementById('triggerPopup');
  const imagePopup = document.getElementById('imagePopup');
  const popupImage = document.getElementById('popupImage');
  const closePopup = document.getElementById('closePopup');

  triggerPopup.addEventListener('click', function() {
    popupImage.src = this.src;
    imagePopup.classList.remove('hidden');
    imagePopup.classList.add('flex');
  });

  closePopup.addEventListener('click', function() {
    imagePopup.classList.add('hidden');
    imagePopup.classList.remove('flex');
  });

  imagePopup.addEventListener('click', function(e) {
    if (e.target === this) {
      imagePopup.classList.add('hidden');
      imagePopup.classList.remove('flex');
    }
  });
});