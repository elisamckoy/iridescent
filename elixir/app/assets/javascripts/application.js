// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  function colorGradient(){
    colorString = "";
    for (var i = 0; i < 1000; ++i){
      //if no color is being added do this
      // r = Math.sin(.3 * i + 0) * (50) + 200;
      // g = Math.sin(.4 * i + 2) * (50) + 200;
      // b = Math.sin(.3 * i + 4) * (50) + 200;
      //if color is being added set r, g, b to users color
      r = parseInt($('.first').text());
      g = parseInt($('.second').text());
      b = parseInt($('.third').text());
   
      div ='<div class="color" style="background-color:rgba({r},{g},{b},' + i / 400 + ');"></div>';
      div = div.replace("{r}",Math.floor(r));
      div = div.replace("{g}",Math.floor(g));
      div = div.replace("{b}",Math.floor(b));
      colorString += div;
    }
    return colorString ;
  }

  $('#rainbowish').html(colorGradient());

  $(function () {
    var parent = $("#rainbowish");
    var divs = parent.children();
    while (divs.length) {
      parent.append(divs.splice(Math.floor(Math.random() * divs.length), 1)[0]);
    }
  });

  var rotateDivsBack = function() {
    var $removedDiv = $('#rainbowish').children().first().remove();
    $("#rainbowish").append($removedDiv);
  }

  var rotateDivsForward = function() {
    var $removedDiv = $('#rainbowish').children().last().remove();
    $("#rainbowish").prepend($removedDiv);
  }

    var back;
    var forward;
  $(document).on('click', function(){
    var clicks = $(this).data('clicks');

    if (clicks){
      clearInterval(forward);
      back = setInterval(function () {
        rotateDivsBack();
      }, 50 );

    } else {
      clearInterval(back);
      forward = setInterval(function () {
        rotateDivsForward();
      }, 50 );
    }
    $(this).data("clicks", !clicks);
  })

});

