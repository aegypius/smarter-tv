(require('dotenv')).load();

global.pkg       = require('../package.json');
global.chai      = require('chai');
global.should    = chai.should();
global.expect    = chai.expect;
global.request   = require('supertest');
global.casual    = require('casual');
global.debug     = require('debug')(pkg.name + '.test');
global.app       = require('../index');

// Disable HTTP logger
global.app.disable('logger');
