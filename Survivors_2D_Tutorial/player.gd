extends CharacterBody2D

@onready var sprite = %HappyBoo

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	if Input.is_action_pressed("move_left"):
		%HappyBoo.scale.x = -1
	elif Input.is_action_just_pressed("move_right"):
		%HappyBoo.scale.x = 1
	
