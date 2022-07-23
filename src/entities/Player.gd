extends KinematicBody2D

var direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
export var max_velocity: Vector2 = Vector2(500, 500)

""" get window_size from project settings, create a buffer vector to prevent
sprite from going off screen, create upper and lower player limits"""
var window_size: Vector2 = Vector2(
	ProjectSettings.get_setting("display/window/size/width"),
	ProjectSettings.get_setting("display/window/size/height")
)
var player_buffer: Vector2 = Vector2(30, 40)
var player_lower_limit: Vector2 = Vector2.ZERO + player_buffer
var player_upper_limit: Vector2 = window_size - player_buffer

func _process(delta: float) -> void:
	# get player movement direction and set velocity
	direction = get_input_direction()
	velocity = direction * max_velocity
	
	# move player, this func takes care of delta for me
	velocity = move_and_slide(velocity)
	
	# clamp player position
	$".".position.x = clamp($".".position.x, player_lower_limit.x, player_upper_limit.x)
	$".".position.y = clamp($".".position.y, player_lower_limit.y, player_upper_limit.y)


func get_input_direction() -> Vector2:
	# gets normalized vector of input strength (bindings in project settings)
	return Vector2(
		Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft"),
		Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
	)
