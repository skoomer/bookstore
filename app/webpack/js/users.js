$(document).on('turbolinks:load', function() {
  $('#check_box').click(function() {
    $('.cancel-account-js').attr('disabled', !$(this).is(':checked'));
    }
  )

    $('.tabs ul li').click(function () {
        var tabid = $(this).attr('rel');
        $(this).parents('.tabs').find('.active').removeClass('active');
        $('.tabbody').hide();
        $('#' + tabid).show();
        $(this).addClass('active');

        return false;
    });
})
