extends Sprite


func _physics_process(delta):
	position.x += 15


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


