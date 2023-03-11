extends Node2D

const PADDLE_BASE_VEL := 400

# Called when the node enters the scene tree for the first time.
func _ready():
	$BallBody.linear_velocity = Vector2(1000,0) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$PlayerPaddleBody.velocity = Vector2(0, PADDLE_BASE_VEL*Input.get_axis("game_up", "game_down"))
	$PlayerPaddleBody.move_and_slide()
	get_node("../DebugLabel").text = "Ball velocity: (%4.2f, %4.2f)" % [$BallBody.linear_velocity.x, $BallBody.linear_velocity.y]
