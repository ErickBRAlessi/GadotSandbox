extends Area2D

@onready var game_manager = %GameManager

@export var target_level : PackedScene

func _on_body_entered(body):
	if(body.name == "Player"):
		game_manager.goal_achived()
		queue_free()
		get_tree().change_scene_to_packed(target_level)

		
