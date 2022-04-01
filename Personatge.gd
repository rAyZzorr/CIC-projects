extends KinematicBody2D

onready var bala = preload("res://bala.tscn")
onready var balae = preload("res://balae.tscn")
var b
var be




var llave = false
var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 400
var lado = "right"
var contador_balas = 0
var on_escala = false
var muelle = false

func _ready():
	position = Vector2(40, 520)
func _physics_process(delta):
	if on_escala == false:
		velocitat.x = 0
		if Input.is_action_just_pressed("dispara"):
			if get_tree().current_scene.name == "sc4":
				if contador_balas <= 20:
					if lado == "right":
						b = bala.instance()
						get_parent().add_child(b)
						b.global_position = $Position2D.global_position
					elif lado == "left":
						be = balae.instance()
						get_parent().add_child(be)
						be.global_position = $pos2.global_position
					contador_balas +=1
			else:
				pass
		if Input.is_action_pressed("mou_dreta"):
			velocitat += Vector2.RIGHT * velocitat_base
		if Input.is_action_pressed("mou_esquerra"):
			velocitat += Vector2.LEFT * velocitat_base
		if Input.is_action_just_pressed("mou_amunt") and is_on_floor():
			velocitat += salt
			muelle = false
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		anima(velocitat)
	elif on_escala == true:
		velocitat.x = 0
		velocitat += Vector2.UP*2
		velocitat = move_and_slide(velocitat, Vector2.UP)
func anima(velocitat: Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x > 0:
		lado = "right"
		animacio.flip_h = false
		animacio.play("camina")
	elif velocitat.x < 0:
		lado = "left"
		animacio.flip_h = true
		animacio.play('camina')

	if velocitat.y < -1:
		animacio.play("salta")
	if abs(velocitat.x) < 0.5:
		animacio.play('default')
func _on_Lava_body_entered(body):
	if body.name == "personatge":
		get_tree().change_scene("res://GAME OVER.tscn")
func _on_Escaleras_body_entered(_body):
	$AnimatedSprite.play("default")
	$AnimatedSprite.flip_h = true
	on_escala = true
func _on_conexion_body_entered(body):
	if body.name == "personatge":
		position = Vector2(950, 210)
#		salt = Vector2.UP * 600
		on_escala = false
func _on_problemasp2_body_entered(body):
	if body.name == "personatge":
		
		llave = false
		salt = Vector2.UP * 400
		get_tree().change_scene("res://GAME OVER.tscn")	
func _on_llave_body_exited(_body):
	llave = true
	print(llave)
func _on_puerta_body_entered(_body):
	if llave == true:
		get_tree().change_scene("res://sc2.tscn")
	else:
		position = Vector2(950, 225)
func _on_portal_1_body_entered(body):
	if body.name.begins_with("asteroid"):
		pass
	else:
		print("inside")
		get_tree().change_scene("res://sc3.tscn")
func _on_nave_body_entered(_body):
	get_tree().change_scene("res://sc4.tscn")
func reset():
	get_tree().change_scene("res://GAME OVER.tscn")
	position = Vector2(40, 520)
func _on_Foc_body_entered(body):
	if body.name.begins_with("personatge"):
		on_escala = true
func _on_muelles_body_entered(body):
	if body.name == "personatge":
		salt = Vector2.UP * 600
		muelle = true
func _on_muelles_body_exited(body):
	if body.name == "personatge":
		salt = Vector2.UP * 400
		muelle = false

