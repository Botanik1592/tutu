$(document).ready(function() {
  $('.new_wagon').change(function() {
    var wagon_type;

    wagon_type = $(this).find('#wagon_type').val();

    if (wagon_type == 'CoupeWagon') {
      $('.sv').hide();
      $('.plac').hide();
      $('.sid').hide();
      $('.coupe').show();
    }
    if (wagon_type == 'EconomyWagon') {
      $('.coupe').hide();
      $('.sv').hide();
      $('.sid').hide();
      $('.plac').show();
    }
    if (wagon_type == 'VipWagon') {
      $('.coupe').hide();
      $('.plac').hide();
      $('.sid').hide();
      $('.sv').show();
    }
    if (wagon_type == 'SeatsWagon') {
      $('.coupe').hide();
      $('.sv').hide();
      $('.plac').hide();
      $('.sid').show();
    }
  });

})
