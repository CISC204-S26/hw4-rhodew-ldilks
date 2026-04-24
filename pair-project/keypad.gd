class_name Keypad extends Area2D

@export var interaction_name = "keypad"
@export var itneraction_type = "keypad"
@export var display_active = false;

var is_interacted: bool = false;
var is_triggered = false
var correct = false

signal input
signal switcheroo

func interact():
	if correct == false:
		is_interacted = !is_interacted
		input.emit(is_interacted)
	else:
		is_triggered = !is_triggered
		switcheroo.emit()
		if is_triggered == true:
			$Sprite2D.hide()
			$Sprite2D2.show()
		else:
			$Sprite2D.show()
			$Sprite2D2.hide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_exited(body: Node2D) -> void:
	if correct == false:
		is_interacted = false
		input.emit(is_interacted)


func _on_area_exited(area: Area2D) -> void:
	if correct == false:
		is_interacted = false
		input.emit(is_interacted)


func _on_buttons_correct_code() -> void:
	correct = true
	is_interacted = true
	interact()
