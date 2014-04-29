fs           = require "fs"
path         = require "path"
location     = path.join(__dirname, "../", "./modules")

config = [{
  "packagePath": "architect-logger",
  "transports" : {
    "console" : {
      "colorize": true,
      "level": "verbose",
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
