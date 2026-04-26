extends Area2D

@export var interaction_name = "keycard"
@export var itneraction_type = "keycard"
@export var display_active = false;
@export var keycard_number = 1

func interact():
	if keycard_number == 1:
		Global.key_card_1_got = true
	if keycard_number == 2:
		Global.key_card_2_got = true
	hide()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if keycard_number == 1:
		if Global.key_card_1_got == true:
			pass
	if keycard_number == 2:
		if Global.key_card_2_got == true:
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
