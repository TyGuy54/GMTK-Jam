extends Actor

var status: int = 0
@onready var necro_nodes = get_tree().get_nodes_in_group("Nector")
		
func _physics_process(delta):
	advance_on_necro(delta)
	
func advance_on_necro(delta):
	for necro in necro_nodes:
		position = position.move_toward(necro.global_position, delta * speed)

