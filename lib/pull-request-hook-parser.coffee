parser =
  parse: (message) ->
    if isValid message then actOn message else error message

isValid = (message) ->
  true if message? and message.action? and message.repository?.name? and message.sender?.login? and message.pull_request?.html_url?

actOn = (message) ->
  status: 200
  message: "#{message.sender.login} #{message.action} a pull request on #{message.repository.name}: #{message.pull_request.html_url}"

error = () ->
  status: 400
  message: 'Invalid message.'

module.exports = parser