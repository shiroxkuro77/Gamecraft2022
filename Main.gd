extends Node2D

var unitBlock = 64

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cloud_lightning():
	print("main triggered")
	print($Cloud.position.x, " ", $Car.position)
	if abs($Cloud.position.x - $Car.position.x) < unitBlock:
		$Car.trigger_move_right()
