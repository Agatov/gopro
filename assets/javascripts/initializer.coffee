$ ->

  $('span.underlined').bind 'click', ->
    $('.list-param').animate({height: '350px'}, 300, ->
      $('.list').show()
    )