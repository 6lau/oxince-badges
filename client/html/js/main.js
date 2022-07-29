$(document).ready(async() => {
  window.addEventListener('message', (event) => {
    var data = event.data;

    if (!data || data.length <= 0)
      return;
    
    $('h1').text(data.title);
    $('p').text(data.message);
    $('img').attr('src', data.img);
    $('body').fadeIn(500);
    await Wait(5000);
    $('body').fadeOut(500);
  });
});

function Wait(delay) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(delay);
    }, delay);
  });
}