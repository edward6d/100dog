extends Control


class ValueMeter:
	signal _meter_signal(new_value : int)
	var _value : int
	
	func _init(value: int):
		self.set_value(value)
	
	func update(delta : int):
		self._value += delta
		self._meter_signal.emit(self._value)
	
	func set_value(value:int):
		self._value = value
		self._meter_signal.emit(self._value)
	

var money : ValueMeter = ValueMeter.new(0)
var actions : ValueMeter = ValueMeter.new(0)
var buys : ValueMeter = ValueMeter.new(0)
var health : ValueMeter = ValueMeter.new(10)


# Called when the node enters the scene tree for the first time.
func _ready():
#	money.update(0)
#	actions.update(0)
#	buys.update(0)
#	health.update(10)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
