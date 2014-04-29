exports.config =

  paths:
    watched: [
      'core',
      'modules',
      'app',
      'test'
    ]

  files:
    javascripts:
      joinTo:
        'app.js': /^(app|bower_components)/

    stylesheets:
      joinTo:
        'app.css': /^(app|bower_components)/

  server:
    path: 'core/index'
