extends Area2D


func _on_conection_area_entered(area):
	if area.name == "nave":
		get_tree().change_scene("res://sc4.tscn")
