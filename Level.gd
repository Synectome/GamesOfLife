extends Node2D


onready var PLAYER = preload("res://Player.tscn")

func _ready():
#	print('were ready')
	var player = PLAYER.instance()
	self.add_child(player)
	var Map : TileMap = get_node("TileMap")
	var width = Map.width * 8
	var height = Map.height * 8
	print(width)
	print(height)
	player.set_position(Vector2(width, height))
