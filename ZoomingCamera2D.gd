class_name ZoomingCamera2D
extends Camera2D

# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
export var zoom_factor := 0.75
# Duration of the zoom's tween animation.
export var zoom_duration := 0.25

var current_zoom
# The camera's target zoom level.
var _zoom_level := 1.0 

# We store a reference to the scene's tween node.
onready var tween: Tween = $Tween
onready var max_zoom = zoom.x 
onready var min_zoom = (max_zoom) * zoom_factor


func zoom_in(new_offset):
	transition_camera(Vector2(min_zoom, min_zoom), new_offset)


func zoom_out(new_offset):
	transition_camera(Vector2(max_zoom, max_zoom), new_offset)


func transition_camera(new_zoom, new_offset):
	if new_zoom != current_zoom:
		current_zoom = new_zoom
		$Tween.interpolate_property(self, "zoom", get_zoom(), current_zoom, zoom_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_property(self, "offset", get_offset(), new_offset, zoom_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
