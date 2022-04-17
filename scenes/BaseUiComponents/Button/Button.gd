extends Button

onready var hoverStyleBox = get_stylebox("hover")
onready var pressedStyleBox = get_stylebox("pressed")
onready var normalStyleBox = get_stylebox("normal")

func _ready():
	self_modulate = normalStyleBox.bg_color

func _on_Button_button_down():
	self_modulate = pressedStyleBox.bg_color

func _on_Button_button_up():
	self_modulate = normalStyleBox.bg_color

func _on_Button_mouse_entered():
	self_modulate = hoverStyleBox.bg_color

func _on_Button_mouse_exited():
	self_modulate = normalStyleBox.bg_color
