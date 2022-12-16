extends RigidBody2D

class_name Seed

var currPos
var isMoving = true
var time = 0
var TIME_PERIOD = 0.1
var touchGround = false
var died = false
	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false


func _process(delta):
	if died and $BurningTimer.is_stopped():
		get_parent().queue_free()
		
	if _timer(delta):
		if currPos == null:
			currPos = global_position
			isMoving = true
		elif position == currPos:
			isMoving = false
		else:
			currPos = position
			isMoving = true

		if not isMoving:
			if not touchGround:
				get_parent().queue_free()
				
			if $SpriteG1.visible  == true:
				$SpriteG2.visible = true
				$CollisionShapeG2.disabled = false
				$SpriteG1.visible = false
			if $SpriteG2.visible == true:
				$SpriteG3.visible = true
				$CollisionShapeG3.disabled = false
				$SpriteG2.visible = false
			if $SpriteSeed.visible == true:
				$SpriteG1.visible = true
				$CollisionShapeG1.disabled = false
				$CollisionShapeNG.disabled = true
				$SpriteSeed.visible = false
				self.collision_layer = 1

func _on_Area2D_body_entered(body):
	if body.name == "Ground":
		touchGround = true
	if body.name == "Platform":
		get_parent().queue_free()

func burn_and_kill_self():
	$SpriteG3.hide()
	$BurningSprite.show()
	$BurningSprite.play()
	$BurningTimer.start()
	died = true
