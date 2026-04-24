extends Control
@onready var label: RichTextLabel = $RichTextLabel
@onready var face: TextureRect = $TextureRect

@export var faces: Array[Texture2D]

@export var lines: Array[String] = [
	"first string",
	"second string",
	"third string",
	"fourth string",
	"fifth and final string."
];

var current_line: int = 0;
var current_letter: float = 0.0;
@export var typing_speed: float = 0.02; #lower = faster, higher = slower
var can_skip: bool = true;
var can_progress: bool = false;
var in_tag = false;

var current_text: String = "default text";
var text_to_display: String = "default text";

func _ready():
	
	_new_line()

func _new_line(): #reset text to type a new line
	in_tag = false;
	current_text = lines[current_line];
	text_to_display = "";
	current_letter = 0;
	_type_line();

func _type_line() -> void:
	for i in range(current_text.length()):
		can_progress = false;
		var char = current_text[i];
		if char == "[":
			in_tag = true;
		elif char == "]":
			in_tag = false;
		
		text_to_display += char;
		label.text = text_to_display;
		
		if current_line < faces.size():
			face.texture = faces[current_line];
		
		if not in_tag:
			await get_tree().create_timer(typing_speed).timeout
	can_progress = true; #when loop is done

func _process(delta):
	if Input.is_action_just_pressed("interact") && can_progress:
		if current_line < lines.size() - 1:
			current_line += 1;
			_new_line();
		else:
			queue_free(); #should delete self?
			current_line = 0; #reset back to first line
			_new_line();
		
	if Input.is_action_just_pressed("skip") && can_skip:
		current_letter = current_text.length();
