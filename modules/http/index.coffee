module.exports = (options, imports, register) ->
  logger  = require "morgan"
  express = require "express"
  path    = require "path"
  server  = express()

  root = process.env.HTTP_ROOT or path.join(__dirname, '../../public')
  port = process.env.PORT or 3333

  server.use express.static root
  server.use logger {
    stream: {
      write: (message) ->
        imports.logger.verbose message.trim() if message
    }
  }

  server.listen port, (err, callback) ->
    imports.logger.info "Http server started at http://0.0.0.0:#{port}"
    callback() if callback

  register null, {
    onDestruct: (callback) ->
      server.close(callback);
      imports.logger.debug "Http server stopped"
    ,
    http:   server
    router: express.Router
  }
