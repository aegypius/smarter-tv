{Collection} = require "waterline"
config       = require "../config"
tvdb         = new (require "node-tvdb")(config.tvdb.apiKey)

module.exports =

  Show: Collection.extend {
    identity: "show"
    connection: "disk"

    attributes: {
      title: "string"
      slug: "string"
      year: {
        type: "integer"
        in: [1890..2025]
      }
      seasons: {
        collection: 'season'
        via: "show"
      }
    }

    search: (title)->
      tvdb.getSeries title
        .then (response)->
          response
  }

  Season: Collection.extend {
    identity: "season"
    attributes: {
      number: "integer"
      show: {
        model: "show"
      }
      episodes: {
        collection: "episode"
        via: "season"
      }
    }
  }

  Episode: Collection.extend {
    identity: "episode"
    attribute: {
      number: "integer"
      title: "string"
      season: {
        model: "season"
      }
      firstAired: "date"
      collected: "boolean"
      watched:   "boolean"
    }
  }
