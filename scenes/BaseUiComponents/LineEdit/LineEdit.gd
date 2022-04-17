extends LineEdit

onready var normalStyleBox = get_stylebox("normal")

func _ready():
	self_modulate = normalStyleBox.bg_color
