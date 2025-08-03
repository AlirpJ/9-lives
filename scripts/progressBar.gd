extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var barColor = Color.hex(0xe6db9e)
	print(barColor)
	#self.Color(barColor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
