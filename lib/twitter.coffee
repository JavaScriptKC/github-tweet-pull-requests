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

twitter = () ->
  this.twitter_api = new Twitter 
    consumer_key: process.env.TWITTER_CONSUMER_KEY
    consumer_secret: process.env.TWITTER_CONSUMER_SECRET
    access_token: process.env.TWITTER_ACCESS_TOKEN
    access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET
  
  tweet: (message, callback) -> 
    this.twitter_api.updateStatus message, (data) ->
      return callback data if data.statusCode? and data.statusCode != 200
      callback null 

module.exports = new twitter