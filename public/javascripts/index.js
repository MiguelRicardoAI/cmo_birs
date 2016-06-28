function hide(element, index, array) {
  if (index > 0) {
    slides[index].setAttribute('style', 'opacity:0;');
  }
}

var carousel = document.getElementById("carousel"),
  slides = carousel.getElementsByTagName('li'),
  counter = 0,
  liList = Array.prototype.slice.call(slides);

setInterval(function() {
  slides[counter].setAttribute('style', 'opacity:1;');
  counter++;

  if (counter == slides.length) {
    counter = 0;
    setTimeout(function() {
      liList.forEach(hide);
    }, 8000); // setTimeout
  }
}, 8000); // setInterval


