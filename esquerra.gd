extends Area2D





func _on_esquerra_area_entered(area):
	area.lado = "left"
	print("cambio")
