extends Area2D

enum PaddleLocation {
	LEFT,
	RIGHT
	}
	

export (PaddleLocation) var paddle_loc = PaddleLocation.LEFT

const SPEED = 100

var input_name = ""

func _ready():
	if paddle_loc == PaddleLocation.LEFT:
		input_name = "left_"
	if paddle_loc == PaddleLocation.RIGHT:
		input_name = "right_"
	

func _physics_process(delta):
	if Input.is_action_pressed(input_name  + "move_up"):
		global_position.y -= SPEED * delta
	if Input.is_action_pressed(input_name + "move_down"):
		global_position.y += SPEED * delta
	
	global_position.y = clamp(global_position.y, 0,400)


func _on_Paddle_area_entered(area):
	if area is Ball:
		area.direction.x *= -1
		area.direction.y = (area.global_position.y - global_position.y)/16.0
		print("bounce" + name)
