vows = require 'vows'
assert = require 'assert'
twitter = require '../lib/twitter.coffee'
messages =
  success: require '../samples/tweet-success'
  unauthorized: require '../samples/tweet-unauthorized'

stubUpdateStatus = (data) ->
  
  twitter.twitter_api = 
    updateStatus: (message, cb) ->
      cb data
  
  return twitter

vows.describe('Twitter').addBatch(

  'when a tweet is made successfully':
    topic: () -> 
      twitter = stubUpdateStatus messages.success
      twitter.tweet 'tweet', this.callback

    'it invokes the callback with no arguments': (err, result) ->
      assert.isNull err

  'when creating a tweet fails because of unauthorized':
    topic: () -> 
      twitter = stubUpdateStatus messages.unauthorized
      twitter.tweet 'tweet', this.callback  

    'it invokes the callback with the error': (err, result) ->
      assert.equal err.statusCode, 401
).export module