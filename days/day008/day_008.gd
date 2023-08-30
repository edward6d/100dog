extends Control

@export var _card_scene: PackedScene
const PlayerState = preload("res://days/day008/player_state.tscn")
var _player_state = PlayerState.instantiate()

var cards = [
	CardData.new("Test card", 1, "Ka Pow \n Pow Pow Pow", "res://foobar", {}),
	CardData.new("Konfuzja", 1, "Kooo[color=red]oooooooooonf[/color]uazja", "res://konfuzja", {"play":func(x): print("Im'ckonaused")}),
]

# Called when the node enters the scene tree for the first time.
func _ready():
#	var new_card = _card_scene.instantiate()
#	new_card.init(cards[0])
#	new_card.position = Vector2(500,100)
#	add_child(new_card)
#	new_card.play()
#	new_card = _card_scene.instantiate()
#	new_card.init(cards[1])
#	add_child(new_card)
#	new_card.play()
	_player_state.money._meter_signal.connect($HUD/HBoxContainer/MoneyValue.update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_2_pressed():
	_player_state.money.update(1)
	pass # Replace with function body.
