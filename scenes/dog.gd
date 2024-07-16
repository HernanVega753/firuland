extends CharacterBody2D

@export var speed: float = 200.0

func _process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	if Input.is_action_just_pressed("ui_accept"): # Default is Space
		action_space()
	
	if Input.is_action_just_pressed("ui_select"): # Default is Z
		action_z()

func action_space() -> void:
	print("Acción del botón ESPACIO ejecutada")

func action_z() -> void:
	print("Acción del botón Z ejecutada")
