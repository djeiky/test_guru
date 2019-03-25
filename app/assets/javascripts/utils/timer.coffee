$(document).on 'turbolinks:load', () ->
  $timer = $("#timer")
  if $timer
    startTimer()

startTimer =  ->
  setInterval =>
    timer = $("#timer")
    time_left = timer.text()
    testPassageId = timer.data("testPassageId")
    arr = time_left.split(":")
    h = arr[0]
    m = arr[1]
    s = arr[2]
    if s <= 0
      if m <= 0
        if h <= 0
          window.location = "/test_passages/" + testPassageId + "/result"
        h--
        m = 60
        h = "0" + h if h < 10
      m--
      s = 59
      m = "0" + m if m < 10
    else
      s--
      s = "0" + s if s < 10
    timer.text(h + ":" + m + ":" + s)
  , 1000
