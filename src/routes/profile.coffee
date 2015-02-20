{Router} = require "express"
router   = new Router

user =
  update: (req, res)->
    res.send('User updated')
  show  : (req, res)->
    res.send('Show user profile')
  remove: (req, res)->
    res.send('User deleted')

router
  .get    "/", user.show
  .patch  "/", user.update
  .put    "/", user.update
  .delete "/", user.remove


module.exports = router
