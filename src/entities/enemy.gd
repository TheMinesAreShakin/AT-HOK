extends KinematicBody2D

export var set_fire = true
export var velocity: int = 100
export var fire_delay: float = 1.5
var projectile: PackedScene = preload("res://src/objects/Projectile.tscn")

func _process(delta: float) -> void:
	remove_off_screen()
	move_and_collide(Vector2(
		0,
		velocity * delta
	))
	fire()


func _on_HitBox_body_entered(body: Node) -> void:
	die(body)


func die(body: Node) -> void:
	body.queue_free()
	queue_free()


func remove_off_screen() -> void:
	# free when enemy moves off screen
	if $".".global_position.y > ProjectSettings.get_setting("display/window/size/height") + 35:
		queue_free()


func fire() -> void:
	if $Timer.is_stopped() and set_fire:
		# instance projectile
		var new_projectile: Node = projectile.instance()
		# set projectile position to position of emitter
		new_projectile.global_position = $ProjectileEmmiter.global_position
		# set normalized vector of direction toward player from proj emmiter
		var player_direction: Vector2 = Vector2(
			(PlayerData.position.x - $ProjectileEmmiter.global_position.x),
			(PlayerData.position.y - $ProjectileEmmiter.global_position.y)
		).normalized()
		# if the player is past the enemy just shoot forward
		if player_direction.y < 0:
			player_direction = Vector2.DOWN
		new_projectile.direction = player_direction
		# add to parent scene so that projectile is not deleted if enemy is killed
		get_parent().add_child(new_projectile)
		# start timer
		$Timer.start(fire_delay)
