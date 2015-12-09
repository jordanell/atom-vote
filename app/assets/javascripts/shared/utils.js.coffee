class Utils

  # These colors should be the same as their respective declaration in _variables.scss
  colors: [
            '#FFCC66',  # yellow
            '#7C7AEE',  # purple
            '#61DAFB',  # theme blue
            '#66BB6A',  # green
            '#F44336',  # red
          ]

  getColors: ->
    return @colors

 # TODO: this should be equivalent to darken(barColor, default-contrast (10%))
  darken: (color, offset = 10) ->
    return "black"

initializeUtils = ->
  window.Utils = new Utils $(this)

$(document).ready(initializeUtils)
$(document).on('page:load', initializeUtils)
