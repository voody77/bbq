

window.$ = window.jQuery = require('jquery');

require('@fancyapps/fancybox');
require('@fancyapps/fancybox/dist/jquery.fancybox.css');

$(document).ready(function() {
    $('.lightbox').each(function(i) {
        $(this).find('a > img').parent().attr('data-fancybox', 'group-' + i);
    });
});