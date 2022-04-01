extends Area2D

var lado = "right"
func _ready():
	rotation_degrees = 0
func _physics_process(_delta):
	anima()
	if lado == "left":
		position.x -= 5
	if lado == "right":
		position.x += 5
		
func anima():
	var animacio = $AnimatedSprite
	if lado == "right":
		rotation_degrees = 0
		animacio.flip_h = false
		animacio.play("camina")
	elif lado != "right":
		rotation_degrees = -60
		animacio.flip_h = true
		animacio.play("camina")


