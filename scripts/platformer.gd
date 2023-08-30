extends CharacterBody2D

@export var speed = 300
@export var jump_speed = -400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#java neles, no editor a direita tem um espaco pra botar a referencia de um Sprite2D
@export var sprite: Sprite2D

func _physics_process(delta):
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed
	elif not is_on_floor():
		#velocity.y = move_toward(velocity.y, 0, gravity)
		velocity.y += gravity * delta
	
	var x_direction = Input.get_axis("left", "right")
	if x_direction:
		velocity.x = x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if Input.is_action_just_pressed("h"):
		if sprite.visible:
			sprite.visible = false
		else:
			sprite.visible = true
	#não pode esquecer de chamar a função de mover o bicho ne	
	move_and_slide()
