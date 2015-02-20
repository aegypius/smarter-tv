require('coffee-script/register');
var pkg = require('./package.json'),
    debug = require('debug')(pkg.name);

module.exports = app = require('./src');

if (require.main) {
  var port = process.env.PORT || 3333;

  app.listen(port, function (err) {
    debug('Server listening on port ' + port);
  });
}
