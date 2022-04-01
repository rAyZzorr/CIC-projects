extends Area2D



func _physics_process(_delta):
	$AnimatedSprite.play("default")
	position.x += 3
