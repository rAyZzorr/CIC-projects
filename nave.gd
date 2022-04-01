extends Area2D

var despegar = false


func _physics_process(_delta):
	if despegar == true:
		position.y -=3
func _on_nave_body_entered(body):
	if body.name == "personatge":
		despegar = true
