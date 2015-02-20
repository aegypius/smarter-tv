{Collection} = require "waterline"

module.exports =
  Collection.extend {
    identity: "person"
    attributes: {
      name: "string"
    }
  }
