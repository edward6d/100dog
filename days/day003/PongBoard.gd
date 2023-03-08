extends Node2D

const PADDLE_BASE_VEL := 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$BallBody.linear_velocity = Vector2(500,0) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$PlayerPaddleBody.velocity = Vector2(0, PADDLE_BASE_VEL*Input.get_axis("game_up", "game_down"))
	$PlayerPaddleBody.move_and_slide()
