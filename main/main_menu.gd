@tool
extends Control

@export var _button_grid_path: NodePath
@onready var _button_grid : GridContainer = get_node(_button_grid_path)

var days = [
	[1, "Turbo Tumbler"],
	[2, "Clicky Grower"],
	[3, "Pong"],
	[4, "Angry Ascent"],
	[5, "Back to the Menu"],
	[6, "DESTRUCT"],
	[7, "Tanks"],
	[8, "Card Bonanza"]
]

func create_day_button(day):
	var button = Button.new()
	button.custom_minimum_size.y = 50
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.text = "Day %d - %s" % day
	return button

func _ready():
	if len(_button_grid.get_children()) == 0:
		for day in days:
			var button = create_day_button(day)
			button.pressed.connect(_on_day_button_pressed.bind(day[0]))
			_button_grid.add_child(button)
	else:
		print(_button_grid.get_children())

func _on_day_button_pressed(day_no):
	var scene_path := "res://days/day%03d/day_%03d.tscn" % [day_no, day_no]
	get_tree().change_scene_to_file(scene_path)
