extends CharacterBody2D
class_name Actor

@export var health: int = 0
@export var Attack: int = 0
@export var Defense: int = 0

@export var acceleration: float = 0.0
@export var friction: float = 0.0
@export var speed: int = 0

func move_actor(direction, delta):
	if direction.length() > 0:
		velocity.x = move_toward(
			velocity.x, 
			direction.normalized().x * speed, 
			acceleration * delta
		)
		
		velocity.y = move_toward(
			velocity.y, 
			direction.normalized().y * speed, 
			acceleration * delta
		)
		
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		velocity.y = move_toward(velocity.y, 0, friction * delta)
		
	move_and_slide()

func take_damage(damage: int):
	self.health -= damage
