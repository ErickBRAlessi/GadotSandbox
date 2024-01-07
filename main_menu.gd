extends Node


@onready var button = $Button
@onready var button_2 = $Button2
@onready var button_3 = $Button3

var selectedButton = button

func _on_button_pressed():
	get_tree().change_scene_to_file("res://level1.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://level2.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://level3.tscn")

func _on_ready():
	button.grab_focus()

func _on_button_focus_entered():
	selectedButton = button
	
func _on_button_2_focus_entered():
	selectedButton = button_2

func _on_button_3_focus_entered():
	selectedButton = button_3
	
func _input(event):
	if(Input.is_action_just_pressed("jump")):
		if(selectedButton == button):
			get_tree().change_scene_to_file("res://level1.tscn")
		else: 
			if(selectedButton == button_2):
				get_tree().change_scene_to_file("res://level2.tscn")
			else: 
				if(selectedButton == button_3):
					get_tree().change_scene_to_file("res://level3.tscn")




