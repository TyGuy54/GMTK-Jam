extends CharacterBody2D

var speed = 200
var rotation_speed = 2.0
@export var projectile_despawn_distance = 400


func _physics_process(delta):
	position += transform.x * speed * delta

	var necro = get_tree().get_first_node_in_group("Nector")

	var distance = necro.global_position.distance_to(global_position)
	if (distance >= projectile_despawn_distance):
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
#	$Timer.start()
	if body.is_in_group("Protag"):
		body.queue_free()


func _on_timer_timeout() -> void:
	queue_free()
