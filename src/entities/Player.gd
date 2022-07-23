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

# preload hammmer scene
var hammer_scene: PackedScene = preload("res://src/objects/Hammer.tscn")

# shot delay vars
onready var timer: Node = $Timer
export var shot_delay: float = 0.33

func _process(delta: float) -> void:
	# get player movement direction and set velocity
	direction = get_input_direction()
	velocity = direction * max_velocity
	
	# move player, this func takes care of delta for me
	velocity = move_and_slide(velocity)
	
	# clamp player global_position
	$".".global_position.x = clamp($".".global_position.x, player_lower_limit.x, player_upper_limit.x)
	$".".global_position.y = clamp($".".global_position.y, player_lower_limit.y, player_upper_limit.y)
	
	# check shooting
	shoot()


func get_input_direction() -> Vector2:
	# gets normalized vector of input strength (bindings in project settings)
	return Vector2(
		Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft"),
		Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
	).normalized()


func shoot() -> void:
	# if strength is 1 then shoot
	if Input.get_action_strength("Shoot") and timer.is_stopped():
		# start timer
		timer.start(shot_delay)
		
		# adds an instance of hammer as a child of the level scene
		var new_hammer: Node = hammer_scene.instance()
		# set hammer global position to global position of player
		# offset is not needed because hammer is on a layer that player is not masking
		new_hammer.global_position = $".".global_position
		
		#make hammer sprites render behind player (z_index default is 0)
		new_hammer.z_index = -1
		
		# add hammer as child of level
		get_parent().add_child(new_hammer)
