{Router} = require "express"
router   = new Router

router
  .get "/", (req, res)->
    res.json [{}]
  .post "/", (req, res)->
    res.json {}
  .get "/:id", (req, res)->
    res.json id: req.params.id
  .delete "/:id", (req, res)->
    res.json id: req.params.id, action: "delete"

module.exports = router
