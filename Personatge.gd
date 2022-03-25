extends KinematicBody2D

var llave = false
var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 400


func _ready():
	position = Vector2(40, 560)
func _physics_process(delta):
	velocitat.x = 0
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou_amunt") and is_on_floor():
		velocitat += salt
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat: Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play("camina")
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')

	if velocitat.y < -1:
		animacio.play("salta")
	if abs(velocitat.x) < 0.5:
		animacio.play('default')

func _on_Lava_body_entered(body):
	position = Vector2(40, 560)
#	get_tree().quit()

func _on_Escaleras_body_entered(body):
	position = Vector2(950, 225)
	salt = Vector2.UP * 600

func _on_problemasp2_body_entered(body):
	position = Vector2(40, 560)
	llave = false
	salt = Vector2.UP * 450
	if llave == true:
		get_node("llave").show()
		
func _on_llave_body_exited(body):
	get_node("llave/clau").hide()
	llave = true
	

func _on_puerta_body_entered(body):
	if llave == true:
		get_tree().change_scene("res://sc2.tscn")
	else:
		position = Vector2(950, 225)


