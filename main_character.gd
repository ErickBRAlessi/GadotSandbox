extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
var lastDirection = 0;


func _physics_process(delta):
	#animations
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "default"
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		lastDirection = direction
	else:
		velocity.x = move_toward(velocity.x, 0, 35)

	move_and_slide()

	# The character will look to last aimed direction
	if(lastDirection < 0):
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
