extends Area2D

const speed = 10
var target
# Declare velocity here for straight line forever bullet
var velocity = Vector2()

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized() 
	pass

func _physics_process(delta):
	position += velocity * speed

func is_player():
	true
