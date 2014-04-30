module.exports = (options, imports, register) ->
  express = require "express"
  path    = require "path"
  server  = express()
  logger  = imports.logger

  root = process.env.HTTP_ROOT or path.join(__dirname, '../../public')
  port = process.env.PORT or 3333

  server.use express.static root
  server.use (require "morgan")({
    stream: {
      write: (message) ->
        logger.info message.trim() if message
    }
  })

  server.listen port, (err, callback) ->
    logger.debug "http listening on #{port}"
    callback() if callback

  register null, {
    onDestruct: (callback) ->
      server.close(callback);
      logger.debug "http stopped"
    ,
    http:   server
    router: express.Router
  }
