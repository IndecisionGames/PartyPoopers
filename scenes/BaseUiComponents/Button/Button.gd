extends Button

onready var hoverStyleBox = get_stylebox("hover")
onready var pressedStyleBox = get_stylebox("pressed")
onready var normalStyleBox = get_stylebox("normal")

var initialPosition;
var down = false

func _ready():
	self_modulate = normalStyleBox.bg_color
	initialPosition = rect_position

func _on_Button_button_down():
	self_modulate = pressedStyleBox.bg_color
	rect_position += Vector2(0, 3)
	down = true

func _on_Button_button_up():
	self_modulate = normalStyleBox.bg_color
	rect_position = initialPosition
	down = false

func _on_Button_mouse_entered():
	if !down:
		self_modulate = hoverStyleBox.bg_color
	else:
		self_modulate = pressedStyleBox.bg_color

func _on_Button_mouse_exited():
	if !down:
		self_modulate = normalStyleBox.bg_color
	else:
		self_modulate = pressedStyleBox.bg_color
