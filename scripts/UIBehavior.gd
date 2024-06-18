extends Control
class_name UIBehavior

@export var game_viewport : Viewport
@export var console_output : TextEdit
@onready var player_ui = $PlayerUI

func _ready():
	# Set up the initial console output
	console_output.text = "You awaken in the dungeon\n"

func add_console_message(message: String):
	console_output.text += message + "\n"
	console_output.scroll_vertical = console_output.get_line_count() # Scroll to the bottom

func update_player_stats(stats : Array):
	player_ui.update_stats(stats)

func update_direction_label(direction : String):
	player_ui.update_dir_label(direction)
