extends AnimationPlayer
@onready var animation_player = $"."

func _process(delta):
	if Input.is_action_pressed("GUF"):
		animation_player.play("guf_animation")
