parser =
  parse: (message) ->
    if isValid message then actOn message else error message

isValid = (message) ->
  true if message? and message.action? and message.sender?.login? and message.pull_request?.url?

actOn = (message) ->
  status: 200
  message: 'test'

error = () ->
  status: 400
  message: 'Invalid message.'

module.exports = parser