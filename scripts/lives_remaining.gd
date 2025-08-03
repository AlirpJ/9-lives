extends Control


@onready var lifeText = $lives

func _ready():
	lifeText.set_text("Lives remaining: "+str(Game.lives)) 


func _process(delta: float) -> void:
	lifeText.set_text("Lives remaining: "+str(Game.lives))  
