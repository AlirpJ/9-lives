extends Control


func _on_new_game_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	AudioManager.chirp.play()
	AudioManager.falling.play()
	Game.new = true
	RoomGen.resetRooms()
	Game.lives = 9
	#Game.state = 0


func _on_quit_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/start_menu.tscn")
	RoomGen.resetRooms()
