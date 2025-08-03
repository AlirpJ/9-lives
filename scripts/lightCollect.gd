extends Node

signal mv_arrow_selected

@onready var fade = $OmniLight3D
@export var direction: String
@onready var selfish = $"."
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
	
	if event is InputEventMouseButton and Input.is_action_just_pressed("MouseSelect"):
		mv_arrow_selected.emit(self.global_position)
		Game.light += 0.5
		AudioManager.light_acquired.play()
		#lerp(global_position, mv_endpoint, SPEED)
		fade.light_energy = 0.1
		#selfish.set_visible(false)

		
		
func _on_area_3d_area_entered(area: Area3D) -> void:
	# TODO: Transition to next area.
	pass


func _on_mv_arrow_selected() -> void:
	pass # Replace with function body.
