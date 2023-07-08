extends Actor

@onready var target = $"res://Scenes/Nector"

func _physics_process(delta): 
	advance_on_necro()

func advance_on_necro(): 
	var direction = (target.global_position - global_position).normalized()
	move_and_slide()
