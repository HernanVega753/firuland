extends RichTextLabel

var shake_intensity = 5
var shake_duration = 0.01
var shake_timer = 0.0
var original_position = Vector2()
var rect_position = Vector2()

func _ready():
	original_position = rect_position
	start_shaking(shake_duration)

func _process(delta):
	if shake_timer > 0:
		shake_timer -= delta
		rect_position = original_position + Vector2(randi_range(-shake_intensity, shake_intensity), randi_range(-shake_intensity, shake_intensity))
	else:
		rect_position = original_position

func start_shaking(duration):
	shake_timer = duration
func randi_range(min, max):
	return randi() % (max - min + 1) + min
