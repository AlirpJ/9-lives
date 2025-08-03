extends Control

func _on_play_again_pressed() -> void:
	AudioManager.chirp.play()
	AudioManager.falling.play()
	await AudioManager.chirp.finished
	await AudioManager.falling.finished
	SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	Game.new = true
	#Game.state = 0

func _on_quit_pressed() -> void:
	AudioManager.ui.play()
	await AudioManager.ui.finished
	SceneTransition.change_scene_to_file("res://scenes/start_menu.tscn")
