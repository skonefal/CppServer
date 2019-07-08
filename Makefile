.PHONY: build

address = "127.0.0.1"
port = 8080
#port = 9090
threads = 6  #Count of working threads. Default: %default");
# clients = 100 #Count of working clients. Default: %default");
clients = 50 #Count of working clients. Default: %default");
messages = 1000 #Count of messages to send at the same time. Default: %default");
seconds = 10 #Count of seconds to benchmarking. Default: %default");
# size = 81192 #Single message size. Default: %default");
size = 200 #Single message size. Default: %default");
# location = "/websockify/8080"
location = "/"


build: 
	(cd build && ./unix.sh)

run-server: build
	./temp/cppserver-performance-ws_echo_server

run-client: build
	./temp/cppserver-performance-ws_echo_client -s $(size) -c $(clients) -z $(seconds) -m $(messages) -a $(address) -p $(port) -l $(location)
