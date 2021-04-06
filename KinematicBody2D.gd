extends KinematicBody2D

export(int) var speed = 500
var motion = Vector2()

func cart_to_iso(cartesian):#changes cartersian coordinates to an isometric functioning coordinate system
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

func _physics_process(delta): #Handles Movements, Direction, and All sprite animation for the player character
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1,0)
		$AnimatedSprite.play("1_Run")
		
	elif Input.is_action_just_released("ui_right"):
			$AnimatedSprite.play("1_Idle")
			
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_down"):
		direction += Vector2(1,1)
		$AnimatedSprite.play("2_Run")
		
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_up"):
		direction += Vector2(1,-1)
		$AnimatedSprite.play("0_Run")
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0,1)
		$AnimatedSprite.play("3_Run")
		
	elif Input.is_action_just_released("ui_down"):
			$AnimatedSprite.play("3_Idle")
			
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1,0)
		$AnimatedSprite.play("5_Run")
		
	if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_down"):
		direction += Vector2(-1,1)
		$AnimatedSprite.play("4_Run")
		
	if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_up"):
		direction += Vector2(-1,-1)
		$AnimatedSprite.play("6_Run")
		
	elif Input.is_action_just_released("ui_left"):
			$AnimatedSprite.play("5_Idle")
			
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0,-1)
		$AnimatedSprite.play("7_Run")
		
	elif Input.is_action_just_released("ui_up"):
			$AnimatedSprite.play("7_Idle")
	
	motion = direction.normalized() * speed
	motion = cart_to_iso(motion)
	move_and_collide(motion * delta)
