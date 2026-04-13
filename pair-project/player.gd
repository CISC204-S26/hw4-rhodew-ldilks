extends CharacterBody2D


const speed = 200.0
const JUMP_VELOCITY = -400.0

#variables
var nearby_interactibles = [];

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Vector2.ZERO #set direction var
	
	#movement input
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	direction = direction.normalized() #normalize diagnols
	velocity = direction * speed #apply movement
	move_and_slide()
	
	
	if Input.is_action_just_pressed("interact"):
		if nearby_interactibles:
			nearby_interactibles[-1].interact();
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	nearby_interactibles.append(area);

func _on_area_2d_area_exited(area: Area2D) -> void:
	nearby_interactibles.erase(area);
