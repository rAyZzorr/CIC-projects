extends Area2D

func _on_Alien_body_entered(body):
	if body.name == "personatge":
		body.reset()


func _on_Alien_area_entered(area):
	area.queue_free()
	queue_free()
