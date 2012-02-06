Twitter = require 'twitter'

do () ->
  warnings = []
  warnings.push 'TWITTER_CONSUMER_KEY' if !process.env.TWITTER_CONSUMER_KEY
  warnings.push 'TWITTER_CONSUMER_SECRET' if !process.env.TWITTER_CONSUMER_SECRET
  warnings.push 'TWITTER_ACCESS_TOKEN' if !process.env.TWITTER_ACCESS_TOKEN
  warnings.push 'TWITTER_ACCESS_TOKEN_SECRET' if !process.env.TWITTER_ACCESS_TOKEN_SECRET

  if warnings.length > 0
    console.warn "WARNING: Your twitter API environment variables are not configured."
    warnings.forEach (w) ->
      console.warn "\t" + w

default_options = 
  consumer_key: process.env.TWITTER_CONSUMER_KEY
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET
  access_token_key: process.env.TWITTER_ACCESS_TOKEN
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET 

twitter = (options = default_options) ->
  this.options = options

  tweet: (message, callback) =>
    twitter = new Twitter this.options
    console.log 'Updating twitter status...'

    twitter.updateStatus message, (data) ->
      console.log 'Update result: '
      console.log data

      return callback data if data.statusCode? and data.statusCode != 200
      callback null 

module.exports = twitter