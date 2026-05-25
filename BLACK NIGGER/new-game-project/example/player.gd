extends CharacterBody3D

const SPEED = 30.0
const JUMP_VELOCITY = 65
const GRAVITY = 90
const TURN_SPEED = 1.0

@onready var wheel_l : Node3D = $VW_IDR/wheel_L
@onready var wheel_r : Node3D = $VW_IDR/wheel_R

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Forward and back along car's facing direction
	if Input.is_action_pressed("up"):
		velocity.x = transform.basis.z.x * SPEED
		velocity.z = transform.basis.z.z * SPEED
	elif Input.is_action_pressed("down"):
		velocity.x = -transform.basis.z.x * SPEED
		velocity.z = -transform.basis.z.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	var moving = Input.is_action_pressed("up") or Input.is_action_pressed("down")
	var reversing = Input.is_action_pressed("down")
	if moving:
		if Input.is_action_pressed("left"):
			rotate_y(TURN_SPEED * delta * (-1 if reversing else 1))
		if Input.is_action_pressed("right"):
			rotate_y(-TURN_SPEED * delta * (-1 if reversing else 1))
	move_and_slide()

	# Spin wheels based on how fast the car is moving
	var roll_speed = Vector2(velocity.x, velocity.z).length() * delta * 0.1
	if wheel_l:
		wheel_l.rotation.x += roll_speed
	if wheel_r:
		wheel_r.rotation.x += roll_speed
