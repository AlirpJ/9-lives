extends Node

signal mv_arrow_selected

@export var direction: String

@onready var mark = $OmniLight3D
@onready var movement_arrow: StaticBody3D = $"."
@onready var movement_arrow_2: StaticBody3D = $"../MovementArrow2"
@onready var movement_arrow_3: StaticBody3D = $"../MovementArrow3"
@onready var movement_arrow_4: StaticBody3D = $"../MovementArrow4"

var choice
var lastRoom
var nextRoom

func newRoom(roomChoice):
	if(roomChoice == 0):
		var finalChoice = "res://scenes/startRoom.tscn"
		SceneTransition.change_scene_to_file(finalChoice)
	else:
		RoomGen.roomGen(RoomGen.currentRoom,roomChoice)
		var finalChoice = "res://scenes/room"+str(roomChoice)+".tscn"
		SceneTransition.change_scene_to_file(finalChoice)
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseMotion:
		pass
	if event is InputEventMouseButton and Input.is_action_just_pressed("MouseSelect"):
		if movement_arrow.name == "finaleArrow":
			SceneTransition.change_scene_to_file("res://scenes/victory_screen.tscn")
			return
		mv_arrow_selected.emit(self.global_position)
		var maxVal = RoomGen.rooms[RoomGen.currentRoom].size()
		
		match movement_arrow.name:
			"MovementArrow":
				choice = RoomGen.rooms[RoomGen.currentRoom][0]
			"MovementArrow2":
				if maxVal > 1:
					choice = RoomGen.rooms[RoomGen.currentRoom][1]
				else:
					choice = -1
			"MovementArrow3":
				if maxVal > 2:
					choice = RoomGen.rooms[RoomGen.currentRoom][2]
				else:
					choice = -1
			"MovementArrow4":
				if maxVal > 3:
					choice = RoomGen.rooms[RoomGen.currentRoom][3]
				else:
					choice = -1
				

		if choice == -1:
			choice = RoomGen.rooms[RoomGen.currentRoom][0]
		newRoom(choice)


func _on_area_3d_area_entered(area: Area3D) -> void:
	# TODO: Transition to next area.
	#mark.light_energy = 0.4
	pass


func _on_mv_arrow_selected() -> void:
	pass # Replace with function body.


func _on_area_3d_area_exited(area: Area3D) -> void:
	#mark.light_energy = 0.0 # Replace with function body.
	pass
