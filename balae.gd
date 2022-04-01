extends Area2D


func _physics_process(_delta):
	position.x -= 15
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
