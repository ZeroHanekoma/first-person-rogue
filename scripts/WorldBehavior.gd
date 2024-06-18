extends Node3D
class_name GameBehavior

@export var player: Player
@onready var turn_manager = $TurnManager
@export var UIControl: Control
var turn_passing: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.set_default_clear_color(Color(0, 0, 0))
	turn_manager.connect("turn_advanced", Callable(self, "_on_turn_advanced"))
	var player_stats = [player.Str, player.Dex, player.Con, player.Int, player.Wis, player.Cha]
	UIControl.update_player_stats(player_stats)
	UIControl.update_direction_label(player.get_facing_direction())

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

# Called when a turn is advanced
func _on_turn_advanced(action_name: String):
	if turn_passing:
		return
	player_turn(action_name)

# Function to handle player inputs and move/rotate the player
func player_turn(action_name: String):
	var player_stats = [player.Str, player.Dex, player.Con, player.Int, player.Wis, player.Cha]
	UIControl.update_player_stats(player_stats)
	var move_vector = Vector3.ZERO
	var player_rotation = player.rotation.y
	var direction = player.get_facing_direction()

	match action_name:
		"move_up":
			if not player.is_ray_colliding(0):
				move_vector = Vector3(0, 0, -2)
				UIControl.add_console_message("You take a step forward to the " + full_direction_name(direction))
				turn_passing = true
		"move_down":
			if not player.is_ray_colliding(2):
				move_vector = Vector3(0, 0, 2)
				UIControl.add_console_message("You move backward to the " + full_direction_name(get_opposite_direction(direction)))
				turn_passing = true
		"move_left":
			if not player.is_ray_colliding(1):
				move_vector = Vector3(-2, 0, 0)
				UIControl.add_console_message("You strafe left")
				turn_passing = true
		"move_right":
			if not player.is_ray_colliding(3):
				move_vector = Vector3(2, 0, 0)
				UIControl.add_console_message("You strafe right")
				turn_passing = true
		"rotate_left":
			turn_passing = true
			player.rotate_player(false)
			player.tween.connect("finished", Callable(self, "_on_tween_finished"))
			UIControl.add_console_message("You turn to your left, now facing " + full_direction_name(player.get_facing_direction()))
			UIControl.update_direction_label(player.get_facing_direction())
			return
		"rotate_right":
			turn_passing = true
			player.rotate_player(true)
			player.tween.connect("finished", Callable(self, "_on_tween_finished"))
			UIControl.add_console_message("You turn to your right, now facing " + full_direction_name(player.get_facing_direction()))
			UIControl.update_direction_label(player.get_facing_direction())
			return
		"ui_accept":
			turn_passing = true
			player.take_action()
			turn_passing = false
			return

	# Adjust move_vector based on player rotation
	move_vector = move_vector.rotated(Vector3(0, 1, 0), player_rotation)

	if move_vector != Vector3.ZERO:
		player.move_player(move_vector)
		player.tween.connect("finished", Callable(self, "_on_tween_finished"))

# Called when the player's tween has finished
func _on_tween_finished():
	turn_passing = false
	game_turn()

func game_turn():
	pass

func get_opposite_direction(direction: String) -> String:
	match direction:
		"N":
			return "S"
		"S":
			return "N"
		"E":
			return "W"
		"W":
			return "E"
		_:
			return "Unknown"

func full_direction_name(abbr: String) -> String:
	match abbr:
		"N":
			return "North"
		"S":
			return "South"
		"E":
			return "East"
		"W":
			return "West"
		_:
			return "Unknown"
