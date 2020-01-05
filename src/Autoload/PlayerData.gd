extends Node

export (int) var health: = 3 setget set_health

signal health_updated

func set_health(value) -> void:
	health = value
	emit_signal("health_updated")

func reset_state() -> void:
	health = 3
