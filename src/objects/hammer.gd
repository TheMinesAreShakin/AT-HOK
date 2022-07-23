extends KinematicBody2D

var veloctiy: int = 1500


func _process(delta: float) -> void:
	remove_off_screen()
	move_and_collide(Vector2(
		0,
		-veloctiy * delta
	))


func remove_off_screen() -> void:
	# free when hammer moves off screen
	if $".".global_position.y < -50:
		queue_free()
