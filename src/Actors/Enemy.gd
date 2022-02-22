extends "res://src/Actors/Actor.gd"

onready var stomp_area: Area2D = $StompDetector

export var score: = 10

func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x

func _physics_process(delta):
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_StompDetector_body_entered(body: PhysicsBody2D):
	if body.global_position.y > stomp_area.global_position.y:
		return
	die()
	
func die():
	queue_free()
	PlayerData.score += score
	
