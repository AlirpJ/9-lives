extends Control

@onready var playerScript = $"../../../../"


func _on_resume_pressed():
	playerScript.pauseMenu()

func _on_main_menu_pressed():
	Engine.time_scale = 1
	SceneTransition.change_scene_to_file("res://scenes/title_screen.tscn")

func _on_quit_pressed():
	get_tree().quit()
