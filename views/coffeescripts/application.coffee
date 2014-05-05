$(document).ready ->
  $('#solutions-title').after('<ul id="pager" />')

  $('#slideshow').cycle
    fx: 'scrollHorz'
    speed: 500
    timeout: 4000
    pager: '#pager'
    pause: 1
    pagerAnchorBuilder: (index, slide) ->
      return '<li>' + (index + 1) + '</li>'
    pauseOnPagerHover: 1
