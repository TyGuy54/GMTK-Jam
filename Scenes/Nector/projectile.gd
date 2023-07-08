extends Area2D

var speed = 750
var rotation_speed = 2.0
var vel = Vector2.ZERO

func _physics_process(delta):
	position += transform.x * speed * delta
	
	for node in get_tree().get_nodes_in_group("player"):
		var direction = (node.global_position - global_position).normalized()
		var angle_to = $Sprite2D.transform.x.angle_to(direction)
		$Sprite2D.rotate(sign(angle_to) * min(delta * rotation_speed, abs(angle_to)))
	
func _on_projectile_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.queue_free()
		
	queue_free()
