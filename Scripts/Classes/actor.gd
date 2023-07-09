extends CharacterBody2D
class_name Actor

enum {alive, fucked_up, they_undead}

@export var health: int = 0
@export var attack: int = 0
@export var defense: int = 0

@export var acceleration: float = 0.0
@export var friction: float = 0.0
@export var speed: int = 10

# this function handles actor movment
func move_actor(direction, delta):
	if direction.length() > 0:
		# applys acceleration to the x axis
		velocity.x = move_toward(
			velocity.x, 
			direction.normalized().x * speed, 
			acceleration * delta
		)
		
		# applys acceleration to the Y axis
		velocity.y = move_toward(
			velocity.y, 
			direction.normalized().y * speed, 
			acceleration * delta
		)
		
	else:
		# applys friction to the x axis
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		# applys friction to the y axis
		velocity.y = move_toward(velocity.y, 0, friction * delta)
		
	move_and_slide()

func take_damage(damage: int):
	self.health -= damage
