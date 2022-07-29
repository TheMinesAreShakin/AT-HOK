extends Label


func _ready() -> void:
	$".".text = get_health_text()


func _on_Player_health_updated() -> void:
	$".".text = get_health_text()


func get_health_text() -> String:
	return "Health: %d" % PlayerData.health
