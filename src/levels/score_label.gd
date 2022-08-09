extends Label

#i didn't make this an onready var because I don't think it needs it, we shall see
var last_score: int = PlayerData.score


func _ready() -> void:
	$".".text = get_score_text()


func _process(delta: float) -> void:
	if last_score != PlayerData.score:
		$".".text = get_score_text()
		last_score = PlayerData.score


func get_score_text() -> String:
	return "Score: %d" % PlayerData.score
