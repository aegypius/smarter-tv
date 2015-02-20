{Router} = require "express"
router   = new Router

user =
  create: (req, res)->
    res.send('User created')

router
  .get  "/signup", (req, res)->
    res.send "Display registration form"
  .post "/profile", user.create

module.exports = router
