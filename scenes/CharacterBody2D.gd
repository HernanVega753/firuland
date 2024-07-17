extends CharacterBody2D
class_name npc

@onready var hit_box = $"hit_box/area_guf"
@onready var animation = $AnimatedSprite2D
@onready var collision = $CollisionShape2D
@onready var reposo = $"../reposo"
@onready var action = $"../action"

var player = null
var run = false
var idle = false
var move = Vector2.ZERO
var speed = 10

func _ready():
	movement()
	



func _physics_process(delta):
	
	
	move_and_slide()
	if run == false  && idle == false:
		animation.play("mary_walk")

func movement():
	reposo.start()
	velocity.x = speed
	
	


func _on_hit_box_area_entered(area):
	run = true
	set_collision_mask_value(1,false)
	animation.play("mary_run")
	
	if $up.is_colliding():
		velocity.x = -speed * 10
		animation.flip_h = true
	elif $down.is_colliding():
		velocity.x = -speed * 10
		animation.flip_h = true
	else:
		if $rigth.is_colliding():
			velocity.x = -speed * 10
			animation.flip_h = true
		elif $left.is_colliding():
			velocity.x = speed * 10
	
	


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
