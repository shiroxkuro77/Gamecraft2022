extends Cloud
class_name LightningCloud

# Declare member variables here. Examples:
var has_lightning = false
onready var lightning_ray = $RayCast2D;

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
		$AnimatedSprite.stop()
		$AnimatedSprite.hide()
		has_lightning = false
		if lightning_ray.is_colliding():
			#Deletes seed/tree
			if lightning_ray.get_collider().name == "SeedBody":
				lightning_ray.get_collider().get_parent().queue_free()
	
	elif Input.is_action_just_pressed("execute"):
		$AnimatedSprite.show()
		$LightningTimer.start()
		$AnimatedSprite.play()
		has_lightning = true
		
