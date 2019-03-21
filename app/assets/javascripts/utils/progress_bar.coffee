document.addEventListener 'turbolinks:load', () ->
  setProgress()

setProgress = ->
  cur_val = Number(document.querySelector("#cur-value").dataset.curValue) - 1
  max_val = Number(document.querySelector("#max-value").dataset.maxValue)
  progress = cur_val * 100 / max_val
  document.querySelector(".progress-bar").style.width = progress + "%"



