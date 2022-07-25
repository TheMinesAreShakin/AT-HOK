extends Node

# defines custom signals that can be emitted using emit_signal("[signal name]")
signal score_updated
signal player_died
signal player_lost_health

var score: int = 0 setget set_score, get_score
var health: int = 0 setget set_health, get_health

"""I'm storing position here so it is easily accessible for the enemy class
this is a non-standard way to do it but I think it is more readable than the
string of getting nodes that would be required otherwise"""
var position: Vector2 = Vector2.ZERO setget set_position, get_position


func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")


func get_score() -> int:
	return score


func set_health(value: int) -> void:
	health = value
	emit_signal("player_lost_health")
	
	if health <= 0:
		emit_signal("player_died")


func get_health() -> int:
	return health


func hit_player_for(damage_amount: int):
	# specifying self.health will use the setter function as well
	#self.health -= damage_amount
	# I think the following way makes the code more explicit #thezenofpython
	set_health(health - damage_amount)


func set_position(value: Vector2) -> void:
	position = value


func get_position() -> Vector2:
	return position
