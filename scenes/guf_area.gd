extends Area2D
@onready var guf_area = $"."
var counter = 0


		

func _on_area_entered(area):
	if area.is_in_group("hitbox"):
		counter += 1
		print(counter)
	
