extends Area2D

var lado = "right"

func _physics_process(delta):
	if lado == "left":
		print("true")
		position.x -= 5
	if lado == "right":
		position.x += 5
	

