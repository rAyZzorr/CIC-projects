extends KinematicBody2D


var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 50
var estado = false


func _ready():
	anima("ready")
	position = Vector2(860, 100)
func _physics_process(delta):
	if is_on_floor():
		for index in get_slide_count():
			var collision = get_slide_collision(index)
			if collision:
				if collision.collider.name.begins_with("personatge"):
					anima("destroy")
					position = Vector2(860, 560)
					get_node("CollisionPolygon2D").set_deferred("disabled", true)
					estado = true
				elif collision.collider.name.begins_with("asteroid"):
					velocitat += gravetat * delta
					velocitat = move_and_slide(velocitat, Vector2.UP)
					anima("ready")
				elif collision.collider.name.begins_with("suelo"):
					anima("destroy")
					estado = false
					get_node("CollisionPolygon2D").set_deferred("disabled", true)
				else:
					pass
			else:
				pass
	else:
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		anima("ready")
		
		
func anima(options):
	var animacio = $AnimatedSprite
	if options == "ready":
		animacio.play('default')
	elif options == "destroy":
		animacio.play('destroy')
		if animacio.frame == 3:
			animacio.stop()
