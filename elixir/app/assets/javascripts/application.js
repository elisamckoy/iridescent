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
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  function colorGradient(){
    colorString = "";
    for (var i = 0; i < 500; ++i){
      r = Math.sin(.3 * i + 0) * (50) + 200;
      g = Math.sin(.4 * i + 2) * (50) + 200;
      b = Math.sin(.3 * i + 4) * (50) + 200;
      div ='<div class="color" style="background-color:rgb({r},{g},{b});"></div>';
      div = div.replace("{r}",Math.floor(r));
      div = div.replace("{g}",Math.floor(g));
      div = div.replace("{b}",Math.floor(b));
      colorString += div;
    }
    return colorString ;
  }
  $('#rainbowish').html(colorGradient());
});
