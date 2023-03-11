extends Control

@export var _tile_map_path: NodePath
@onready var _tile_map : TileMap = get_node(_tile_map_path)

const LEFT_TILE := Vector2i(1,0)
const MIDDLE_TILE := Vector2i(2,0)
const RIGHT_TILE := Vector2i(3,0)


func _create_platform(min_x, max_x, y):
	var x = min_x
	_tile_map.set_cell(0, Vector2i(x,y),0,LEFT_TILE)
	while x < max_x:
		x+=1
		_tile_map.set_cell(0, Vector2i(x,y),0,MIDDLE_TILE)
	_tile_map.set_cell(0, Vector2i(max_x,y),0,RIGHT_TILE)

#last_platform_coords
var lpc := Vector3i(29,35,21)
const X_BOUNDS := Vector2i(0,64)

@onready var last_processed_world_y : int = $World.position.y
var last_lpc : int = 0

func _update_platform_coordinates():
	lpc.z -= 3 + randi_range(0,2)
	var length := randi_range(2,7)
	var slide := randi_range(-3,3)*3
	lpc.x = lpc.x + slide
	lpc.y = lpc.y + slide
	var delta = length - (lpc.y-lpc.x)
	lpc.x -= delta/2
	lpc.y += delta/2
	lpc.x = clamp(lpc.x, X_BOUNDS.x, X_BOUNDS.y-1)
	lpc.y = clamp(lpc.y, X_BOUNDS.x+1, X_BOUNDS.y)

func _ready():
	_create_platform(lpc.x, lpc.y, lpc.z)
	for i in range(6):
		_update_platform_coordinates()
		_create_platform(lpc.x, lpc.y, lpc.z)
	last_lpc = lpc.z
	_update_platform_coordinates()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$World.position.y += 1
	if $World.position.y - last_processed_world_y > (lpc.z-last_lpc)*18:
		last_lpc = lpc.z
		_create_platform(lpc.x, lpc.y, lpc.z)
		_update_platform_coordinates()
		
	
