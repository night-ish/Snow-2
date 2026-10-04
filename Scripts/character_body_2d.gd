extends CharacterBody2D
class_name Namer

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const FALL_VELOCITY = 800.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction and is_on_floor():
		velocity.x = direction * SPEED
		animated_sprite.play("Walk")
		animated_sprite.flip_h = direction > 0
		
	elif not is_on_floor():
		velocity.y += FALL_VELOCITY * delta / 2
		
		if direction :
			velocity.x = direction * SPEED
			if velocity.y < 0:
				animated_sprite.play("JumpSide")
			else:
				animated_sprite.play("FallSide")
			animated_sprite.flip_h = direction > 0
		else:
			animated_sprite.play("FallFront")
			pass
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y < 0:
				animated_sprite.play("JumpFront")
			else:
				animated_sprite.play("FallFront")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("Idle")
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
