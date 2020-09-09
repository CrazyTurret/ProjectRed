extends KinematicBody2D


export (float) var firerate = 1
export (int) var projspeed = 1
export (int) var projsize = 1
export (float) var accuracy = .5

var cooldown = 0

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


func fire_projectile(psize,pspeed):
	var mousepos = get_global_mouse_position()
	var curpos = global_position
	var curdir = mousepos - curpos
	
	curdir = curdir.normalized()
	curdir.x += rand_range(-1,1) * (accuracy - 1)
	curdir.y += rand_range(-1,1) * (accuracy - 1)
	curdir = curdir.normalized()
	
#	var bul = preload("res://Bullet.tscn").instance()
#	bul.init(pspeed, psize,curdir.normalized())
#	bul.position = global_position
#	get_parent().add_child(bul)
	
	

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	
	if cooldown > 0:
		cooldown -= delta
	if cooldown < 0:
		cooldown = 0
	
	if Input.is_action_pressed("action1"):
		if cooldown == 0:
			fire_projectile(projsize,projspeed)
			cooldown = firerate

func _unhandled_key_input(event):
	if event.echo == false:
		velocity.y = get_input_UD()
		velocity.x = get_input_LR()
		velocity = velocity.normalized() * speed
