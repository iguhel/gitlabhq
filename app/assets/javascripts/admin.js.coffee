class @Admin
  constructor: ->
    $('input#user_force_random_password').on 'change', (elem) ->
      elems = $('#user_password, #user_password_confirmation')

      if $(@).attr 'checked'
        elems.val('').attr 'disabled', true
      else
        elems.removeAttr 'disabled'

    $('body').on 'click', '.js-toggle-colors-link', (e) ->
      e.preventDefault()
      $('.js-toggle-colors-container').toggle()

    $('input#broadcast_message_color').on 'input', ->
      previewColor = $(@).val()
      $('div.broadcast-message-preview').css('background-color', previewColor)

    $('input#broadcast_message_font').on 'input', ->
      previewColor = $(@).val()
      $('div.broadcast-message-preview').css('color', previewColor)

    $('textarea#broadcast_message_message').on 'input', ->
      previewMessage = $(@).val()
      previewMessage = "Your message here" if previewMessage.trim() == ''
      $('div.broadcast-message-preview span').text(previewMessage)

    $('.log-tabs a').click (e) ->
      e.preventDefault()
      $(this).tab('show')

    $('.log-bottom').click (e) ->
      e.preventDefault()
      visible_log = $(".file-content:visible")
      visible_log.animate({ scrollTop: visible_log.find('ol').height() }, "fast")

    modal = $('.change-owner-holder')

    $('.change-owner-link').bind "click", (e) ->
      e.preventDefault()
      $(this).hide()
      modal.show()

    $('.change-owner-cancel-link').bind "click", (e) ->
      e.preventDefault()
      modal.hide()
      $('.change-owner-link').show()

    $('li.project_member').bind 'ajax:success', ->
      Turbolinks.visit(location.href)

    $('li.group_member').bind 'ajax:success', ->
      Turbolinks.visit(location.href)
