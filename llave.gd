extends Area2D

#var got = false
#func _ready():
#	$indicador_llave.play("not")
#	$llavee.play("no")
#func _process(_delta):
#	if got == true:
#		$llavee.play("yes")
#
#		print("yes")
#		$indicador_llave.play("got it")
#		got = false
#	if $llavee.frame == 0:
#			$llavee.stop()
func _on_llave_body_entered(body):
	if body.name == "personatge":
		visible = false
		print("hide")
#func _on_llave_body_exited(body):
#	if body.name == "personatge":
#		got = true
#		print("got it")
