extends StaticBody2D

#@onready var player = get_tree().has_group("player")
@export var dialogueResource := DialogueResource
@export var dialogueStart : String = "Start"
var dialogueCount = 0

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		if dialogueCount < 5:
			DialogueManager.show_dialogue_balloon(load("res://dialogue/main console.dialogue"), dialogueStart)
			dialogueCount += 1
	if dialogueCount == 5:
		dialogueStart = "StopIt"
		DialogueManager.show_dialogue_balloon(load("res://dialogue/main console.dialogue"), dialogueStart)
		dialogueCount += 1
		return
