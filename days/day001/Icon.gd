extends Sprite2D

var tween
var spin = 0.0
var flop:int = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	var start = position
	tween = get_tree().create_tween()
	tween.set_loops(0)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position", start + Vector2(500, 0), 1.0)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", start, 1.0)
	
	tween.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.rotation += delta*spin
	pass




func _on_timer_timeout():
	if flop == 1:
		spin=randi_range(1, 4)
		
		$CrashPlayer.volume_db = -35 + 7*spin
		$CrashPlayer.play()
		spin*=4.0
		
	flop = (flop+1)%2
	pass # Replace with function body.
