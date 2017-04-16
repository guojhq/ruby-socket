require 'rubygems'
require 'SocketIO'

# conn_str = "https://localhost:3001"
conn_str = "http://staging-node.operaevent.co/socket.io"

client = SocketIO.connect(conn_str) do
  before_start do
    on_message {|message| puts "incoming message: #{message}"}
    on_event('news') { |data| puts data.first} # data is an array fo things.
  end

end
