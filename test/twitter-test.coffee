vows = require 'vows'
assert = require 'assert'
Twitter = require '../lib/twitter'
messages = 
  success: require '../samples/tweet-success'
  unauthorized: require '../samples/tweet-unauthorized'

vows.describe('Twitter').addBatch(
  'when a tweet is made successfully':
    topic: () -> 
      twitter = new Twitter()

      twitter._getApi = () -> 
        updateStatus: (message, cb) ->
          cb(messages.success)
          return

      twitter.tweet 'message', this.callback
      return

    'it should invoke the callback with null': (err, result) ->
      assert.isNull err
      assert.isNotNull result

  'when the tweet fails because it was unauthorized':
    topic: () ->
      twitter = new Twitter()

      twitter._getApi = () ->
        updateStatus: (message, cb) ->
          cb(messages.unauthorized)
          return
      
      twitter.tweet 'message', this.callback
      return
          
    'it should invoke the callback with the error.': (err, result) ->
      assert.isNotNull err
      assert.equal err.statusCode, 401
      assert.isNull result
).export module