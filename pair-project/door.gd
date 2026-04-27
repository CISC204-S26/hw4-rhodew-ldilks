extends StaticBody2D

var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func switch():
	is_open = !is_open
	if is_open == true:
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		show()
		$CollisionShape2D.set_deferred("disabled", false)


func _on_switch_switcheroo() -> void:
	switch()


func _on_keypad_switcheroo() -> void:
	switch()


func _on_keycard_reader_unlocked() -> void:
	switch()


func _on_switch_3_switcheroo() -> void:
	switch()


func _on_switch_2_switcheroo() -> void:
	switch()


func _on_switch_4_switcheroo() -> void:
	switch()


func _on_switch_5_switcheroo() -> void:
	switch()


func _on_switch_6_switcheroo() -> void:
	switch()
