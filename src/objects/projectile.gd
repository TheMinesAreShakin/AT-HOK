extends KinematicBody2D

var velocity: Vector2 = Vector2.ZERO
var max_velocity: Vector2 = Vector2(300, 300)
var direction: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	remove_off_screen()
	
	velocity = direction * max_velocity
	move_and_collide(velocity * delta)


func remove_off_screen() -> void:
	# free when hammer moves off screen
	if $".".global_position.y < 0 or $".".global_position.y > ProjectSettings.get_setting("display/window/size/height"):
		queue_free()
	elif $".".global_position.x < 0 or $".".global_position.x > ProjectSettings.get_setting("display/window/size/height"):
		queue_free()
