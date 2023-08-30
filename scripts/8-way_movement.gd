extends CharacterBody2D

#da pra ser tipado que nem UML
#var speed: float = 300.0
@export var speed = 300.0

func _physics_process(delta):	
	#parece que get_axis() atribui um valor negativo(-1) e positivo(+1) aos inputs passados
	var y_direction = Input.get_axis("up", "down")
	if y_direction:
		#velocity é um vetor 2d, (x,y) ou seja um par ordenado de x e y
		#em computadores pra baixo é +y não questione
		velocity.y = y_direction * speed
	else:
		#move primeiro argumento até o segundo de speed em speed passos
		velocity.y = move_toward(velocity.y, 0, speed)	
		
	var x_direction = Input.get_axis("left", "right")
	if x_direction:
		velocity.x = x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
