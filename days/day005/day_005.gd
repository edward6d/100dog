extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("game_menu"):
		_on_button_pressed()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main/main_menu.tscn")
