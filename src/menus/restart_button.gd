extends Button


var first_level_scene: String = "res://src/levels/Level01.tscn"


func _on_button_up() -> void:
	PlayerData.reset_game()
	get_tree().change_scene(first_level_scene)
