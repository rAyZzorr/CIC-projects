extends Area2D


func _ready():
	$AnimatedSprite.play("default")
	$AnimatedSprite2.play("default")
func _on_puerta_body_entered(body):
	$AnimatedSprite.play("open")
	$AnimatedSprite2.play("open")
