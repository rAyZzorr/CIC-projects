extends Area2D

var number = 0


func _on_Portal_body_entered(body):
	if body.name == "personatge" and number == 12:
		get_tree().change_scene("res://bye.tscn")
		number = 0

		
