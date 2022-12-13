extends RigidBody2D

onready var nextState = get_node("RigidBody2DGrow1")
onready var childState = get_node("RigidBody2D/SpriteSeed")
var currPos
var isMoving = true
var time = 0
var TIME_PERIOD = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false


func _process(delta):
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
			#for child in get_parent().get_children():
			#	for child2 in child.get_children():
			#		if child2 is CollisionShape2D:
			#			child2.disabled = false 
			#		print(child2)
			#	child.position = self.position
			#	child.visible = true
			var savePosition = self.position
			if $SpriteG1.visible  == true:
				$SpriteG2.visible = true
				$Area2DNG/CollisionShapeG2.disabled = false
				$SpriteG1.visible = false
			elif $SpriteG2.visible == true:
				$SpriteG3.visible = true
				$Area2DNG/CollisionShapeG3.disabled = false
				$SpriteG2.visible = false
			else:
				$SpriteG1.visible = true
				$Area2DNG/CollisionShapeG1.disabled = false
				$SpriteSeed.visible = false
				self.collision_mask = 1



func _on_Area2DNG_body_entered(body):
	if body.name == "Car":
		
		pass#if body.position.y > $Area2DNG/CollisionShapeG3.global_position.y:
		#	body.position.y = $Area2DNG/CollisionShapeG3.global_position.y - 600
