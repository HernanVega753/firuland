extends CanvasLayer

var paused_game = false

func _input(event):
	if Input.is_action_just_pressed("PAUSE"):
		pause()

		
func pause():
	paused_game = not paused_game
	if paused_game == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif paused_game == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = not get_tree().paused
	$".".visible = not $".".visible

func _on_btn_reanudar_pressed():
	pause()


func _on_btn_menu_pressed():
	paused_game = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_screen.tscn")



func _on_btn_salir_pressed():
	get_tree().quit()
	
