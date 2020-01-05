extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_just_pressed("fire"): 
		shoot()
	if Input.is_action_pressed('move_right'):
		$ship.set_flip_h(true)
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		$ship.set_flip_h(false)
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	check_health()
	velocity = move_and_slide(velocity)
	
func check_health():
	if PlayerData.health == 0: 
		queue_free()

func shoot():
	var cannonball = load("res://src/Objects/Cannonball.tscn").instance()
	cannonball.position = get_global_position()
	get_parent().add_child(cannonball)


func _on_EnemyShotDetector_area_entered(area):
	if area.has_method("is_enemy"):
		PlayerData.set_health(PlayerData.health - 1)
		area.queue_free()
