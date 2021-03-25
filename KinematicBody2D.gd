extends KinematicBody2D

export(int) var speed = 555
var motion = Vector2()

func cart_to_iso(cartesian):#changes cartersian coordinates to an isometric functioning coordinate system
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func _physics_process(delta): #Handles Movements, Direction, and All sprite animation for the player character
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("1_Run")
		direction += Vector2(1,0)
	elif Input.is_action_just_released("ui_right"):
			$AnimatedSprite.play("1_Idle")
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("3_Run")
		direction += Vector2(0,1)
	elif Input.is_action_just_released("ui_down"):
			$AnimatedSprite.play("3_Idle")
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("5_Run")
		direction += Vector2(-1,0)
	elif Input.is_action_just_released("ui_left"):
			$AnimatedSprite.play("5_Idle")
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("7_Run")
		direction += Vector2(0,-1)
	elif Input.is_action_just_released("ui_up"):
			$AnimatedSprite.play("7_Idle")		
	
	motion = direction.normalized() * speed
	motion = cart_to_iso(motion)
	move_and_slide(motion)
