

I'm working on having ruby connect to a node socket.io server, these are examples that I'm using for that.

Node websocket implementation (as opposed to node socket.io implementation) works fine with ruby. Steps to reproduce:
 node server-ws.js
 bundle exec ruby client-ws.rb

Now on to socket.io...