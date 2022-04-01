extends Area2D

func _on_Alien_body_entered(body):
	if body.name == "personatge":
		body.reset()


func _on_Alien_area_entered(area):
	get_node("/root/sc4/Portal").number += 1
	area.queue_free()
	queue_free()
