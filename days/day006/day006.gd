extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func go_back_to_menu():
	var scene_path := "res://main/main_menu.tscn"
	get_tree().change_scene_to_file(scene_path)

func _input(event : InputEvent):
	if event.is_action("game_menu"):
		go_back_to_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
