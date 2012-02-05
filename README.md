#Overview

A web service that listens for a webhook from github when a pull request is modified.

The service tweets a nicely formatted message, calling for comments on the pull request.

#Configure Twitter API

Visit http://developer.twitter.com/ and set up an application with read-write permissions to the handle that will tweet pull requests. Once set up, install the provided api keys in your environment variables.

    TWITTER_CONSUMER_KEY
    TWITTER_CONSUMER_SECRET
    TWITTER_ACCESS_TOKEN
    TWITTER_ACCESS_TOKEN_SECRET
    
_UNIX_

    export KEY=VALUE
    
_WINDOWS_

    set KEY=VALUE

_HEROKU_

    heroku config:add KEY=VALUE
    heroku config:remove KEY
