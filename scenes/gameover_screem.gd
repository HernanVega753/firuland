extends Control




func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	



func _on_salir_pressed():
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")
