extends CharacterBody2D

@onready var energy_label = $Camera2D/Container/EnergyLabel
@onready var shield_label = $Camera2D/Container/ShieldLabel
@onready var smile_label = $Camera2D/Container/SmileLabel
@onready var slime_label = $Camera2D/Container/SlimeLabel

var has_slime_eliminator_9001 = true
var speed = 50
var energy = 0
var slime = 1
var smile = 0
var shield = 0
var key


func _process(delta):
	energy_label.text = "Energy: " + str(energy)
	shield_label.text = "Shield: " + str(shield)
	smile_label.text = "Smiles: " + str(smile)
	slime_label.text = "Slimes: " + str(slime)
	velocity.x = 0
	velocity.y = 0

	if Input.is_action_pressed("power"):
		if slime >= 3:
			slime -= 3
			energy += 1
		elif smile >= 5:
			smile -= 5
			energy += 1
	if Input.is_action_pressed("move right"):
		velocity.x += 1
		$AnimatedSprite2D.flip_h = false 
	if Input.is_action_pressed("move left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("move down"):
		velocity.y += 1
	if Input.is_action_pressed("move up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed

	position += velocity * delta

	move_and_slide()

func Game_Over():
	$CollisionShape2D.queue_free()
	velocity.y += 10
	get_tree().reload_current_scene()

