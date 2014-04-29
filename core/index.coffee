architect  = require "architect"
config     = architect.loadConfig (require "path").join(__dirname, "config")
app        = architect.createApp config, (err, app)->
  console.error err if err;

module.exports.startServer = (port, root, callback)->


