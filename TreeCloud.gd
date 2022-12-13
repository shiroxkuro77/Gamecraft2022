extends Cloud

class_name TreeCloud

const bulletPath = preload("res://SeedBullet.tscn")

# Declare member variables here. Examples:
var has_drop_seed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_drop_seed and _timer(delta):
	
		has_drop_seed = false
	
	elif Input.is_action_just_pressed("execute"):
		shoot()
		has_drop_seed = true
		
func shoot():
	var bullet = bulletPath.instance()
	get_parent().get_parent().get_parent().add_child(bullet)
	bullet.position = self.global_position
