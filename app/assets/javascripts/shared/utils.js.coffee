class Utils
  # These are taken from the default Google Charts colors
  colors: [
            '#FFCC66',  # yellow
            '#7C7AEE',  # purple
            '#61DAFB',  # theme blue
            '#66BB6A',  # green
            '#F44336',  # red
          ]

initializeUtils = ->
  window.Utils = new Utils $(this)

$(document).ready(initializeUtils)
$(document).on('page:load', initializeUtils)
