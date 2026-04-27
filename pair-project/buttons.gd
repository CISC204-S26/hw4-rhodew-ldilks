extends Node2D

@export var first = 0
@export var second = 0
@export var third = 0
@export var fourth = 0
@export var fifth = 0

var code = []
var numbers_of_code = 0
var the_text = ""
var secret_code = []

signal correct_code

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func input_number(number):
	secret_code = [first, second, third, fourth, fifth]
	if numbers_of_code < 5:
		code.append(number)
		numbers_of_code += 1
		the_text = ""
		for cod in code:
			the_text += str(cod)
		$Label.text = the_text


func _on_one_button_down() -> void:
	input_number(1)


func _on_two_button_down() -> void:
	input_number(2)


func _on_three_button_down() -> void:
	input_number(3)


func _on_four_button_down() -> void:
	input_number(4)


func _on_five_button_down() -> void:
	input_number(5)


func _on_six_button_down() -> void:
	input_number(6)


func _on_seven_button_down() -> void:
	input_number(7)


func _on_eight_button_down() -> void:
	input_number(8)


func _on_nine_button_down() -> void:
	input_number(9)


func _on_zero_button_down() -> void:
	input_number(0)


func _on_yes_button_down() -> void:
	if code == secret_code:
		correct_code.emit()
		position = Vector2(-1000.0, -1000.0)
	else:
		code = []
		numbers_of_code = 0
		$Label.text = "WRONG"


func _on_keypad_input(is_interacted) -> void:
	if is_interacted == true:
		position = Vector2(450.0, 75.0)
	else:
		position = Vector2(-1000.0, -1000.0)
