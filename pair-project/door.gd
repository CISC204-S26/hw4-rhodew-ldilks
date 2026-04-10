extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_switch_switcheroo(is_switched) -> void:
	if is_switched == true:
		hide()
	else:
		show()
