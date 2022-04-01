extends Area2D




func _on_llave_body_entered(body):
	if body.name == "personatge":
		visible = false
