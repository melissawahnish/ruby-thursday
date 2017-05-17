import { fadeIn, fadeOut } from '../helpers/fades';

$(document).ready(function() {
  var modalBackground = document.getElementById('modal-background')

  $('#modal-link').on('click', function() {
    fadeIn(modalBackground, 333);
  });
  $('#modal-close').on('click', function() {
    fadeOut(modalBackground, 333);
  });
});