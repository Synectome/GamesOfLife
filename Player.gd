extends Node2D

onready var tile_map: TileMap = $"../TileMap"

func _input(event):
	if event.is_action_pressed("ui_up"):
		self.position = self.position + Vector2(0, -16)
		print("move on up")
	if event.is_action_pressed("ui_left"):
		self.position = self.position + Vector2(-16, 0)
	if event.is_action_pressed("ui_right"):
		self.position = self.position + Vector2(16, 0)
	if event.is_action_pressed("ui_down"):
		self.position = self.position + Vector2(0, 16)
	if event.is_action_pressed("hide"):
		# Show/Hide the player
		pass
	if event.is_action_pressed("ui_accept"):
		# Change tile.. same as click
		var pos = ((self.position + Vector2(8, 8))/tile_map.TILE_SIZE).floor()
		tile_map.set_cellv(pos, 1-tile_map.get_cellv(pos))
		

