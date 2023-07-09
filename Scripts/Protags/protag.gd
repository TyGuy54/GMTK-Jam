#extends Actor
#
##@onready var target = get_node(node_path)
#
#func _ready():
#	var target = preload("res://Scenes/Nector/Nector.tscn").instantiate()
##	add_child(target)
#
#func _physics_process(_delta): 
#	advance_on_necro()
#
#func advance_on_necro():
#	var _direction = (target.global_position - global_position).normalized()
#	move_and_slide()

extends Actor



