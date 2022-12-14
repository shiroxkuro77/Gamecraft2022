extends Cloud


class_name LightningCloud

# Declare member variables here. Examples:
var has_lightning = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.hide()
	pass # Replace with function body.

func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_lightning and $LightningTimer.is_stopped():
		emit_signal("lightning")
		$AnimatedSprite.stop()
		$AnimatedSprite.hide()
		has_lightning = false
	
	elif Input.is_action_just_pressed("execute"):
		$AnimatedSprite.show()
		$LightningTimer.start()
		$AnimatedSprite.play()
		has_lightning = true
