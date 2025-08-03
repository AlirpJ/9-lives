extends Control

func _ready() -> void:
	AudioManager.death.play()

func _on_new_game_pressed() -> void:
	AudioManager.chirp.play()
	AudioManager.falling.play()
	await AudioManager.chirp.finished
	await AudioManager.falling.finished
	SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	Game.new = true
	RoomGen.resetRooms()
	Game.lives = 9
	#Game.state = 0


func _on_quit_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/start_menu.tscn")
	RoomGen.resetRooms()
