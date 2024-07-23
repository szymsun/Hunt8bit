extends CharacterBody2D

var HUNTER_STATES

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var hunter_sprite = $HunterHitbox/HunterSprite
@onready var jump_audio = $BulletOrgin/JumpAudio

func _physics_process(_delta):
	
	# Add the gravity.
	if ! is_on_floor():
		velocity.y += gravity * _delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_audio.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		animate_hunter(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func animate_hunter(direction):
	if direction > 0 and not HUNTER_STATES == 1:
		hunter_sprite.animation = "RunLeft"
		HUNTER_STATES = 1
	if direction < 0 and not HUNTER_STATES == 2:
		hunter_sprite.animation = "RunRight"
		HUNTER_STATES = 2
	if direction == 0:
		hunter_sprite.animation = "idle"
		HUNTER_STATES = 0
 
