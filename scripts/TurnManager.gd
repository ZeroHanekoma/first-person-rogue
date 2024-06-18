extends Node

# Define a custom signal for turn advancement with the action name
signal turn_advanced(action_name: String)

# List of actions that will trigger a turn advance
@export var turn_advance_actions: Array[String] = [
	"move_up",
	"move_down",
	"move_left",
	"move_right",
	"rotate_left",
	"rotate_right",
	"ui_accept"
]

# Callback function for handling input events
func _process(delta):
	for action in turn_advance_actions:
		if Input.is_action_just_pressed(action):
			advance_turn(action)

# Function to advance the turn and emit the signal
func advance_turn(action_name: String):
	emit_signal("turn_advanced", action_name)
