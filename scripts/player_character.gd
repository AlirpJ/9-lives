extends CharacterBody3D


const SPEED = 0.05

var moving
var mv_endpoint
var removeLight = -0.2

#const JUMP_VELOCITY = 4.5

@onready var light = $Light

func _physics_process(delta: float) -> void:
	if Game.light <= 0.1:
		die()
		RoomGen.resetRooms()
	# NOTE: Temporary CBVC. Please remove if we're not using buttons for input.
	
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
	#	velocity.x = direction.x * SPEED
	#	velocity.z = direction.z * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	velocity.z = move_toward(vedlocity.z, 0, SPEED)

	#move_and_slide()
	
	#if Input.is_action_just_pressed("lightCollect"):
		#light.modify_light_energy(removeLight * -1)
	if Input.is_action_just_pressed("lightCollect2"):
		light.modify_light_energy(removeLight)
	
	if moving:
		global_position = lerp(global_position, mv_endpoint, SPEED)
		look_at(-mv_endpoint)
		AudioManager.movement.play()
		if global_position == mv_endpoint:
			moving = false
			AudioManager.movement.stop()

func die():
	if Game.lives > 1:
		Game.lives -= 1
		Game.light == 1
		RoomGen.currentRoom = 0
		#SceneTransition.change_scene_to_file("res://scenes/LivesRemaining.tscn")
		SceneTransition.change_scene_to_file("res://scenes/startRoom.tscn")
	else:
		SceneTransition.change_scene_to_file("res://scenes/lose_screen.tscn")
		RoomGen.resetRooms()

# INFO: Connects to movement_arrow signal.
# actually use the function(s) under this one lol
func mv_arrow_selected(endpoint: Vector3) -> void:
	moving = true
	mv_endpoint = endpoint
	light.modify_light_energy(removeLight)
	
# INFO: Connects to movement_arrow signal.
func _on_movement_arrow_mv_arrow_selected(endpoint: Vector3) -> void:
	moving = true
	mv_endpoint = endpoint
	light.modify_light_energy(removeLight)


func _on_movement_arrow_2_mv_arrow_selected(endpoint: Vector3) -> void:
	moving = true
	mv_endpoint = endpoint
	light.modify_light_energy(removeLight)


func _on_movement_arrow_3_mv_arrow_selected(endpoint: Vector3) -> void:
	moving = true
	mv_endpoint = endpoint
	light.modify_light_energy(removeLight)


func _on_movement_arrow_4_mv_arrow_selected(endpoint: Vector3) -> void:
	moving = true
	mv_endpoint = endpoint
	light.modify_light_energy(removeLight)


func _on_light_collect_mv_arrow_selected() -> void:
	pass # Replace with function body.
