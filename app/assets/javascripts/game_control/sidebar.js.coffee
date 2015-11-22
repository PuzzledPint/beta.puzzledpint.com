namespace 'gamecontrol.sidebar', (exports) ->
  exports.init =(controller, action) ->
    $ ->
      $("##{controller}, ##{controller}-#{action}").addClass('active')
