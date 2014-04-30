require "date-utils"

fs           = require "fs"
path         = require "path"
location     = path.join(__dirname, "../", "./modules")

config = [{
  "packagePath": "architect-logger",
  "transports" : {
    "console" : {
      "colorize": true,
      "level": "verbose",
      "timestamp": ()->
        new Date().toFormat('DD MMM HH24:MI:SS')
    }
  }
}]

# Scans modules path to find dependencies
modules = (fs.readdirSync location)
  .filter (entry)->
    stat = fs.statSync path.join(location, entry)
    return stat.isDirectory()
  .map (module)->
    return packagePath: "#{location}/#{module}"

module.exports = config.concat modules
