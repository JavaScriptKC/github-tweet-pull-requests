#Overview

A web service that listens for a webhook from github when a pull request is modified.

The service tweets a nicely formatted message, calling for comments on the pull request.

#Configure Twitter API

Visit http://developer.twitter.com/ and set up an application with read-write permissions to the handle that will tweet pull requests. Once set up, install the provided api keys in your environment variables.

_UNIX_

    export TWITTER_CONSUMER_KEY=<value>
    export TWITTER_CONSUMER_SECRET=<value>
    export TWITTER_ACCESS_TOKEN=<value>
    export TWITTER_ACCESS_TOKEN_SECRET=<value>

_WINDOWS_

    set TWITTER_CONSUMER_KEY=<value>
    set TWITTER_CONSUMER_SECRET=<value>
    set TWITTER_ACCESS_TOKEN=<value>
    set TWITTER_ACCESS_TOKEN_SECRET=<value>
