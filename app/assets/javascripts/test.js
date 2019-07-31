console.log('run');
jQuery(document).ready(function($){

  // set canvas background
  const bg = document.querySelector('canvas');
  bg.width = window.innerWidth;
  bg.height = window.innerHeight;

  // generate raindrop in different location
  const randomRain = function (rain) {
    console.log('hello');
    var posx = (Math.random() * ($(document).width()*0.9)).toFixed();
    // var posy = (Math.random() * ($(document).height() * 0.1)).toFixed();
    $('div.raindrop').clone().css({
      'left': posx+'px',
      'top': '0px'
    }).addClass(`${ rain }`).removeClass('raindrop').appendTo('body');
  };

  // trigger rain effect
const rainEffect =function (divClass, speed) {

  for (let i = 0; i < 60; i++ ) {
    randomRain(divClass)
  };
    anime({
    targets: `div.${ divClass }`,
    translateY: 700,
    easing: 'easeInOutSine',
    delay: anime.stagger(speed),
    loop: true
  });
};

// get random int
function getRandomInt(min, max) {
  let mini = Math.ceil(min);
  let maxi = Math.floor(max);
  return Math.floor(Math.random() * (maxi - mini + 1)) + mini;
}
// generate random path values for lightning
const lightningPath = function (startX, startY) {
  let array = [`M${ startX } ${ startY }`];
  console.log(array)
  let positionY = startY;
  while (positionY <= 800) {
    array.push(`L${ getRandomInt(startX - 150, startX + 150)} ${ positionY += getRandomInt(0, 100)}`);
  } ;
  console.log(array.join(" "));
  return array.join("  ");
};

// create a lightning from sky
const createLight = function (posX, posY) {
  let newEl = $('.anim svg g path').clone()
// TODO: change lightning path dynamic
  newEl.attr("d", `${ lightningPath(posX, posY) }`).addClass('thunder').appendTo('.anim svg g');
  $('canvas#background').toggleClass('thunderBackground');
  anime({
    targets: 'path.thunder',
    strokeDashoffset: [anime.setDashoffset, 0],
    duration: 1200,
    easing: 'easeInOutSine',
    endDelay: 300,
  })

  setTimeout(function() {
    $('.anim svg g path.thunder').remove();
    $('canvas#background').toggleClass('thunderBackground');
  }, 1600);
};

// create white clouds
const createCloud = function (positionX, positionY) {
  $('div.cloud').clone().delay(1500).css({
    'visibility': 'visible',
    'left': positionX +'px',
    'top': positionY +'px'
  }).addClass('cloud1').removeClass('cloud').appendTo('body');
}

// clouds floating 
function moveClouds() {
  anime({
    targets: 'div.cloud1',
    translateX: function() {
      return anime.random(-400, 400);
    },
    easing: 'easeInOutQuad',
    duration: 20000,
    complete: moveClouds,
    autoplay: true
  });
};

// create white clouds 
const sunnyCloud = function (positionX, positionY) {
  $('.centered-clouds>li').css("background-color", "rgb(230, 230, 230)");
  $('div.cloud').clone().delay(1500).css({
    'visibility': 'visible',
    'left': positionX +'px',
    'top': positionY +'px'
  }).addClass('cloud1').removeClass('cloud').appendTo('body');
}

// create pedals
const createPedal = function (num) {
  for (let i = 0; i < num; i++) {
    $('div.pedal').clone().addClass('pedal1').removeClass('pedal').appendTo('body'); 
  }
}

// create pedals and fly around
const fallSakura = function () {
    createPedal(30);  
    anime({
    targets: 'div.pedal1',
    translateX: function() {
      return anime.random(-2000, 0);
    },
    translateY: 800,
    rotate: 360,
    loop: true,
    easing: 'easeInOutQuad',
    duration: 7000,
    delay: anime.stagger(300)
  });
}

// move fire when clicked 
if ($('div.angry').length > 0) {
  $('div.fire').css('visibility', 'visible').appendTo('div.angry')
  $('div.fire').on('click', function () {
    $(this).css({
      'top': `${getRandomInt(0, 100)}%`,
      'left': `${getRandomInt(0, 100)}%`
    })
  });
}

// storm scenario
if ( false ) {
  $('canvas#background').addClass('storm');
  createCloud(400, 170);
  createCloud(350, 100);
  createCloud(500, 120);
  createCloud(400, 170);
  createCloud(350, 100);
  createCloud(400, 170);
  createCloud(350, 100);
  createCloud(150, 100);
  createCloud(650, 150);  
  moveClouds();
  
  rainEffect('rain', 65);
  rainEffect('rain2', 40);
  rainEffect('rain3', 50);
  rainEffect('rain3', 30);

  // create lightning and change background display
$(window).click(function(e) {
  const relativeX = e.clientX;
  const relativeY = (e.pageY - $(e.target).offset().top);
createLight(relativeX, relativeY);
});
};
// sun rise
if ( false ) {
  $('canvas#background').addClass('sunriseBg');
  $('div.sun').addClass('sunrise');
}

// cherry blossom

if ( true ) {
  $('canvas#background').addClass('blossom');
  $('div.sun').addClass('sunNoon');
  $('div.pedal').css('visibility', 'visible');
  sunnyCloud(500, 120);
  sunnyCloud(800, 200);
  moveClouds();

  $('div.pedal').on('click', function() {
    if ($('div.pedal1').length > 0) {
      $('div.pedal1').remove();
    } else {
    fallSakura();
    }
  });
}

});