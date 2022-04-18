extends Node

onready var version_text = find_node("FooterCredits")
onready var version_file = "res://version.txt"
onready var status_text = find_node("Status")
onready var name_text = find_node("Name")

func _ready():
	WsManager.connect("status_change", self, "on_connection_status_change")
	LobbyManager.connect("name_accepted", self, "on_name_accepted")
	LobbyManager.connect("name_rejected", self, "on_name_rejected")

	_set_version()

func on_connection_status_change(status):
	if status:
		status_text.text = "Connected"
		status_text.add_color_override("font_color", Color("#0cd29e"))
		status_text.self_modulate = Color("#0cd29e")
	else:
		set_warning_text("Failed to connect")

func set_warning_text(warning_text):
	status_text.text = warning_text
	status_text.add_color_override("font_color", Color("#ef476f"))
	status_text.self_modulate = Color("#ef476f")

func _on_Connect_pressed():
	var user_name = name_text.text
	LobbyManager.check_name(user_name)

func on_name_accepted():
	_hide_main_menu()
	_start_loading()

func on_name_rejected():
	set_warning_text("Name unavailable - try again")

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

func _start_loading():
	$Control/Loading.show()

func _stop_loading():
	$Control/Loading.hide()

func _show_lobbylist():
	pass

func _hide_lobbylist():
	pass

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
