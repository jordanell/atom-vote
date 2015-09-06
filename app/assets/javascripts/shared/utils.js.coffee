class Utils
  # These are taken from the default Google Charts colors
  colors: ['#3366cc','#dc3912','#ff9900',
            '#109618','#990099','#0099c6',
            '#dd4477','#66aa00']

initializeUtils = ->
  window.Utils = new Utils $(this)

$(document).ready(initializeUtils)
$(document).on('page:load', initializeUtils)
