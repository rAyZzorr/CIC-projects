extends Area2D




func _on_techo_body_entered(body):
	if body.name == "personatge":
		body.reset()
