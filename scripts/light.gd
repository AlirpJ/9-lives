extends OmniLight3D

@onready var ui_bar = $ProgressBar
var lightEnergy

func _process(float) -> void:
	ui_bar.value = Game.light * 100

func _ready() -> void:
	ui_bar.value = Game.light * 100
	#ui_bar.font_outline_color = Color.hex(0xe6db9e)
	#light_energy = Game.light
	
func modify_light_energy(amount: float):
	Game.light += amount
	Game.light = clamp(Game.light, 0, 1)
	ui_bar.value = Game.light * 100
	light_energy = Game.light
