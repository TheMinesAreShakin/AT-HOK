extends KinematicBody2D


export var velocity: int = 100


func _process(delta: float) -> void:
	remove_off_screen()
	move_and_collide(Vector2(
		0,
		velocity * delta
	))


func _on_HitBox_body_entered(body: Node) -> void:
	die(body)


func die(body: Node) -> void:
	body.queue_free()
	queue_free()


func remove_off_screen() -> void:
	# free when enemy moves off screen
	if $".".global_position.y > ProjectSettings.get_setting("display/window/size/height") + 35:
		queue_free()
