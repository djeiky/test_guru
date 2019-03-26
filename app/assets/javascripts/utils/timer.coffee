$(document).on 'turbolinks:load', () ->
  $timer = $("#timer")
  if $timer.length
    startTimer()

startTimer =  ->
  setInterval =>
    $timer = $("#timer")
    time_left = $timer.data("timeLeft")
    testPassageId = $timer.data("testPassageId")
    time_left--
    if time_left <= 0
      window.location = "/test_passages/" + testPassageId + "/result"
    else
      $timer.data("timeLeft", time_left)
      $timer.text(Math.floor(time_left))
  , 1000
