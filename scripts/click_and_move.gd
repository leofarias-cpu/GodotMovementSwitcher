extends CharacterBody2D
@export var speed = 300

func _physics_process(delta):
	#var mouse_pos = get_global_mouse_position()
	if Input.is_action_just_pressed("left_click"):
		#var mouse_pos = get_viewport().get_mouse_position()
		var mouse_pos = get_global_mouse_position()
		velocity = position.direction_to(mouse_pos) * speed
	move_and_slide()
