extends OmniLight3D

@onready var ui_bar = $ProgressBar
var lightEnergy

func _ready() -> void:
	ui_bar.value = Game.light * 100
	#light_energy = Game.light
	
func modify_light_energy(amount: float):
	Game.light += amount
	Game.light = clamp(Game.light, 0, 1)
	ui_bar.value = Game.light * 100
	light_energy = Game.light
