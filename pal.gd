extends Area2D


func _on_pal_body_entered(_body):
	get_node("/root/sc1/puente").estado = "activado"
	
