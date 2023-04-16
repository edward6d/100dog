extends Panel

var cardData : CardData

func init(cd: CardData):
	cardData = cd
	$VBoxContainer/TitleLabel.text = cd.title
	$VBoxContainer/RichTextLabel.text = cd.text

func play():
	cardData.play_hook.call()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
