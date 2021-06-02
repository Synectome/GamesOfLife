extends Node2D

onready var PLAYER = preload("res://Player.tscn")

func _ready():
#	print('were ready')
	var player = PLAYER.instance()
	self.add_child(player)
	var Map : TileMap = get_node("TileMap")
	var width = Map.width * 8
	var height = Map.height * 8
#	print(width)
#	print(height)
	player.set_position(Vector2(width, height))


#func load_settings():
#	var config = ConfigFile.new()
#	var err = config.load("user://settings.cfg")
#	if err == OK: # If not, something went wrong with the file loading
#		config.get_value("Map", "length", height)
#		config.get_value("Map", "width", width)
#		config.get_value("Algorithm", "scope", scope)
#		config.get_value("Speed", "speed", speed)
