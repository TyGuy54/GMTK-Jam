extends CharacterBody2D

var speed = 450
var rotation_speed = 2.0
var target_position
#var vel = Vector2.ZER

func _physics_process(delta):
	position += transform.x * speed * delta
	
	for node in get_tree().get_nodes_in_group("player"):
		var direction = (node.global_position - global_position).normalized()
		var angle_to = $Sprite2D.transform.x.angle_to(direction)
		$Sprite2D.rotate(sign(angle_to) * min(delta * rotation_speed, abs(angle_to)))
		
		target_position = (node.position - position)
		
		if position.distance_to(node.position) > 3:
			move_and_slide()
			look_at(node.position)
		
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	$Timer.start()
	if body.is_in_group("player"):
		body.queue_free()

func _on_timer_timeout() -> void:
	queue_free()
