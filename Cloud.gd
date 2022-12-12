extends Node2D

signal lightning

# Declare member variables here. Examples:

var has_lightning = false
var unitBlock = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if has_lightning and $LightningTimer.is_stopped():
		emit_signal("lightning")
		$AnimatedSprite.stop()
		$AnimatedSprite.hide()
		has_lightning = false
	
	if Input.is_action_just_pressed("move_left"):
		print(position.x)
		if position.x > 32:
			position.x -= unitBlock
	elif Input.is_action_just_pressed("move_right"):
		print(position.x, " ", OS.get_screen_size().x)
		if position.x < OS.get_screen_size().x - 32:
			position.x += unitBlock
	elif Input.is_action_just_pressed("execute"):
		$AnimatedSprite.show()
		$LightningTimer.start()
		$AnimatedSprite.play()
		has_lightning = true
