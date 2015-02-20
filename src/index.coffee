express                    = require "express"
logger                     = require "morgan"
bodyParser                 = require "body-parser"
compression                = require "compression"
methodOverride             = require "method-override"
errorhandler               = require "errorhandler"
path                       = require "path"
oauth2                     = require "oauth2-server"
url                        = require "url"
path                       = require "path"
app                        = express()

(require "node-jsx").install extension: ".jsx"
ReactAsync = require "react-async"
App        = require "./react/App.jsx"


{library, profile, signup} = require "./routes"

app.use methodOverride "_method"
app.use bodyParser.urlencoded extended: true
app.use bodyParser.json()
app.use compression()





# Logging requests
app.enable 'logger'
app.use logger "tiny", skip: ()-> app.disabled 'logger'

if app.get('env') isnt 'production'
  app.use errorhandler()
else
  app.set "x-powered-by", false

# view engine setup
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

# OAuth2 layer
app.oauth2 = oauth2 {
  model : require "./models/oauth2"
  grants: [
    'password'
    'refresh_token'
  ]
  debug: false
}

# User Profile management
app.use signup
app.use '/profile',              app.oauth2.authorise(), profile

# OAuth2 Authorization
app.all '/oauth/token',          app.oauth2.grant()

# API
app.use "/library/movies",   app.oauth2.authorise(), library.movies
app.use "/library/tv-shows", app.oauth2.authorise(), library.shows

app.get "*", (req, res)->
  path = (url.parse req.url).pathname
  ReactAsync.renderToStringAsync App path: path, (err, html)->
    res.send "<!DOCTYPE html>#{html}"

# Error Handlers
app.use app.oauth2.errorHandler()

# Catch 404 and forward to error handler
app.use (req, res, next)->
  err = new Error "Not Found"
  err.status = 404
  next err

if app.get "env" isnt "production"
  app.use (err, req, res, next)->
    res.status err.status or 500
    res.render "error", {
      message: err.message
      error: err
    }

app.use (err, req, res, next)->
  res.status err.status or 500
  res.render "error", {
    message: err.message
    error: {}
  }

module.exports = app
