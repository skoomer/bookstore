$(document).on('turbolinks:load', function() {
    $('#checkBox').click(function() {
        if ($(this).is(':checked')) {
            $('.cancel-account-js').removeAttr('disabled');
        } else {
            $('.cancel-account-js').attr('disabled', 'disabled');
        }
    })

    $('.tabs ul li').click(function () {
        var tabid = $(this).attr('rel');
        $(this).parents('.tabs').find('.active').removeClass('active');
        $('.tabbody').hide();
        $('#' + tabid).show();
        $(this).addClass('active');

        return false;
    });
})
