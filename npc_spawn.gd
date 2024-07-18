extends Area2D

@onready var npc = preload("res://scenes/npc_mary.tscn")
@onready var npc2 = preload("res://scenes/npc_richard.tscn")
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	
func _process(delta):
	spawn()
	
func spawn():
	if bool_spawn:
		$cooldown.start()
		bool_spawn = false
		var npc_instance = npc.instantiate()
		npc_instance.position = Vector2(random.randi_range(0, 70), random.randi_range(0,80))
		add_child(npc_instance)
		npc_instance = npc2.instantiate()
		npc_instance.position = Vector2(random.randi_range(0, 70), random.randi_range(0,80))
		add_child(npc_instance)


		

func _on_cooldown_timeout():
	bool_spawn = true
