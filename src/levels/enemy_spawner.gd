extends Node2D


var enemy_scene: PackedScene = preload("res://src/entities/Enemy.tscn")

# setup rng
var rng: = RandomNumberGenerator.new()
var spawner_x_limits: Vector2 = Vector2(35, (ProjectSettings.get_setting("display/window/size/width") - 35))

var spawn_delay: float = 1


func _ready() -> void:
	# seed rng
	rng.randomize()


func _process(delta: float) -> void:
	if $Timer.is_stopped():
		spawn_enemy()
		$Timer.start(spawn_delay)


func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instance()
	
	# chose -35 as y because that will put sprite just off screen
	var randx = rng.randi_range(spawner_x_limits.x, spawner_x_limits.y)
	new_enemy.position = Vector2(randx, -36)
	
	get_parent().add_child(new_enemy)
