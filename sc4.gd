extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("personatge").multiplier_salt = 600
	get_node("personatge").multiplicador = 100
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
