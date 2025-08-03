extends Control

func _on_new_game_pressed():
	AudioManager.ui.play()
	await AudioManager.ui.finished
	SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	AudioManager.chirp.play()
	AudioManager.falling.play()
	await AudioManager.chirp.finished
	await AudioManager.falling.finished
	Game.new = true
	#Game.state = 0

func _on_quit_pressed():
	AudioManager.ui.play()
	await AudioManager.ui.finished
	get_tree().quit()


func _on_resume_pressed():
	AudioManager.ui.play()
	await AudioManager.ui.finished
	#var lastScene = "res://scenes/" + (str(Game.loadGame()['room'])) + ".tscn"
	#SceneTransition.change_scene_to_file(lastScene)
	pass

func _on_credits_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/credits_screen.tscn")

