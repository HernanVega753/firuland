extends CanvasLayer

func _input(event):
	if Input.is_action_just_pressed("PAUSE"):
		pause()
		
func pause():
	get_tree().paused = not get_tree().paused
	$".".visible = not $".".visible

func _on_btn_reanudar_pressed():
	pause()


func _on_btn_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")



func _on_btn_salir_pressed():
	get_tree().quit()
