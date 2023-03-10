extends Control

@export var _tile_map_path: NodePath
@onready var _tile_map : TileMap = get_node(_tile_map_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	for cell in _tile_map.get_used_cells(0):
		print(cell)
		print(_tile_map.get_cell_tile_data(0, cell))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$World.position.y += 1
