extends OmniLight3D

@onready var ui_bar = $ProgressBar
var lightEnergy

func _ready() -> void:
	ui_bar.value = Game.light * 100
	#light_energy = Game.light
	#print(light_energy)
	
func modify_light_energy(amount: float):
	Game.light += amount
	Game.light = clamp(Game.light, 0, 1)
	ui_bar.value = Game.light * 100
	light_energy = Game.light

# Add function to die if lightCollect is gone: 
