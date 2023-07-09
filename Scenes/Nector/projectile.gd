extends CharacterBody2D

var speed = 200
var rotation_speed = 2.0
var target_position


func _physics_process(delta):
	position += transform.x * speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	$Timer.start()
	if body.is_in_group("Protag"):
		body.queue_free()


func _on_timer_timeout() -> void:
	queue_free()
