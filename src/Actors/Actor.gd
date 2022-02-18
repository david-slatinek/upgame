extends KinematicBody2D
class_name Actor

export var speed: = Vector2(300,1000)
var velocity: = Vector2.ZERO
export var gravity: = 3000.0

func _physics_process(delta):
	velocity.y += gravity * delta
	#velocity.y = min(velocity.y, speed.y)
	velocity = move_and_slide(velocity)
