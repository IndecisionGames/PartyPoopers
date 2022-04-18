extends Node

export var websocket_url = "ws://localhost:8080"

onready var version_text = find_node("FooterCredits")
onready var version_file = "res://version.txt"
onready var status = find_node("Status")

func _ready():
	LobbyManager.connect("room_joined", self, "on_room_joined")
	LobbyManager.connect("host_updated", self, "on_host_updated")
	LobbyManager.connect("game_started", self, "on_game_started")
	WsManager.connect("status_change", self, "on_connection_status_change")

	_set_version()
	WsManager.connect_to_ws(websocket_url)

func on_connection_status_change(status):
	if status:
		status.text = "Connected"
		status.add_color_override("font_color", Color("#0cd29e"))
		status.self_modulate = Color("#0cd29e")
	else:
		status.text = "Failed to connect"
		status.add_color_override("font_color", Color("#ef476f"))
		status.self_modulate = Color("#ef476f")

func _on_Create_pressed():
	LobbyManager.create_room()
	_hide_main_menu()
	_start_loading()

func on_room_joined(room):
	_stop_loading()
	_show_lobby()

func on_game_started():
	pass

func _show_main_menu():
	$Control/Logo.show()
	$Control/Status.show()
	$Control/FooterCredits.show()
	$Control/MainMenu.show()

func _hide_main_menu():
	$Control/Logo.hide()
	$Control/Status.hide()
	$Control/FooterCredits.hide()
	$Control/MainMenu.hide()

func _show_lobby():
	pass

func _hide_lobby():
	pass

func _start_loading():
	$Control/Loading.show()

func _stop_loading():
	$Control/Loading.hide()

# Use this if you want to disconnect every time this scene is closed
# func _exit_tree():
# _client.disconnect_from_host(1000, "manual scene quit")

func _set_version():
	var f = File.new()
	f.open(version_file, File.READ)
	var line = f.get_line()
	if len(str(line)) == 0:
		line = "Development"
	else:
		line = "Last updated: " + line
	version_text.text = "Indecision Games ©\n" + str(line)
	f.close()
