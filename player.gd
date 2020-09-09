extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var lastpressLR = 'L'
var lastpressUD = 'U'

func get_input_LR():
	if not Input.is_action_pressed('left') && not Input.is_action_pressed('right'):
		return 0
	if not Input.is_action_pressed('left') && Input.is_action_pressed('right'):
		lastpressLR = 'R'
		return 1
	if Input.is_action_pressed('left') && not Input.is_action_pressed('right'):
		lastpressLR = 'L'
		return -1
	if Input.is_action_pressed('left') && Input.is_action_pressed('right'):
		if lastpressLR == 'R':
			return -1
		elif lastpressLR == 'L':
			return 1
		else:
			return 0

func get_input_UD():
	if not Input.is_action_pressed('up') && not Input.is_action_pressed('down'):
		return 0
	if not Input.is_action_pressed('up') && Input.is_action_pressed('down'):
		lastpressUD = 'D'
		return 1
	if Input.is_action_pressed('up') && not Input.is_action_pressed('down'):
		lastpressUD = 'U'
		return -1
	if Input.is_action_pressed('up') && Input.is_action_pressed('down'):
		if lastpressUD == 'D':
			return -1
		elif lastpressUD == 'U':
			return 1
		else:
			return 0


func _physics_process(delta):
	velocity = move_and_slide(velocity)
	velocity.y = get_input_UD()
	velocity.x = get_input_LR()
	velocity = velocity.normalized() * speed
