extends Button

func _on_button_up():
	PlayerData.score = PlayerData.last_score
	get_tree().paused = false
	get_tree().reload_current_scene()
