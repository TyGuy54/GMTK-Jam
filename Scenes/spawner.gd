extends Node2D

var spawnTimer: Timer
var vector: Vector2
	
func _ready():
	
	spawnTimer = Timer.new()
	add_child(spawnTimer)
	spawnTimer.wait_time = 1.0
	spawnTimer.connect("timeout", _on_spawn_timer_timeout)
	spawnTimer.start()

var counter: int = 0;

func _on_spawn_timer_timeout():
	const enemy_scene = preload("res://Scenes/actor.tscn")
	var enemy = enemy_scene.instantiate();
	enemy.transform.origin = Vector2(counter, 100)
	add_child(enemy)
	counter+= 100;
	
