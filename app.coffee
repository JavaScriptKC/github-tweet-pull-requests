express = require 'express'
app = express.createServer()
port = process.env.PORT || 3000
path = require 'path'
stylus = require 'stylus'
site = require './controllers/site'
hooks = require './controllers/hooks'

app.configure 'development', () ->
  app.use stylus.middleware { src: path.join(__dirname, 'public') }
  app.use express.logger { format: ':method :url' }
  app.use express.static path.join(__dirname, 'public')

app.configure 'production', () ->
  app.use stylus.middleware { src: path.join(__dirname, 'public'), compress: true }
  app.use express.logger { format: ':method :url' }
  app.use express.static path.join(__dirname, 'public')

app.use express.bodyParser()
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

app.get '/', site.index
app.post '/hook/pull-request', hooks.pullRequest

app.listen port

console.log 'server listening on port ' + port
