extends Cloud

class_name TreeCloud

const bulletPath = preload("res://scene/SeedBullet.tscn")

# Declare member variables here. Examples:
var has_drop_seed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_ready == false:
		return
	
	if has_drop_seed and $TreeTimer.is_stopped():
		has_drop_seed = false
	elif (not has_drop_seed) and Input.is_action_just_pressed("execute"):
		shoot()
		$TreeTimer.start()
		has_drop_seed = true
		
func shoot():
	var bullet = bulletPath.instance()
	get_parent().get_parent().add_child(bullet)
	bullet.position = self.global_position
	$SeedImpactSound.play()
