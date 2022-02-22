extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")
onready var paused_title: Label = get_node("PauseOverlay/Title")

var paused: = false setget set_paused

const DIED_MESSAGE: = "You died"

func _ready():
	PlayerData.connect("score_updated", self, "update_inteface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_inteface()

func update_inteface():
	score.text = "Score: %s" % PlayerData.score

func _on_PlayerData_player_died():
	self.paused = true
	paused_title.text = DIED_MESSAGE

func _unhandled_input(event):
	if event.is_action_pressed("pause") and paused_title.text != DIED_MESSAGE:
		self.paused = !paused
		scene_tree.set_input_as_handled()
	
	if event.is_action_pressed("quit"):
		get_tree().quit(0)

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
