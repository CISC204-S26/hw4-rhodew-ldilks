extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#variables
var nearby_interactibles = [];


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("input"):
		nearby_interactibles[-1].interact();
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	nearby_interactibles.append(area);
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	nearby_interactibles.erase(area);
	pass # Replace with function body.
