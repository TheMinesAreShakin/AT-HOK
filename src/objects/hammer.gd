extends KinematicBody2D

var veloctiy: int = 3000


func _process(delta: float) -> void:
	$".".position.y -= veloctiy * delta
