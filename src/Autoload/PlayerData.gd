extends Node

export (int) var health: = 3 setget set_health

signal health_updated

func set_health(value):
	health = value
	emit_signal("health_updated")
