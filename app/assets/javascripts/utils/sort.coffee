$(document).on 'turbolinks:load', () ->
  $(".sort-by-title").bind "click", sortRowsByTitle

sortRowsByTitle = ->
  sortedRows = []
  tbody = $(".table > tbody")
  rows = tbody.children()
  for row in rows
    sortedRows.push(row)
  arrowUp = $('.octicon-arrow-up')
  arrowDown = $('.octicon-arrow-down')
  if arrowUp.hasClass("hide")
    sortedRows.sort(sortAsc)
    arrowUp.removeClass("hide")
    arrowDown.addClass("hide")
  else
    sortedRows.sort(sortDesc)
    arrowUp.addClass("hide")
    arrowDown.removeClass("hide")
  tbody.empty()
  tbody.append(sortedRows)

sortAsc = (row1, row2) ->
  title1 = $(row1).find('td').eq(1).text()
  title2 = $(row2).find('td').eq(1).text()
  return -1 if title1 > title2
  return 1 if title1 < title2
  return 0

sortDesc = (row1, row2) ->
  title1 = $(row1).find('td').eq(1).text()
  title2 = $(row2).find('td').eq(1).text()
  return -1 if title1 < title2
  return 1 if title1 > title2
  return 0

