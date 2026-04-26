class_name Interactable extends Area2D

@export var interaction_name = "keycard_reader"
@export var itneraction_type = "keycard_reader"
@export var display_active = false;

signal unlocked

func interact():
	if Global.key_card_1_got == true:
		$Sprite2D.hide()
		$Sprite2D2.show()
		$Sprite2D3.hide()
		$Sprite2D4.hide()
		if Global.key_card_2_got == true:
			$Sprite2D.hide()
			$Sprite2D2.hide()
			$Sprite2D3.hide()
			$Sprite2D4.show()
			unlocked.emit()
	else:
		if Global.key_card_2_got == true:
			$Sprite2D.hide()
			$Sprite2D2.hide()
			$Sprite2D3.show()
			$Sprite2D4.hide()
		else:
			$Sprite2D.show()
			$Sprite2D2.hide()
			$Sprite2D3.hide()
			$Sprite2D4.hide()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
