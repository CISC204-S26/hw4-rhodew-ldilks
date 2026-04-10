class_name Switch extends Area2D

@export var interaction_name = "test_interaction"
@export var itneraction_type = "test"
@export var display_active = false;

var is_switched: bool = false;

signal switcheroo

func interact():
	is_switched = !is_switched
	print_debug(is_switched)
	switcheroo.emit(is_switched)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
