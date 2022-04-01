extends StaticBody2D

var estado = "desactivado"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("pont").set_deferred("disabled", true)
	$pont1.play("transparent")
	$pont2.play("transparent")
func _process(_delta):
	if estado == "activado":
		get_node("pont").set_deferred("disabled", false)
		$pont1.play("default")
		$pont2.play("default")
