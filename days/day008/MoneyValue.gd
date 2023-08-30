extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func update(value):
	text = "%5d" % value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
