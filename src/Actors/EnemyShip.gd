extends KinematicBody2D

const SPEED = 100.0

func _physics_process(delta):
	var direction = (get_parent().get_node("Ship").position - position).normalized()
	var motion = direction * SPEED * delta
	position += motion
	
func shoot_at_player():
	var cannonball = load("res://src/Objects/EnemyCannonball.tscn").instance()
	cannonball.position = get_global_position()
	get_parent().add_child(cannonball)

func _on_Timer_timeout():
	shoot_at_player()

func _on_ShotDetector_area_entered(area):
	if area.has_method("is_player"):
		area.queue_free()
		queue_free()
	
