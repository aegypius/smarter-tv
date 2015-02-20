/**
 * @jsx React.DOM
 */

var React     = require('react');
var Router    = require('react-router-component');
var Locations = Router.Locations;
var Location  = Router.Location;

var App = React.createClass({
    render: function() {
        return (
              <html>
                <head lang="en">
                    <meta charSet="UTF-8"/>
                    <title>React App</title>
                    <link rel="stylesheet" href="/stylesheets/style.css"/>
                </head>
                <body>
                    <div id="main">
                        <Locations path={this.props.path}>
                        </Locations>
                    </div>
                    <script type="text/javascript" src="/scripts/react/bundle.js"></script>
                </body>
               </html>
        )
    }
});

module.exports=App;
