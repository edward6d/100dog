extends RigidBody2D
var frame_no = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	frame_no+=1

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("%04d ball entered %s" % [frame_no, body])
	if body is CharacterBody2D:
		linear_velocity += body.velocity
	pass # Replace with function body.
