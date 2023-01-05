extends Node2D

onready var ball_cont = $BallContainer
onready var ball_spawn_location = $BallContainer/BallSpawnLocation
onready var reset_timer = $ResetTimer
onready var scoreLabel = $Graphics/ScoreLabel
const WIN_NUMBER = 5

var Ball = preload("res://Scenes/Ball.tscn")
var score = Vector2(0, 0)

func _ready():
	reset_ball()

func _on_ball_out(wall_name):
	match wall_name:
		"LeftWall":
			score.x +=1
		"RightWall":
			score.y +=1
	reset_timer.start()
	update_score_label()
	
	if score.y  >= WIN_NUMBER:
		scoreLabel.text =  "Left paddle wins!"
		reset_timer.stop()
	elif score.x  >= WIN_NUMBER :
		scoreLabel.text = "Right paddle wins!"
		reset_timer.stop()
	

	print(score)

func reset_ball():
	var ball = Ball.instance()
	ball_cont.call_deferred("add_child",ball)
	ball.global_position = ball_spawn_location.global_position
	print(ball_spawn_location.global_position)

func update_score_label():
	scoreLabel.text = str(score.x) +" - " + str(score.y)
