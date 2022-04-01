extends AnimatedSprite


func _process(_delta):
	if get_node("/root/sc1/personatge").get(llave) == true:
		$indicador_llave.play("got it")
	else:
		$indicador_llave.play("not")
