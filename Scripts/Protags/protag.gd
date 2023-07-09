extends Actor

@onready var necro_nodes = get_tree().get_nodes_in_group("Nector")

func _physics_process(_delta): 
	advance_on_necro()

func advance_on_necro():
	for node in necro_nodes:
		var _direction = (node.global_position - global_position).normalized()
	move_and_slide()



