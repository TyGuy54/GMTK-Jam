extends Node2D

var spawn_timer: Timer
var vector: Vector2
@export var spawn_radius: Vector2
	
func _ready():
	spawn_radius = Vector2(700, 0)
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.wait_time = 1.0
	spawn_timer.connect("timeout", _on_spawn_timer_timeout)
	spawn_timer.start()

var counter: int = 0

func _on_spawn_timer_timeout():
	const enemy_scene = preload("res://Scenes/bear_test.tscn")
	var enemy = enemy_scene.instantiate();
	
	var center_coordinates = get_viewport_rect().size / 2
	
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0, 360.0)

	var spawn_position: Vector2 = center_coordinates + spawn_radius.rotated(10)
	
	enemy.transform.origin = spawn_position
	add_child(enemy)
	counter+= 100
