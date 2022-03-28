extends Area2D



var gravetat =  50
var estado = false


func _ready():
	anima("ready")
	position = Vector2(50, 100)
	
func _physics_process(delta):
	position.y += gravetat * delta
	anima("ready")
	
func _on_new_aster_area_entered(area):
	pass # Replace with function body.


func _on_new_aster_body_entered(body):
	if body.name == "personatge":
		body.reset()
	elif body.name == "suelo":
		position.y = 560
		get_node("CollisionPolygon2D").set_deferred("disabled", true)
		anima("destroy")
		

		
func anima(options):
	var animacio = $AnimatedSprite
	if options == "ready":
		animacio.play('default')
	elif options == "destroy":
		animacio.play('destroy')
		if animacio.frame == 3:
			animacio.stop()
