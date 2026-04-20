class_name Note extends Area2D

@export var interaction_name = "note"
@export var itneraction_type = "note"
@export var display_active = false;

var is_interacted: bool = false;
@export var the_text = ""

signal reading

func interact():
	is_interacted = !is_interacted
	reading.emit(is_interacted)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_exited(body: Node2D) -> void:
	is_interacted = false
	reading.emit(is_interacted)
