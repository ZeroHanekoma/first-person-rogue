extends Node3D
class_name GameBehavior

@export var player: Player
@onready var turn_manager = $TurnManager
@onready var level_control = %LevelControl
@export var UIControl: Control
@export var mob_manager : MobManager
var turn_passing: bool = false
var dungeon_background : BackgroundGenerator

var time_manager : TimeManager

var current_turn : int = 0

func _ready():
	RenderingServer.set_default_clear_color(Color(0, 0, 0))
	turn_manager.connect("turn_advanced", Callable(self, "_on_turn_advanced"))
	turn_manager.connect("menu_opened", Callable(UIControl,"_on_menu_called"))
	level_control.UIControl = UIControl
	var spawn_manager : LevelSpawnManager = level_control.level_spawn_manager
	await level_control.load_new_level()
	mob_manager.game_behavior = self
	await mob_manager._ready_mob_manager()
	spawn_manager.mob_spawner.mob_manager = mob_manager
#	mob_manager.random_response_generator.game_manager = self
	var player_stats = [player.Str, player.Dex, player.Con, player.Int, player.Wis, player.Cha]
	UIControl.update_player_stats(player_stats)
	UIControl.update_direction_label(player.get_facing_direction())
	time_manager = TimeManager.new()
	add_child(time_manager)
	await time_manager._init_time()
	print(str("The Date is: ", time_manager.get_current_date(), "\nAnd the time is: ", time_manager.get_current_time()))
	# Ensure player is set correctly before assigning its position
	if player:
		player.global_position = level_control.get_start_position()
	player.playerUI = UIControl
	dungeon_background = BackgroundGenerator.new()
	add_child(dungeon_background)
	await dungeon_background._ready_dungeon_background()
	await level_control.level_spawn_manager.mob_spawner.generate_mobs(5)
	UIControl.add_console_message(str("You awaken in the dungeon ", dungeon_background.dungeon_name))
	UIControl.add_console_message(dungeon_background.dungeon_background)
#	UIControl.add_popup_window(str("You awaken in the dungeon ", dungeon_background.dungeon_name), "pee")
	UIControl.add_popup_window(str("You awaken in the dungeon ", dungeon_background.dungeon_name), dungeon_background.dungeon_background)

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_just_pressed("ui_end"):
		get_tree().reload_current_scene()

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
				move_vector = Vector3(0, 0, -1)
				UIControl.add_console_message("You step forward to the " + full_direction_name(direction))
				turn_passing = true
		"move_down":
			if not player.is_ray_colliding(2):
				move_vector = Vector3(0, 0, 1)
				UIControl.add_console_message("You move back to the " + full_direction_name(get_opposite_direction(direction)))
				turn_passing = true
		"move_left":
			if not player.is_ray_colliding(1):
				move_vector = Vector3(-1, 0, 0)
				UIControl.add_console_message("You strafe to your left")
				turn_passing = true
		"move_right":
			if not player.is_ray_colliding(3):
				move_vector = Vector3(1, 0, 0)
				UIControl.add_console_message("You strafe to your right")
				turn_passing = true
		"rotate_left":
			turn_passing = true
			player.rotate_player(false)
			player.tween.connect("finished", Callable(self, "_on_tween_finished"))
			UIControl.add_console_message("You turn left, facing " + full_direction_name(player.get_facing_direction()))
			UIControl.update_direction_label(player.get_facing_direction())
			return
		"rotate_right":
			turn_passing = true
			player.rotate_player(true)
			player.tween.connect("finished", Callable(self, "_on_tween_finished"))
			UIControl.add_console_message("You turn right, facing " + full_direction_name(player.get_facing_direction()))
			UIControl.update_direction_label(player.get_facing_direction())
			return
		"ui_accept":
			turn_passing = true
			player.take_action()
			await get_tree().physics_frame
			game_turn()
			return

	# Adjust move_vector based on player rotation
	move_vector = move_vector.rotated(Vector3(0, 1, 0), player_rotation)

	if move_vector != Vector3.ZERO:
		player.move_player(move_vector)
		player.tween.connect("finished", Callable(self, "_on_tween_finished"))

# Called when the player's tween has finished
func _on_tween_finished():
	game_turn()

func game_turn():
	time_manager.advance_time()
	print(time_manager.get_current_time())
	current_turn += 1
	UIControl.update_turn_label(current_turn)
	await mob_manager.process_mob_turns()
	turn_passing = false

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
