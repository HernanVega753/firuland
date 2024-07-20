extends CharacterBody2D

@onready var hit_box = $"hit_box/area_guf"
@onready var animation = $AnimatedSprite2D
@onready var collision = $CollisionShape2D
@onready var reposo = $"../reposo"
@onready var action = $"../action"
@onready var mary = $"."

var player = null
var run = false
var idle = false
var move = Vector2.ZERO
var speed = 20

func _ready():
	movement()

func _physics_process(delta):
	
	out_of_screen()
	
	
	move_and_slide()
	if run == false  && idle == false:
		animation.play("mary_walk")

		

func movement():
	reposo.start()
	velocity.x = speed
	if velocity.x < 0:
		animation.flip_h

func _on_hit_box_area_entered(area):
	
	if $up.is_colliding():
		velocity.x = -speed * 5
		animation.flip_h = true
	elif $down.is_colliding():
		velocity.x = -speed * 5
		animation.flip_h = true
	else:
		if $rigth.is_colliding():
			velocity.x = -speed * 5
			animation.flip_h = true
		elif $left.is_colliding():
			velocity.x = speed * 5
	run = true
	if run:
		collision.disabled = true
	animation.play("mary_run")
	
func _on_reposo_timeout():
	if run == false:
		idle = true
		velocity.x = 0
		animation.play("mary_idle")
		action.start()
	
func _on_action_timeout():
	if run == false:
		idle = false
		movement()

func out_of_screen():
	if (global_position.x <= -50) || (global_position.x >= 300):
		self.queue_free()
	elif (global_position.y <= 10) || (global_position.y >= 400):
		self.queue_free()
	


func _on_area_npc_area_entered(area):
	if run == false:
		idle = true
		velocity.x = 0
		animation.play("mary_talk")

