(function() {
  $(document).ready(function() {
    $('#solutions-title').after('<ul id="pager" />');
    return $('#slideshow').cycle({
      fx: 'scrollHorz',
      speed: 500,
      timeout: 4000,
      pager: '#pager',
      pause: 1,
      pagerAnchorBuilder: function(index, slide) {
        return '<li>' + (index + 1) + '</li>';
      },
      pauseOnPagerHover: 1
    });
  });
}).call(this);
