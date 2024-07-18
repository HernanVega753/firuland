extends Area2D

@onready var npc = preload("res://scenes/npc_mary.tscn")
@onready var npc2 = preload("res://scenes/npc_richard.tscn")
@onready var npc3 = preload("res://scenes/npc_jhon.tscn")
@onready var npc4 = preload("res://scenes/npc_sophie.tscn")
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	
func _process(delta):
	spawn()
	
func spawn():
	if bool_spawn:
		for i in range(5):
			bool_spawn = false
			var npc_instance = npc.instantiate()
			npc_instance.position = Vector2(random.randi_range(0, 150), random.randi_range(0,80))
			add_child(npc_instance)
			npc_instance = npc2.instantiate()
			npc_instance.position = Vector2(random.randi_range(0, 150), random.randi_range(0,80))
			add_child(npc_instance)
			npc_instance = npc3.instantiate()
			npc_instance.position = Vector2(random.randi_range(0, 150), random.randi_range(0,80))
			add_child(npc_instance)
			npc_instance = npc4.instantiate()
			npc_instance.position = Vector2(random.randi_range(0, 150), random.randi_range(0,80))
			add_child(npc_instance)
