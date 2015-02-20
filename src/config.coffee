if process.env.NODE_ENV isnt "production"
  (require "dotenv").load()

module.exports =
  tvdb:
    apiKey: process.env.TVDB_KEY
