extends Node

var saveLocation = "user://saveGame.save"
var dx = false
var new = false
var room = "home"
#var position = Vector3(0,0,0)
var lastRoom = ""
var state = 0
var time = 120
var lives = 9
var light = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#loadGame()
	pass
	
# Called when the node enters the scene tree for the first time.
func save():
	var save_dict = {
		"new" : new,
		"room" 			: room,
		"lastRoom" 		: lastRoom,
		"state"			: state,
		"time"			: time,
		"lives"			: lives,
		"light"		: light
		#"positionX" : position.x,
		#"positionY" : position.y,
		#"positionZ" : position.z
		
		
	}
	return save_dict
	
func saveGame(): 
	var mySave = FileAccess.open(saveLocation, FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	mySave.store_line(json_string)
	
func loadGame():
	if not FileAccess.file_exists(saveLocation):
		return
	var mySave = FileAccess.open(saveLocation, FileAccess.READ)
	while mySave.get_position() < mySave.get_length():
		var json_string = mySave.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		return node_data


	
#func DialogicSignal(argument:String):
	#if argument == "end":
		#dx = false

#func loadDia(x,num):
	## X is string name of dialog
	## num is what state to update the character to
	#
	##Dialogic.signal_event.connect(DialogicSignal)
	#
	#if dx == false:
		#dx = true
		#Dialogic.start(x)
		#if num == -1: # num as -1 denotes the end of a dialogic, don't change anything anymore
			##Game.state = Game.state
			#pass
		#else:
			#Game.state = num
	#Dialogic.timeline_ended.connect(ended)
	##ended()
	##Dialogic.timeline_ended.disconnect(_on_timeline_ended)
