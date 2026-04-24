extends Area2D

@export var target_scene: PackedScene

var teleporting: bool = false
var player: Node2D = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if (!teleporting):
		#go to room
		get_tree().change_scene_to_packed(target_scene)
