extends Node2D
@onready var cooldown = $cooldown
@onready var invaders_counter = $GUI/HBoxContainer/invaders_counter
@onready var countdown = $GUI/HBoxContainer2/countdown


var counter = 0
var invaders_in_area = 0
var empty_zone = true

func _process(delta):
	empty_territory()
	if cooldown.time_left == 0:
		countdown.text = "SIN PROBLEMAS"
	else:
		countdown.text = str(int(cooldown.time_left))

func _on_area_2d_area_entered(area):
	if area.is_in_group("invaders"):
		invaders_in_area += 1
	if invaders_in_area > 0 && empty_zone:
		cooldown.start()
		empty_zone = false
	invaders_counter.text  = str(invaders_in_area)

func _on_cooldown_timeout():
	print("Game Over")

func _on_area_2d_area_exited(area):
	if area.is_in_group("invaders"):
		invaders_in_area -= 1
	invaders_counter.text = str(invaders_in_area)		
		
func empty_territory():
	if invaders_in_area == 0:
		empty_zone = true
		cooldown.stop()
	

