# require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'ws://localhost:8080'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  puts! 'opened'
  ws.send 'hello!!!'
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  puts! 'error'
  p e
end

# loop do
#   ws.send STDIN.gets.strip
# end
