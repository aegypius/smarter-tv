{Router} = require "express"
router   = new Router
shows    = require "../../models/show"
Show     = shows.Show

router
  .get "/search", (req, res)->
    res.send req.query

  .get "/", (req, res)->
    res.json [{}]
  .post "/", (req, res)->
    res.json {}
  .get "/:id", (req, res)->
    res.json id: req.params.id
  .delete "/:id", (req, res)->
    res.json id: req.params.id, action: "delete"


module.exports = router
