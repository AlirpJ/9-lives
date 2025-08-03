extends OmniLight3D

@onready var ui_bar = $ProgressBar

func _ready() -> void:
	ui_bar.value = light_energy * 100
	
func modify_light_energy(amount: float):
	light_energy += amount
	light_energy = clamp(light_energy, 0, 1)
	ui_bar.value = light_energy * 100

# Add function to die if lightCollect is gone: 
