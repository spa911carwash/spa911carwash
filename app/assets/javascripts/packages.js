function hide_alert() {
  $('.alert-position').fadeOut(300, function() {
    $(this).remove();
  });
};