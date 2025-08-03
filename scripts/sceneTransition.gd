extends CanvasLayer

# !!! Potentially redundant room saving mechanic in "Scene save logic" section
# Update Oct. 29: Scene saving will remain excusively in sceneTransition logic (this file)
# Compare to door scripts

@onready var animPlayer = $dissolveRect/AnimationPlayer
var theScene

func change_scene_to_file(target: String) -> void:
	
	# Play outro animation
	animPlayer.play("dissolve")
	await animPlayer.animation_finished
	
	# Start transition
	#Game.traveling = true
	#print(Game.loadGame())
	
	# Change Scene
	get_tree().change_scene_to_file(target)
	
	# Keep track of player progress
	#Game.locCounter.all += 1
	#print(Game.locCounter.all)
	
	# Scene save logic
	theScene = target.replace("res://scenes/","")
	theScene = theScene.replace(".tscn","")
	#if theScene != "start_menu": # Don't save title screen
		#Game.lastRoom = Game.room
		#Game.room = theScene
		#Game.saveGame()
	
	# Play intro animation
	animPlayer.play_backwards('dissolve')
	
	# End transition
	#Game.traveling = false
