$(document).on 'turbolinks:load', () ->
  $("#user_password_confirmation").bind "input", check_password_confirmation

check_password_confirmation = ->
  password = $("#user_password").val()
  password_confirmation = $("#user_password_confirmation").val()

  if password_confirmation.length == 0
    $(".octicon-alert").addClass('hide')
    $(".octicon-check").addClass('hide')
    return

  if password_confirmation != password
    $(".octicon-alert").removeClass('hide')
    $(".octicon-check").addClass('hide')

  if password_confirmation == password
    $(".octicon-alert").addClass('hide')
    $(".octicon-check").removeClass('hide')
