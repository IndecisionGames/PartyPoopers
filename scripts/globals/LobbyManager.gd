extends Node

signal name_accepted
signal name_rejected

func _ready():
	WsManager.connect("data_received", self, '_on_data')

func _on_data(data):
	match data.message:
		"accept_name":
			_handle_name_accepted()
		"reject_name":
			_handle_name_rejected()


### Outgoing
func check_name(user_name):
	WsManager.send_data("check_name", {"name": user_name})

func get_lobbylist():
	WsManager.send_data("lobby_list")


### Incoming
func _handle_name_accepted():
	emit_signal("name_accepted")

func _handle_name_rejected():
	emit_signal("name_rejected")



