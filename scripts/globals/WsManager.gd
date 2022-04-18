extends Node

var websocket_url = "ws://127.0.0.1:8080"

var _client = WebSocketClient.new()

var is_connected = false

signal data_received(data)
signal status_change(status)

func _ready():
	_client.connect("connection_closed", self, "_closed")
	_client.connect("connection_error", self, "_closed")
	_client.connect("connection_established", self, "_connected")
	_client.connect("data_received", self, "_on_data")

	var err = _client.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		is_connected = false
		emit_signal("status_change", false)
		set_process(false)

func send_data(op, data={}):
	data["message"] = op
	_client.get_peer(1).put_packet(JSON.print(data).to_utf8())

func _closed(clean = false):
	print("Server connection closed")
	is_connected = false
	emit_signal("status_change", false)
	set_process(false)

func _connected(proto = ""):
	print("Connected to server")
	is_connected = true
	emit_signal("status_change", true)

func _on_data():
	var data = JSON.parse(_client.get_peer(1).get_packet().get_string_from_utf8()).result
	print("Received: ",  data)
	emit_signal("data_received", data)

func _process(delta):
	_client.poll()
