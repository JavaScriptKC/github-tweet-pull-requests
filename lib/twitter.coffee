Twitter = require 'twitter'

do () ->  
  console.warn 'Twitter consumer key is not configured.' if !process.env.TWITTER_CONSUMER_KEY
  console.warn 'Twitter consumer secret is not configured.' if !process.env.TWITTER_CONSUMER_SECRET
  console.warn 'Twitter access token is not configured.' if !process.env.TWITTER_ACCESS_TOKEN
  console.warn 'Twitter access token secret is not configured.' if !process.env.TWITTER_ACCESS_TOKEN_SECRET

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