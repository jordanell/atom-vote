class Comm
  get: (url, data = {}, success, error) ->
    @send url, "GET", data, success, error

  post: (url, data = {}, success, error) ->
    @send url, "POST", data, success, error

  patch: (url, data = {}, success, error) ->
    @send url, "PATCH", data, success, error

  delete: (url, data = {}, success, error) ->
    @send url, "DELETE", data, success, error

  # Wrapper around the jquery ajax call
  send: (url, method = "GET", data = {}, success, error) ->
    data.format = 'json'

    setup =
      url: url
      method: method
      beforeSend: (xhr) =>
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      data: data
      success: success
      error: error

    $.ajax setup

initializeComm = ->
  window.Comm = new Comm $(this)

$(document).ready(initializeComm)
$(document).on('page:load', initializeComm)
