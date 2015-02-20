{Collection} = require "waterline"

module.exports =
  Collection.extend {
    identity: "movie"
    connection: "disk"
    attributes: {
      title: "string"
      slug: "string"
      year: {
        type: "integer"
        in: [1890..2025]
      }
    }
  }
