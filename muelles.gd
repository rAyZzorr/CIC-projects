extends Area2D


func _ready():
	$AnimatedSprite.play("descomp")
	$AnimatedSprite2.play("descomp")
	$AnimatedSprite3.play("descomp")
	$AnimatedSprite4.play("descomp")
	
func _on_muelles_body_exited(_body):
	$AnimatedSprite.play("descomp")
	$AnimatedSprite2.play("descomp")
	$AnimatedSprite3.play("descomp")
	$AnimatedSprite4.play("descomp")


func _on_muelles_body_entered(_body):
	$AnimatedSprite.play("comp")
	$AnimatedSprite2.play("comp")
	$AnimatedSprite3.play("comp")
	$AnimatedSprite4.play("comp")
