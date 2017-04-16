
Let's have ruby connect to a node socket.io server, these are examples to do that.

Node websocket implementation (as opposed to node socket.io implementation) works fine with ruby. Steps to reproduce:
 node server-ws.js
 bundle exec ruby client-ws.rb

Node socket.io implementation also works fine. Steps to reproduce: CONNECT TO http://staging-node.operaevent.co # or
  node server-socketio.js
  bundle exec ruby client-socketio.rb

