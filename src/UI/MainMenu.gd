extends Control

export (String, FILE) var new_scene = ""

func _on_button_up():
	get_tree().change_scene(new_scene)
