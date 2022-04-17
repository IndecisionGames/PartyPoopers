extends Control

#onready var viewport = get_viewport()
#
#var minimum_size = Vector2(1920, 1080)
#var scale_factor_x
#var scale_factor_y
#
#func _ready():
#	viewport.connect("size_changed", self, "window_resize")
#	scale_factor_y = minimum_size.y / OS.get_window_size().y
#	scale_factor_x = minimum_size.x / OS.get_window_size().x
#	window_resize()
#
#func window_resize():
#	var current_size = OS.get_window_size()
#	print(current_size)

#	var scale_factor = minimum_size.y/current_size.y
#	var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)
#
#	if new_size.y < minimum_size.y:
#		scale_factor = minimum_size.y/new_size.y
#		new_size = Vector2(new_size.x*scale_factor, minimum_size.y)
#	if new_size.x < minimum_size.x:
#		scale_factor = minimum_size.x/new_size.x
#		new_size = Vector2(minimum_size.x, new_size.y*scale_factor)

#	print(new_size)
#	viewport.set_size_override(true, new_size)
#	var new_size = Vector2(current_size.x * scale_factor_x, current_size.y * scale_factor_y)
#	print(new_size)
#	set_size(new_size)
