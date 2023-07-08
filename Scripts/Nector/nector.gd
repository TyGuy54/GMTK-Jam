extends Actor

var rotation_speed = 2.0
@onready var player = $"../Player"

func _physics_process(delta: float) -> void:
	rotate_to_target(player, delta)
	
	
func rotate_to_target(target, delta):
	var direction = (target.global_position - global_position).normalized()
	var angle_to = $Sprite2D.transform.x.angle_to(direction)
	$Sprite2D.rotate(sign(angle_to) * min(delta * rotation_speed, abs(angle_to)))

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
