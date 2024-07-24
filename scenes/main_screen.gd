extends Control


func _ready():
	$audio_main_screen.play()

func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
	
