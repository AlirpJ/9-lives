extends Control

func _on_new_game_pressed():
	SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	Game.new = true
	#Game.state = 0

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/credits_screen.tscn")
