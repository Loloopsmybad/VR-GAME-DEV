extends CharacterBody3D


var speed = 30.0
var direction = Vector3(-1, 0.5, 0).normalized()  # no X movement

func _ready():
	velocity = direction * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		
		velocity = velocity.bounce(collision.get_normal())
		velocity.z = 0  # ← force X to always stay 0
		velocity = velocity.normalized() * speed  # maintain constant speed
		
		if collider.is_in_group("bricks"):
			collider.queue_free()
		
		if collider.is_in_group("paddle"):
			var hit_offset = global_position.x - collider.global_position.x
			velocity.z = 0  # no X drift from paddle hit either
			velocity = velocity.normalized() * speed
			
			
