$ ->

  $('span.underlined').bind 'click', ->
    $('.list-param').animate({height: '350px'}, 300, ->
      $('.list').show()
    )

  $('.el').hover(
    ->
      like = $(@).children('.like')
      like.css('background', 'rgba(0,0,0,0.85)')
    ->
      like = $(@).children('.like')
      like.css('background', 'rgba(0,0,0,0.7)')
  )