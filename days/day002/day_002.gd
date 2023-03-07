extends Control

var wood : float = 0.0
var lumberjacks : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _lumberjack_cost():
	return floorf(pow((lumberjacks+1),0.8)*10)

func _update_labels():
	$VBoxContainer/ResourceGridContainer/WoodAmount.text = "%d" % floorf(wood)
	$VBoxContainer/ResourceGridContainer/LumberjackButton.text = "Hire a lumberjack (Cost: %d wood)" % floorf(_lumberjack_cost())
	$VBoxContainer/ResourceGridContainer/LumberjackAmount.text = "%d" % floorf(lumberjacks)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	wood += lumberjacks * delta
	_update_labels()

func _on_wood_button_pressed():
	wood += 1


func _on_lumberjack_button_pressed():
	if wood >= _lumberjack_cost():
		wood -= _lumberjack_cost()
		lumberjacks += 1
