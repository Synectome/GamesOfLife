extends TileMap


const TILE_SIZE = 16

export(int) var width
export(int) var height
export(int) var speed = 5

var playing = false
var time = 0
onready var cam: Camera2D = $ZoomingCamera2D


var temp_field 

func _ready():
	var width_px = width * TILE_SIZE
	var height_px = height * TILE_SIZE
	
	cam.position = Vector2(width_px, height_px)/2
	cam.zoom = Vector2(width_px, height_px) / Vector2(1024, 768)

	temp_field = []
	for x in range(width):
		var temp = []
		for y in range(height):
			set_cell(x,y,0)
			temp.append(0)
		temp_field.append(temp)


func _input(event):
	if event.is_action_pressed("toggle_play"):
		playing = !playing
	if event.is_action_pressed("click"):
		var pos = (get_local_mouse_position()/TILE_SIZE).floor()
		set_cellv(pos, 1-get_cellv(pos))
	if event.is_action_pressed("Zoom_Out"):
		print("zoom in")
		cam.zoom_in(Vector2(0,1))
	if event.is_action_pressed("Zoom_In"):
		print("zoom out")
		cam.zoom_out(Vector2(0,0))
	if event.is_action_pressed("minmaxScreen"):
		OS.window_fullscreen = !OS.window_fullscreen


func _process(delta):
	time += speed * delta
	if time > 5:
		update_field()
		time = 0


func update_field():
	if !playing:
		return
	
	#adjust state in temp_field
	for x in range(width):
		for y in range(height):
			var live_neighbors = 0
			for x_off in [-2, -1, 0, 1, 2]:
				for y_off in [-2, -1, 0, 1, 2]:
					if (x_off != y_off) or x_off !=0:
						if get_cell(x+x_off, y+y_off) == 1:
							live_neighbors += 1
							
			if get_cell(x, y) == 1:
				if live_neighbors in [4,5,6]:
					temp_field[x][y] = 1
				else:
					temp_field[x][y] = 0
			else:
				if live_neighbors == 5 or live_neighbors == 6:
					temp_field[x][y] = 1
				else:
					temp_field[x][y] = 0
	
	#update the tile map
	for x in range(width):
		for y in range(height):
			set_cell(x, y, temp_field[x][y])
