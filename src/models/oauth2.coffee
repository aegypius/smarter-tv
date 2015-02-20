model = module.exports
util  = require "util"
redis = require "fakeredis"
db    = redis.createClient()

keys = {
  token:        "tokens:%s"
  client:       "clients:%s"
  refreshToken: "refreshTokens:%s"
  grantTypes:   "grantTypes:%s"
  user:         "users:%s"
}

model.getAccessToken   = (bearerToken, callback)->

  db.hgetall util.format keys.token, bearerToken, (err, token)->
    if err
      callback err
    unless token
      callback()
    else
      callback null, {
        accessToken: token.accessToken
        clientId: token.clientId
        expires: new Date token.expires if token.expires
        userId: token.userId
      }


model.getClient        = (clientId, clientSecret, callback)->
model.getRefreshToken  = (bearerToken, callback)->
model.grantTypeAllowed = (clientId, grantType, callback)->
model.saveAccessToken  = (accessToken, clientId, expires, user, callback)->
model.saveRefreshToken = (refreshToken, clientId, expires, user, callback)->
model.getUser          = (username, password, callback) ->
