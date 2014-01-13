$ ->
  $(document).bind 'click', ->
    hideFormErrors()

  $('.order-call').bind 'click', ->

    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').bind 'click', ->
      hide_order_form()

    show_order_form()
    false



  $('.send-order').bind 'click', ->
    name = $(@).parent().find('input[name=username]')
    if name.val().length < 2
      name.css 'border', '1px solid red'
      return false

    phone = $(@).parent().find('input[name=phone]')
    if phone.val().length < 7
      phone.css 'border', '1px solid red'
      return false

    $.post '/orders.json', {'order[username]': name.val(), 'order[phone]': phone.val()}, (data) =>
    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').bind 'click', ->
      hide_thank_you()

#    reachGoal $(@).attr('goal')


    console.log 'asdasdasdasdasd'

    if $(@).hasClass 'inline-form'
      show_thank_you_with_overlay()
    else
      show_thank_you()

    false


  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()
    false



  $(".submit").bind 'click', ->
    $.post '/orders.json', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>
      if data.status == 'ok'
        $('.order-form .success').show 'blind'


  $('.el').bind 'click', ->
    $('.modal-overlay').bind 'click', ->
      hide_subscribe_form()

    show_subscribe_form()




window.hideFormErrors = ->
  $('input').attr 'style', ''

window.show_order_form = ->
  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-dialog').css('bottom', '-300px')
    $('.modal-dialog').css('left', '50%')
    $('.modal-dialog').show()
    $('.modal-dialog').animate({'bottom': '50%'}, 500)
  )

window.hide_order_form = ->
  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()
  )

window.show_thank_you_with_overlay = ->

  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500
  )


window.show_thank_you = ->

  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()

    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate {'right': '50%'}, 500

#    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
#      $('.modal-overlay').hide()
  )

window.hide_thank_you = ->
  $('input').val ''
  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()


window.show_subscribe_form = ->
  $('.modal-overlay').show(
  $('.modal-overlay').animate({'opacity': '0.8'}, 100, ->

    $('.modal-subscribe').css('right', '-500px')
    $('.modal-subscribe').css('top', '50%')
    $('.modal-subscribe').show()
    $('.modal-subscribe').animate {'right': '50%'}, 300
  )

window.hide_subscribe_form = ->

  $('.modal-subscribe').animate {'top': '-2000px'}, 200, ->
    $('.modal-subscribe').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 50, ->
      $('.modal-overlay').hide()


window.reachGoal = (goal) ->
  yaCounter22645732.reachGoal(goal)