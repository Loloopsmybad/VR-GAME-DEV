extends CharacterBody3D

const SPEED = 50.0
const JUMP_VELOCITY = 65
const GRAVITY = 90

@onready var wheel_l : Node3D = $VW_IDR/wheel_L
@onready var wheel_r : Node3D = $VW_IDR/wheel_R

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	# Spin wheels based on how fast the car is moving
	var roll_speed = Vector2(velocity.x, velocity.z).length() * delta * 0.1
	if wheel_l:
		wheel_l.rotation.z += roll_speed
	if wheel_r:
		wheel_r.rotation.z += roll_speed
