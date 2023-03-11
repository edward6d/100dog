extends CharacterBody2D

const SPEED = 300.0
const BARREL_VELOCITY = -2
const BULLET_VELOCITY = 1200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum Facing {FACE_LEFT, FACE_RIGHT}
var face : Facing = Facing.FACE_RIGHT


@export var _bullet_scene: PackedScene

func shoot():
	$ShootCooldown.start()
	var bullet: RigidBody2D = _bullet_scene.instantiate()
	bullet.position = position + Vector2(10,0).rotated($Body/Barrel.rotation)
	bullet.linear_velocity = Vector2(BULLET_VELOCITY,0).rotated($Body/Barrel.rotation)
	get_parent().add_child(bullet)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("game_action") and $ShootCooldown.is_stopped():
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("game_left", "game_right")
	var barrel_direction = Input.get_axis("game_down", "game_up")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0 and face == Facing.FACE_LEFT:
			face = Facing.FACE_RIGHT
			$Body/Barrel.rotation = PI - $Body/Barrel.rotation
		elif direction < 0 and face == Facing.FACE_RIGHT:
			face = Facing.FACE_LEFT
			$Body/Barrel.rotation = PI - $Body/Barrel.rotation
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if barrel_direction:
		if face == Facing.FACE_LEFT:
			$Body/Barrel.rotation = clamp($Body/Barrel.rotation - delta * BARREL_VELOCITY * barrel_direction,
											PI/2, 
											3*PI/2)
		else:
			$Body/Barrel.rotation = clamp($Body/Barrel.rotation + delta * BARREL_VELOCITY * barrel_direction,
											-PI/2, 
											PI/2)
	

	move_and_slide()
