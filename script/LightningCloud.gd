extends Cloud
class_name LightningCloud

# Declare member variables here. Examples:
var has_lightning = false
onready var lightning_ray = $RayCast2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_ready == false:
		return
		
	if has_lightning and $LightningTimer.is_stopped():
		$AnimatedSprite.stop()
		$AnimatedSprite.hide()
		has_lightning = false
	
				
	elif Input.is_action_just_pressed("execute"):
		if lightning_ray.is_colliding():
			changeSpriteSize(lightning_ray, lightning_ray.get_collision_point())
		
			#Deletes seed/tree
			if lightning_ray.get_collider().name == "SeedBody":
				#Play tree animation
				lightning_ray.get_collider().burn_and_kill_self();
			if "Tree" in lightning_ray.get_collider().name:
				#Destroy tree
				lightning_ray.get_collider().burn()
		
		$AnimatedSprite.show()
		$LightningTimer.start()
		$AnimatedSprite.play()
		$ThunderSound.play()
		has_lightning = true
	
func changeSpriteSize(ray, collisionPoint):
	print(ray.get_global_position())
	print(collisionPoint)
	print(ray.get_global_position().distance_to(collisionPoint))
	$AnimatedSprite.scale.y = ray.get_global_position().distance_to(collisionPoint) / 128
	$AnimatedSprite.set_global_position(lerp(ray.get_global_position(), collisionPoint, 0.7))
	#$AnimatedSprite.rotation_degrees = rad2deg(get_angle_to(ray.get_global_position()))
