vows = require 'vows'
assert = require 'assert'
parser = require '../lib/pull-request-hook-parser'
messages =
  closed: require '../samples/pull-request-hook-closed'

vows.describe('Pull request hook').addBatch(

  'when an empty hook message is received':
    topic: () -> parser.parse()

    'it returns status 400 Bad Request': (result) ->
      assert.equal result.status, 400

    'it has a failure message': (result) ->
      assert.notEqual result.message, undefined

  'when an invalid hook message is received':
    topic: () -> parser.parse({})

    'it returns status 400 Bad Request': (result) ->
      assert.equal result.status, 400

    'it has a failure message': (result) ->
      assert.notEqual result.message, undefined

  'when a pull request closed message is received':
    topic: () -> parser.parse(messages.closed)

    'it returns status 200 OK': (result) ->
      assert.equal result.status, 200

    'it has a message to tweet': (result) ->
      assert.notEqual result.message, undefined

).export module