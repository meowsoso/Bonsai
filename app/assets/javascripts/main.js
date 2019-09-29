console.log("run");
jQuery(document).ready(function($) {
  // set canvas background
  const bg = document.querySelector("canvas");
  bg.width = window.innerWidth;
  bg.height = window.innerHeight;

  // generate raindrop in different location
  const randomRain = function(rain) {
    console.log("hello");
    var posx = (Math.random() * ($(document).width() * 0.95)).toFixed();
    // var posy = (Math.random() * ($(document).height() * 0.1)).toFixed();
    $("div.raindrop")
      .clone()
      .css({
        "z-index": "-1",
        left: posx + "px",
        top: "0px"
      })
      .addClass(`${rain}`)
      .removeClass("raindrop")
      .appendTo("body");
  };

  // trigger rain effect
  const rainEffect = function(divClass, speed) {
    for (let i = 0; i < 60; i++) {
      randomRain(divClass);
    }
    anime({
      targets: `div.${divClass}`,
      translateY: window.innerHeight,
      easing: "easeInOutSine",
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
  const lightningPath = function(startX, startY) {
    let array = [`M${startX} ${startY}`];
    console.log(array);
    let positionY = startY;
    while (positionY <= 800) {
      array.push(
        `L${getRandomInt(
          startX - 120,
          startX + 120
        )} ${(positionY += getRandomInt(0, 100))}`
      );
    }
    console.log(array.join(" "));
    return array.join("  ");
  };

  // create a lightning from sky
  const createLight = function(posX, posY) {
    let newEl = $(".anim svg g path").clone();
    newEl
      .attr("d", `${lightningPath(posX, posY)}`)
      .addClass("thunder")
      .appendTo(".anim svg g");
    $("canvas#background").toggleClass("thunderBackground");
    anime({
      targets: "path.thunder",
      strokeDashoffset: [anime.setDashoffset, 0],
      duration: 1200,
      easing: "easeInOutSine",
      endDelay: 300
    });

    setTimeout(function() {
      $(".anim svg g path.thunder").remove();
      $("canvas#background").toggleClass("thunderBackground");
    }, 1600);
  };

  // create white clouds
  const createCloud = function(positionX, positionY) {
    $("div.cloud")
      .clone()
      .css({
        visibility: "visible",
        left: positionX + "px",
        top: positionY + "px"
      })
      .addClass("cloud1")
      .removeClass("cloud")
      .appendTo("body");
  };

  // clouds floating
  function moveClouds() {
    anime({
      targets: "div.cloud1",
      translateX: function() {
        return anime.random(-400, 400);
      },
      easing: "easeInOutQuad",
      duration: 20000,
      complete: moveClouds,
      autoplay: true
    });
  }

  // create white clouds
  const sunnyCloud = function(positionX, positionY) {
    $(".centered-clouds>li").css("background-color", "rgb(230, 230, 230)");
    $("div.cloud")
      .clone()
      .delay(1500)
      .css({
        visibility: "visible",
        left: positionX + "px",
        top: positionY + "px"
      })
      .addClass("cloud1")
      .removeClass("cloud")
      .appendTo("body");
  };

  // create pedals
  const createPedal = function(num) {
    for (let i = 0; i < num; i++) {
      $("div.pedal")
        .clone()
        .addClass("pedal1")
        .removeClass("pedal")
        .appendTo("body");
    }
  };

  // create pedals and fly around
  const fallSakura = function() {
    createPedal(30);
    anime({
      targets: "div.pedal1",
      translateX: function() {
        return anime.random(-2000, 0);
      },
      translateY: 800,
      rotate: 360,
      loop: true,
      easing: "easeInOutQuad",
      duration: 7000,
      delay: anime.stagger(300)
    });
  };

  // move fire when clicked
  if ($("div.angry").length > 0) {
    $("div.fire")
      .css("visibility", "visible")
      .appendTo("div.angry");
    $("div.fire").on("click", function() {
      $(this).css({
        top: `${getRandomInt(0, 100)}%`,
        left: `${getRandomInt(0, 100)}%`
      });
    });
  }

  // show message when click tree

  const width = window.innerWidth;

  // storm scenario
  if (gon.score > 6) {
    $("canvas#background").addClass("storm");

    createCloud(getRandomInt(0, width), 170);
    createCloud(getRandomInt(0, width), 200);
    createCloud(getRandomInt(0, width), 220);
    createCloud(getRandomInt(0, width), 230);
    createCloud(getRandomInt(0, width), 190);
    createCloud(getRandomInt(0, width), 170);
    createCloud(getRandomInt(0, width), 160);
    createCloud(getRandomInt(0, width), 190);
    createCloud(getRandomInt(0, width), 250);
    createCloud(getRandomInt(0, width), 160);
    createCloud(getRandomInt(0, width), 190);
    createCloud(getRandomInt(0, width), 250);
    moveClouds();

    rainEffect("rain", 65);
    rainEffect("rain2", 40);
    rainEffect("rain3", 50);
    rainEffect("rain3", 30);

    // create lightning and change background display
    $(window).click(function(e) {
      const relativeX = e.screenX;
      const relativeY = e.clientY - window.innerHeight * 0.4;
      createLight(relativeX, relativeY);
    });
    // sun rise
  } else if (gon.score > 4) {
    $("canvas#background").addClass("sunriseBg");
    $("div.sun").addClass("sunrise");
    sunnyCloud(getRandomInt(0, width), 250);
    sunnyCloud(getRandomInt(0, width), 200);
    moveClouds();
  } else {
    $("canvas#background").addClass("blossom"); // cherry blossom
    $("div.sun").addClass("sunNoon");
    $("div.pedal").css("visibility", "visible");
    sunnyCloud(getRandomInt(0, width), 250);
    sunnyCloud(getRandomInt(0, width), 200);
    moveClouds();

    $("div.pedal").on("click", function() {
      if ($("div.pedal1").length > 0) {
        $("div.pedal1").remove();
      } else {
        fallSakura();
      }
    });
  }
});
