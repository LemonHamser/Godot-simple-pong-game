extends Area2D
class_name Ball

var speed = 100
var direction = Vector2.LEFT

func _physics_process(delta):
	speed += delta * 4
	global_position += speed * direction * delta
