class Utils

  colors: [
            '#FFCC66',  # yellow
            '#7C7AEE',  # purple
            '#61DAFB',  # theme blue
            '#66BB6A',  # green
            '#F44336',  # red
          ]

  # Returns an array of attractive random colors
  #   hue: red, orange, yellow, green, blue, purple, pink or monochrome
  #   luminosity: bright, light or dark
  #   count: 1 - N
  #
  # for random just leave a param out
  # e.g. randomColor()
  generateColorPalette: (luminosity = 'bright', hue = 'green', count = 10) ->
    randomColor {
      luminosity: luminosity,
      hue: hue,
      count: count
    }

initializeUtils = ->
  window.Utils = new Utils $(this)

$(document).ready(initializeUtils)
$(document).on('page:load', initializeUtils)
