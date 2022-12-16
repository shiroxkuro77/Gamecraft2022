extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var died = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.show()
	$BurningSprite.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if died and $BurningTimer.is_stopped():
		queue_free()


func burn():
	$Sprite.hide()
	$BurningSprite.show()
	$BurningSprite.play()
	$BurningTimer.start()
	died = true
