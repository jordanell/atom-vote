class Utils
  # These colors should be the same as their respective declaration
  # in _variables.scss
  colors: [
            '#FFCC66',  # yellow
            '#7C7AEE',  # purple
            '#61DAFB',  # theme blue
            '#C7F464',  # green
            '#FF6B6B',  # red
          ]

  getColors: ->
    return @colors

  selectText: (container) ->
    if document.selection
      range = document.body.createTextRange()
      range.moveToElementText document.getElementById(container.id)
      range.select()
    else if window.getSelection
      range = document.createRange()
      range.selectNode document.getElementById(container.id)
      window.getSelection().addRange(range)

  formatVotesCount: (num) ->
    num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")

initializeUtils = ->
  window.Utils = new Utils $(this)

$(document).ready(initializeUtils)
$(document).on('page:load', initializeUtils)
