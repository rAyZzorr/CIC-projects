extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$personatge.gravetat = Vector2.DOWN * 700
	$personatge.salt = Vector2.UP * 300
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
