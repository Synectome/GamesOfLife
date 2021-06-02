extends Control

export (int)var horizontal_size setget _on_HorizontalSize_value_changed
export (int)var vertical_size setget _on_VerticalSize_value_changed
export (int)var evolution_speed setget _on_EvolutionSpeed_value_changed
export (int)var scope setget _on_Scope_value_changed

onready var horizontal_label: Label = $VBoxSliders/VBoxContainer/HorizontalSizeLabel
onready var vertical_label: Label = $VBoxSliders/VBoxContainer2/VerticalSizeLabel
onready var speed_label: Label = $VBoxSliders/VBoxContainer/EvolutionSpeedLabel
onready var scope_label: Label = $VBoxSliders/VBoxContainer/ScopeLabel


func _on_HorizontalSize_value_changed(value):
	horizontal_size = int(value)
	horizontal_label.text = "Horizontal Size : " + str(horizontal_size)


func _on_VerticalSize_value_changed(value):
	vertical_size = int(value)
	vertical_label.text = "this"
	vertical_label.text = "Vertical Size : " + str(vertical_size)


func _on_EvolutionSpeed_value_changed(value):
	evolution_speed = int(value)
#	speed_label.text = "Evolution Speed : " + str(evolution_speed)


func _on_Scope_value_changed(value):
	scope = int(value)
#	scope_label.text = "Scope : " + str(scope)


func _on_Start_pressed():
	save_menu_selections(vertical_size, horizontal_size, evolution_speed, scope)
	get_tree().change_scene("res://Level.tscn")


func save_menu_selections(length: int, width: int, speed: int, scope: int):
	# Sections are:
		# Map, Algorithm, Speed
	var config = ConfigFile.new()
	print("We are bou'ta save deez")
	print(length)
	print(width)
	print(speed)
	print(scope)
	config.set_value("Map", "length", length)
	config.set_value("Map", "width", width)
	config.set_value("Algorithm", "scope", scope)
	config.set_value("Speed", "speed", speed)

	config.save("user://settings.cfg")



