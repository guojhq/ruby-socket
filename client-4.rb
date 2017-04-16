require 'rubygems'
require 'SocketIO'

#
# !bam! this won't work without node socket... this is only for node socket (and still doesnt work btw)
#

conn_str = "http://localhost:3003/"
# conn_str = "http://staging-node.operaevent.co/socket.io"

client = SocketIO.connect(conn_str) do
  before_start do
    on_message {|message| puts "incoming message: #{message}"}
    on_event('news') { |data| puts data.first} # data is an array fo things.
  end

end
