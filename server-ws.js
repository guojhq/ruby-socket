var express = require('express');
var app = express();
var expressWs = require('express-ws')(app);

/* config */
var port = 3002;

app.use(function (req, res, next) {
  console.log('middleware');
  req.testing = 'testing';
  return next();
});

app.get('/', function(req, res, next){
  console.log('get route', req.testing);
  res.end();
});

app.ws('/', function(ws, req) {
  ws.on('message', function(msg) {
    console.log(msg);
  });
  console.log('socket', req.testing);
});

console.log('listening on', port);
app.listen(port);
