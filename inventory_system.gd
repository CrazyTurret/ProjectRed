extends Node

var itemDictionary
var playerInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	itemDictionary = {
		1: {
			"itemName" : "Test Item",
			"itemDescription" : "An item used for testing mechanics",
			"itemIcon" : "res://icon.png",
			"maxStacks" : 64
		},
		2: {
			"itemName" : "Cooler Test Item",
			"itemDescription" : "A cool item used for testing mechanics",
			"itemIcon" : "res://icon.png",
			"maxStacks" : 1
		}
	}
	
	playerInventory = [1,1,1,2,2,2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
