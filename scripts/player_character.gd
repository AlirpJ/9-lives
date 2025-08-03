extends CharacterBody3D


const SPEED = 0.05

var moving
var mv_endpoint

#const JUMP_VELOCITY = 4.5

@onready var light = $Light

func _physics_process(delta: float) -> void:
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
	
	if Input.is_action_just_pressed("lightCollect"):
		print("light it up!")
		light.modify_light_energy(.1)
	if Input.is_action_just_pressed("lightCollect"):
		print("light it up!")
		light.modify_light_energy(-.1)
	
	if moving:
		global_position = lerp(global_position, mv_endpoint, SPEED)
		look_at(-mv_endpoint)
		AudioManager.movement.play()
		if global_position == mv_endpoint:
			moving = false
			AudioManager.movement.stop()

# INFO: Connects to movement_arrow signal.
func _mv_arrow_selected(endpoint: Vector3) -> void:
	print("Moving!")
	moving = true
	mv_endpoint = endpoint
	
	
