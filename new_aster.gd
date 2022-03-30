extends Area2D



export var gravetat =  200
var estado = false


func _ready():
	anima("ready")

	
func _physics_process(delta):
	position.y += gravetat * delta
	
func _on_new_aster_area_entered(area):
	pass # Replace with function body.


func _on_new_aster_body_entered(body):
	if body.name == "personatge":
		body.reset()
	elif body.name == "suelo" and estado == false:
		position.y = 510
		gravetat = 0
		get_node("CollisionPolygon2D").set_deferred("disabled", true)
		anima("destroy")
		estado = true
	elif estado == true:
		pass

		
func anima(options):
	var animacio = $AnimatedSprite
	if options == "ready":
		animacio.play('default')
	elif options == "destroy":
		animacio.play('destroy')
		if animacio.frame == 3:
			animacio.stop()
			print("done")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'destroy':
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 3
