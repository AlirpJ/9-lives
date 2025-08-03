extends Node

signal mv_arrow_selected

@export var direction: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	
	if event is InputEventMouseButton and Input.is_action_just_pressed("MouseSelect"):
		mv_arrow_selected.emit(self.global_position)



func _on_area_3d_area_entered(area: Area3D) -> void:
	# TODO: Transition to next area.
	pass 
