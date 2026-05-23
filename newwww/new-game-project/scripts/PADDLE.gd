extends StaticBody3D

var speed = 20.0
var boundary = 15.0

func _ready():
	add_to_group("paddle")

func _process(delta):
	if Input.is_key_pressed(KEY_K):
		position.z -= speed * delta
	if Input.is_key_pressed(KEY_L):
		position.z += speed * delta
	position.z = clamp(position.z, -boundary, boundary)
#extends StaticBody3D
#
#var speed = 20.0
#var boundary = 15.0
#
#func _ready():
	#add_to_group("paddle")
#
#func _process(delta):
	#var accel = Input.get_accelerometer()
	#
	## accel.z moves forward/back when you move phone forward/back
	#position.z += accel.x * speed * delta
	#position.z = clamp(position.z, -boundary, boundary)
