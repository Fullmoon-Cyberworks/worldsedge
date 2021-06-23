extends KinematicBody2D

const ACCEL = 250
const MAX_SPEED = 100
const FRICTION = 250

var motion = Vector2.ZERO

func _physics_process(delta): #Handles Movements, Direction, and All sprite animation for the player character
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		motion = motion.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	else:
		motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_collide(motion * delta)
