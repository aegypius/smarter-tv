module.exports = (options, imports, register) ->
  http     = imports.http
  Router   = imports.router
  routes   = new Router()

  routes
    .get '/:id', (req, res, next) ->
      res.send { id: req.params.id, firstname: "James", lastname: "Bond" }
    .put '/:id', (req, res, next) ->
      res.send { firstname: "James", lastname: "Bond" }
    .delete '/:id', (req, res, next) ->
      res.send {}
    .post '/', (req, res, next) ->
      res.send {}, 201

  http.use "/profile", routes

  register null, {
    "routes" : routes
  }
