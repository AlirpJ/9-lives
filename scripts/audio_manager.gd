extends Node

@onready var falling: AudioStreamPlayer = $Falling
@onready var chirp: AudioStreamPlayer = $Chirp
@onready var bgm: AudioStreamPlayer = $bgm
@onready var bell_jingle: AudioStreamPlayer = $BellJingle
@onready var clock_t_icking: AudioStreamPlayer = $ClockTIcking
@onready var death: AudioStreamPlayer = $Death
@onready var whispers: AudioStreamPlayer = $Whispers
@onready var echoes: AudioStreamPlayer = $Echoes
@onready var warning: AudioStreamPlayer = $Warning
@onready var light_acquired: AudioStreamPlayer = $LightAcquired
@onready var water_drip: AudioStreamPlayer = $WaterDrip
@onready var movement: AudioStreamPlayer = $Movement
@onready var ui: AudioStreamPlayer = $UI

func start_bgm():
	if not bgm.is_playing():
		bgm.play()
	water_drip.play()
	
