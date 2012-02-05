parser = require '../lib/pull-request-hook-parser'
twitter = require '../lib/twitter'

hooks =
  pullRequest: (request, response) ->
    result = parser.parse request.body.payload
    console.log typeof request.body.payload
    console.log result
    return response.send result.message, result.status if result.status is 400

    twitter.tweet result.message, (error) ->
      return response.send error, 500 if error
      response.send 204

module.exports = hooks