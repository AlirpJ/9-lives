extends Control


func _on_menu_pressed() -> void:
	AudioManager.ui.play()
	await AudioManager.ui.finished
	SceneTransition.change_scene_to_file("res://scenes/start_menu.tscn")
