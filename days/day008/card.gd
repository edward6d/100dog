extends Panel

var cardData : CardData
var bounce_tween : Tween
var ref_position 
signal cardClicked(card)

func init(cd: CardData):
	cardData = cd
	$VBoxContainer/TitleLabel.text = cd.title
	$VBoxContainer/RichTextLabel.text = cd.text

func play():
	cardData.play_hook.call()

# Called when the node enters the scene tree for the first time.
func _ready():
	bounce_tween = create_tween()
	bounce_tween.stop()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed == true:
		print("Clicked " + str(event))
		cardClicked.emit(self)
	pass # Replace with function body.


func _on_mouse_entered():
	if not bounce_tween.is_running():
		ref_position = position
	else:
		bounce_tween.kill()
	# Animation for darkening selected card and bouncing it up and down when hovering
	bounce_tween = create_tween()
	bounce_tween.set_parallel()
	bounce_tween.tween_property(self, "modulate", Color.from_hsv(1, 0, 1.2), 0.15)
	bounce_tween.set_ease(Tween.EASE_OUT)
	bounce_tween.set_trans(Tween.TRANS_CUBIC)
	bounce_tween.tween_property(self, "position", ref_position + Vector2(0, -8), 0.3)
#	bounce_tween.set_parallel(false)
#	bounce_tween.set_ease(Tween.EASE_OUT)
#	bounce_tween.tween_property(self, "position", ref_position + Vector2(0, 0), 0.4)
#	bounce_tween.set_loops(-1)


func _on_mouse_exited():
	bounce_tween.kill()
	bounce_tween = create_tween()
#	bounce_tween.set_loops(1)
	bounce_tween.set_parallel()
	bounce_tween.tween_property(self, "position", ref_position, 0.35)
	bounce_tween.tween_property(self, "modulate", Color.from_hsv(1, 0, 1.0), 0.15)
	
	
#	self.modulate = Color(1.0, 1.0, 1.0, 1.0)
