extends Control


func _on_menu_pressed() -> void:
	SceneTransition.change_scene_to_file("res://scenes/start_menu.tscn")
