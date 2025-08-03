extends Control


@onready var lifeText = $lives

@onready var life1 = $Life1
@onready var life2 = $Life2
@onready var life3 = $Life3
@onready var life4 = $Life4
@onready var life5 = $Life5
@onready var life6 = $Life6
@onready var life7 = $Life7
@onready var life8 = $Life8
@onready var life9 = $Life9

func _ready():
	lifeText.set_text("Lives remaining: "+str(Game.lives)) 
	life1.visible = true
	life2.visible = true
	life3.visible = true
	life4.visible = true
	life5.visible = true
	life6.visible = true
	life7.visible = true
	life8.visible = true
	life9.visible = true

func _process(delta: float) -> void:
	lifeText.set_text("Lives remaining: "+str(Game.lives))  
	match Game.lives:
		9:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = true
			life6.visible = true
			life7.visible = true
			life8.visible = true
			life9.visible = true
		8:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = true
			life6.visible = true
			life7.visible = true
			life8.visible = true
			life9.visible = false
		7:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = true
			life6.visible = true
			life7.visible = true
			life8.visible = false
			life9.visible = false
		6:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = true
			life6.visible = true
			life7.visible = false
			life8.visible = false
			life9.visible = false
		5:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = true
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
		4:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = true
			life5.visible = false
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
		3:
			life1.visible = true
			life2.visible = true
			life3.visible = true
			life4.visible = false
			life5.visible = false
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
		2:
			life1.visible = true
			life2.visible = true
			life3.visible = false
			life4.visible = false
			life5.visible = false
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
		1:
			life1.visible = true
			life2.visible = false
			life3.visible = false
			life4.visible = false
			life5.visible = false
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
		0:
			life1.visible = false
			life2.visible = false
			life3.visible = false
			life4.visible = false
			life5.visible = false
			life6.visible = false
			life7.visible = false
			life8.visible = false
			life9.visible = false
