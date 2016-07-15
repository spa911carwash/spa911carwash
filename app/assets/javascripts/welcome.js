function hide_alert() {
  $('.alert-position').fadeOut(300, function() {
    $(this).remove();
  });
};

setTimeout(hide_alert, 3000);