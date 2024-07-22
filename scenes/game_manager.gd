extends Node

@onready var points = $"../world/invaders_area/GUI/HBoxContainer3/points"

var global_score = 0

func _ready():
	var player = get_node("CharacterBody2D")


func _on_character_body_2d_score_updated(counter):
	global_score = counter
	print(global_score)
	points.text = str(global_score)
	
	

