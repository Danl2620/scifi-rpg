extends CharacterBody2D

const SPEED = 60.0
const TURN_SPEED = 2
const ROTATE_SPEED = 20

@export var weapon: Weapon
@onready var body_sprite := $BodySprite
@onready var animation_player = $AnimationPlayer
@onready var collider = $CollisionShape2D

var direction : Vector2 = Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass ## weapon.set_rotation_degrees(0)

func _input(event):
	if event.is_action_pressed("weapon_fire"):
		weapon.fire()

func _physics_process(delta):
	if animation_player == null || weapon == null:
		return
	
	var input_direction := Input.get_vector("turn_left", "turn_right", "move_backward", "move_forward")
	
	if input_direction.x != 0:
		# Rotate direction based on our input vector and apply turn speed
		direction = direction.rotated(input_direction.x * (PI / 2) * TURN_SPEED * delta)

	rotation = direction.angle()
	
	if input_direction.y != 0:
		# Move in a forward/backward motion and play animation
		animation_player.play("move")
		velocity = lerp(velocity, (direction.normalized() * input_direction.y) * SPEED, SPEED * delta)
	else:
		# Bring to a stop
		velocity = Vector2.ZERO
		animation_player.play('idle')
		
	move_and_slide()
	
	# Apply Weapon Rotation
	var weapon_rotate_direction := Input.get_axis("weapon_rotate_left", "weapon_rotate_right")
	weapon.set_rotation_degrees(weapon.get_rotation_degrees() + (weapon_rotate_direction * ROTATE_SPEED * delta * PI))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
