require 'rubygems'
require 'socket.io-client-simple'

##
## config
##

# port = 3003
# connstr = "http://localhost:#{port}"
connstr = "https://staging-node.operaevent.co"



socket = SocketIO::Client::Simple.connect connstr

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

## connect with parameter
# socket = SocketIO::Client::Simple.connect "http://localhost:#{port}", :foo => "bar"

socket.on :connect do
  socket.emit :room, '574dc7016e4801050d000002'
  puts "connect!!!"
end

socket.on :disconnect do
  puts "disconnected!!"
end

socket.on( :welcomeToRoom ) do |data|
  puts! data, 'got welcomeToRoom'
end

socket.on :chat do |data|
  puts "> " + data['msg']
end

socket.on :error do |err|
  p err
end

puts "please input and press Enter key"
loop do
  msg = STDIN.gets.strip
  next if msg.empty?
  socket.emit :chat, {:msg => msg, :at => Time.now}
end
