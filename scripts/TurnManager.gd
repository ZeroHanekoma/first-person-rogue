extends Node
class_name TurnManager

# Define a custom signal for turn advancement with the action name
signal turn_advanced(action_name: String)
signal menu_opened(menu_name: String)

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

@export var menu_actions : Array[String] = [
	"inventory_menu",
	"stats_menu"
]

@export var player_ui : UIBehavior

# Callback function for handling input events
func _process(delta):
	for action in turn_advance_actions:
		if Input.is_action_just_pressed(action) and not player_ui.popup_open:
			advance_turn(action)
	for menu_name in menu_actions:
		if Input.is_action_just_pressed(menu_name) and not player_ui.popup_open:
			emit_signal("menu_opened", menu_name)

# Function to advance the turn and emit the signal
func advance_turn(action_name: String):
	emit_signal("turn_advanced", action_name)
