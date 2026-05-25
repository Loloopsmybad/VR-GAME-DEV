extends Node3D

const SPEED = 10.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		translate(Vector3(0, 0, -SPEED * delta))
	if Input.is_action_pressed("ui_down"):
		translate(Vector3(0, 0, SPEED * delta))
	if Input.is_action_pressed("ui_left"):
		translate(Vector3(-SPEED * delta, 0, 0))
	if Input.is_action_pressed("ui_right"):
		translate(Vector3(SPEED * delta, 0, 0))
