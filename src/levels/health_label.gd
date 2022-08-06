extends Label

#i didn't make this an onready var because I don't think it needs it, we shall see
var last_health: int = PlayerData.health


func _ready() -> void:
	$".".text = get_health_text()


func _process(delta: float) -> void:
	if last_health != PlayerData.health:
		$".".text = get_health_text()
		last_health = PlayerData.health


func get_health_text() -> String:
	return "Health: %d" % PlayerData.health
