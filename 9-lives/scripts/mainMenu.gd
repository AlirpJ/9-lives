extends Control

func _on_new_game_pressed():
	#SceneTransition.change_scene_to_file("res://scenes/home.tscn")
	#Game.new = true
	#Game.state = 0
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_resume_pressed():
	#var lastScene = "res://scenes/" + (str(Game.loadGame()['room'])) + ".tscn"
	#SceneTransition.change_scene_to_file(lastScene)
	pass
