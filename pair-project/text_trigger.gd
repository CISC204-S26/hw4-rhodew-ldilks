class_name Text_Trigger extends Area2D

@export var text_scene: PackedScene

@export var faces: Array[Texture2D]

@export var lines: Array[String] = [
	"this is the text_triggers text",
	"It overrides the text in text_typing"
];

var in_area = false;
var current_text: Node = null;

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta: float) -> void:
	if (in_area && Input.is_action_just_pressed("interact")):
		create_text();

func create_text():
	if (current_text == null or !is_instance_valid(current_text)):
		if text_scene == null:
			print("text_scene not assigned")
			return
		
		current_text = text_scene.instantiate()
		
		#override line vars
		current_text.lines = lines;
		current_text.faces = faces;
		
		get_tree().current_scene.add_child(current_text)
		print("created text");

func _on_body_entered(body: Node2D) -> void:
	in_area = true;
	
func _on_body_exited(body: Node2D) -> void:
	in_area = false;
