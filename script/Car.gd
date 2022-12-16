extends RigidBody2D

onready var ground_ray = get_node("GroundRay2D");
onready var front_ray = get_node("FrontRay2D");
onready var collide_ray = get_node("CollideRay2D");
var initial_pos = position.x
var moving = false
var unitBlock = 64
var time = 0
const TIME_PERIOD = 0.3
var Direction = "Right"
var isOnPlatform = false
var oldParent
signal reachedGoal

# Called when the node enters the scene tree for the first time.
func _ready():
	moving = false
	oldParent = get_parent()

	
func _timer(delta):
	time += delta
	if time > TIME_PERIOD:
		time = 0
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isOnPlatform = false
	
	if ground_ray.is_colliding() and ground_ray.get_collider():
		if ground_ray.get_collider().name in "Platform":
			if not get_parent().name in "Platform":
				#change parent to platform
				var preposx = global_position.x
				var preposy = global_position.y
				var new_parent = ground_ray.get_collider()
				get_parent().remove_child(self)
				new_parent.add_child(self)
				global_position.x = preposx
				global_position.y = preposy
			isOnPlatform = true
	if collide_ray.is_colliding() and collide_ray.get_collider():
		if collide_ray.get_collider().name in "Platform":
			if not get_parent().name in "Platform":
				position.y -= unitBlock
				#change parent to platform
				var preposx = global_position.x
				var preposy = global_position.y
				var new_parent = collide_ray.get_collider()
				get_parent().remove_child(self)
				new_parent.add_child(self)
				global_position.x = preposx
				global_position.y = preposy
			isOnPlatform = true
			
	if not isOnPlatform:
		#swap back parent
		var preposx = global_position.x
		var preposy = global_position.y
		var new_parent = oldParent
		get_parent().remove_child(self)
		new_parent.add_child(self)
		global_position.x = preposx
		global_position.y = preposy
	
	if _timer(delta):
		if front_ray.is_colliding() and front_ray.get_collider():
			#Deletes tornado
			if front_ray.get_collider().name == "TornadoBody":
				ChangeDirection()
				front_ray.get_collider().get_parent().queue_free()
				return
			if front_ray.get_collider().name == "GoalFlag":
				MoveDirection()
				emit_signal("reachedGoal")	
				return
		if ground_ray.is_colliding() and ground_ray.get_collider():
			if ground_ray.get_collider().name == "TornadoBody":
				ChangeDirection()
				ground_ray.get_collider().get_parent().queue_free()
				return
			elif ground_ray.get_collider().name == "GoalFlag":
				position.y += unitBlock
				emit_signal("reachedGoal")
				return
				
		if not ground_ray.is_colliding() and not get_parent().name in "Platform":
			position.y += unitBlock
		elif moving and (not front_ray.is_colliding()):
			MoveDirection()
		elif collide_ray.is_colliding():
			if collide_ray.get_collider().name == "GoalFlag":
				emit_signal("reachedGoal")	
			position.y -= unitBlock
		

func start_moving():
	moving = true

func stop_moving():
	moving = false

func trigger_move_right():
	initial_pos = position.x
	moving = true
	

func ChangeDirection():
	if Direction == "Left":
		$CarSprite.set_flip_h( false )
		$FrontRay2D.set_cast_to(Vector2(64,0))
		Direction = "Right"
	elif Direction == "Right":
		$CarSprite.set_flip_h( true )
		$FrontRay2D.set_cast_to(Vector2(-64,0))
		Direction = "Left"
		
func MoveDirection():
	if Direction == "Left":
		position.x -= unitBlock
	elif Direction == "Right":
		position.x += unitBlock

func play_win_sound():
	$WinSound.play()
