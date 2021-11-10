extends KinematicBody2D

enum{
	IDLE,
	MOVE,
	DIRECTION
}
const SPEED = 100
var STATE = IDLE
var direction = Vector2.RIGHT


func _ready():
	randomize()

func _process(delta):
	match STATE:
		IDLE:
			pass
		MOVE:
			move(delta)
		DIRECTION:
			direction = choose([Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN])
			STATE = choose([IDLE, MOVE])


func move(delta):
	position += direction * SPEED * delta

func choose(array):
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])
	STATE = choose([IDLE, MOVE, DIRECTION])




