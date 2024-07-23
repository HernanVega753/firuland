extends Sprite2D

var dir = Vector2(1,1)
var speed = 500

func _physics_process(delta):
	scroll_base_offset += dir*speed*delta
