express = require 'express'
app = express.createServer()
port = process.env.PORT || 3000
path = require 'path'
stylus = require 'stylus'
parser = require './lib/pull-request-hook-parser'

app.configure 'development', () ->
  app.use stylus.middleware { src: path.join(__dirname, 'public') }
  app.use express.logger { format: ':method :url' }
  app.use express.static path.join(__dirname, 'public')

app.configure 'production', () ->
  app.use stylus.middleware { src: path.join(__dirname, 'public'), compress: true }
  app.use express.logger { format: ':method :url' }
  app.use express.static path.join(__dirname, 'public')

app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

app.get '/', (request, response) ->
  response.render 'about'

app.post '/hook/pull-request', (request, response) ->
  result = parser.parse request.body
  response.send result


app.listen port

console.log 'server listening on port ' + port
