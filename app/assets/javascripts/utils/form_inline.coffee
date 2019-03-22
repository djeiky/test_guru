$(document).on 'turbolinks:load', () ->
  $(".form-inline-link").on("click", formInlineLinkHandler)
  $errors = $(".resource-errors")
  if $errors
    $testId = $errors.data("resource-id")
    formInlineHandler($testId)

formInlineLinkHandler = (event) ->
  event.preventDefault()
  $testId = $(this).data("test-id")
  formInlineHandler($testId)

formInlineHandler = (testId) ->
  $link = $(".form-inline-link[data-test-id=" + testId + "]")
  $testTitle = $(".test-title[data-test-id=" + testId + "]")
  $formInline = $(".form-inline[data-test-id=" + testId + "]")

  $testTitle.toggle()
  $formInline.toggle()

  if $formInline.is(":visible")
    $link.html("Cancel")
  else
    $link.html("Edit")


