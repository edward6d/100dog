extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func explode():
	pass

func _on_explode_timer_timeout():
	explode()
	queue_free()
	pass # Replace with function body.
