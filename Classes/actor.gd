extends CharacterBody2D
class_name Actor

@export var health: int = 0
@export var Attack: int = 0
@export var Defense: int = 0

var mov_direction = Vector2.ZERO
var vel = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func take_damage(damage: int):
	self.health -= damage
	
	#if health > 0:
		#velocity += dir * force
	#else:
		#velocity += dir * force * 2
