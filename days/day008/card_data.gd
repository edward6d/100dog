class_name CardData extends Object

var playable: bool
var title: String
var cost: int
var text: String
var hero_image_path: String
var play_hook: Callable = func(x): print("I'm the default play function")

func _init(title, cost, text, hero_image_path, hooks):
	self.playable = true
	self.title = title
	self.cost = cost
	self.text = text
	self.hero_image_path = hero_image_path
	if "play" in hooks and self.playable:
		self.play_hook = hooks["play"]
