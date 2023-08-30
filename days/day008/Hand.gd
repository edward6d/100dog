extends HBoxContainer

@export var _card_scene: PackedScene
@onready var main = $"../.."


func add_card(cardData):
	var new_card = _card_scene.instantiate()
	new_card.init(cardData)
	new_card.cardClicked.connect(handle_card_pressed)
	add_child(new_card)
	
func play_card(card):
	card.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func handle_card_pressed(card):
	print("I'm hand card handler")
	if main._player_state.money._value >= card.cardData.cost:
		card.play(main._player_state)
		card.queue_free()
		main._player_state.money.update(-card.cardData.cost)


func _on_draw_button_pressed():
	add_card(CardData.new( "Test card", 1, "Ka Pow \n Pow Pow Pow", "res://foobar", {}))
	pass # Replace with function body.
