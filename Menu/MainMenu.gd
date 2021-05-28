extends Control

var horizontal_size setget set_horizontal_size
var vertical_size setget set_vertical_size
var evolution_speed setget set_evolution_speed


func _ready():
	$HorizontalSizeLabel/HorizontalSize.connect("value_changed", self, "set_horizontal_size")
	$VerticalSizeLabel/VerticalSize.connect("value_changed", self, "set_vertical_size")
	$EvolutionSpeedLabel/EvolutionSpeed.connect("value_changed", self, "set_evolution_speed")


func set_horizontal_size(new_val):
	horizontal_size = new_val


func set_vertical_size(new_val):
	vertical_size = new_val


func set_evolution_speed(new_val):
	evolution_speed = new_val
