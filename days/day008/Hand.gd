extends HBoxContainer

@export var _card_scene: PackedScene
@onready var main = $"../.."

# todo - move somewhere else and import from other file
var cards = [
	CardData.new("Attack", 1, "Ka Pow \n Pow Pow Pow", "res://days/day008/caveman_confused.png", {}),
	CardData.new("Konfuzja", 1, "Kooo[color=red]oooooooooonf[/color]uazja", "res://days/day008/caveman_confused.png", {"play":func(x): print("Im'ckonaused")}),
	CardData.new("Money", 0, "[color=yellow]Cha-ching[/color]", "res://days/day008/money.png", {"play":func(x): x.money.update(1)}),
]

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
	else:
		card._on_play_failure()


func _on_draw_button_pressed():
	add_card(cards[randi_range(0, len(cards)-1)])
