extends Node

"""I initially had the signals for update_score, player_death, and healt_update in here
but I decided to move them to the nodes that will be doing those updates in the first
place. This will also help fall into the 'signal up call down' best practice. Although
whether that will count very much with an autoload I'm not quite sure since we can always
expect the autoload to be there. but hey, loose coupling or some fancy software eng term like that"""

var score: int = 0 setget set_score, get_score
var health: int = 10 setget set_health, get_health

"""I'm storing position here so it is easily accessible for the enemy class
this is a non-standard way to do it but I think it is more readable than the
string of getting nodes that would be required otherwise. Now that I think about it
it could probably be done using a signal but this is working now so whatever."""
var position: Vector2 = Vector2.ZERO setget set_position, get_position


func set_score(value: int) -> void:
	score = value


func get_score() -> int:
	return score


func set_health(value: int) -> void:
	health = value


func get_health() -> int:
	return health


func set_position(value: Vector2) -> void:
	position = value


func get_position() -> Vector2:
	return position
