extends BaseCannonball

func _ready():
	target = get_global_mouse_position()
	velocity = -(position - target).normalized() 
	pass

func _physics_process(delta):
	position += velocity * speed

func is_player():
	true
