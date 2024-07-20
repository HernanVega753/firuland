extends Control

@onready var timer = $Timer

func _ready():
	# Conectar la señal del personaje a la función 'guf_control'
	get_node("/root/CharacterBody2D").connect("guf_action_signal", self, "guf_control")

func guf_control():
	self.visible = true
	timer.start(1.0) # Inicia el temporizador para 1 segundo

func _on_Timer_timeout():
	self.visible = false
