extends Node3D
class_name LevelControl

var current_floor : int = 0
@export var player : Player
@onready var base_level = $BaseLevel
@onready var start_area = $Start_Room
@onready var end_goal = $EndGoal
var UIControl : UIBehavior
@onready var level_spawn_manager = $LevelSpawnManager

var astar : AStar3D = AStar3D.new()

func load_new_level():
	UIControl.fade_out()
	current_floor += 1
	print(current_floor)
	end_goal.global_position = Vector3(-50,-50,-50)
	await base_level.clear_level()
	await base_level.build_level()
	if current_floor > 1:
		UIControl.add_console_message(str("You have entered Floor ", current_floor, " of the dungeon."))
		_set_player_start_position()
	start_area.global_position = base_level.start_location
	end_goal.global_position = base_level.end_location
	print(end_goal.global_position)
	initialize_astar_grid()
	var end_goal_area : Area3D = end_goal.get_child(0)
	if not end_goal_area is Area3D:
		await print("FATAL ERROR")
		get_tree().quit()
		return
	level_loading = false
	await UIControl.fade_in()

func _set_player_start_position():
	player.global_position = base_level.start_location

func get_start_position() -> Vector3:
	return base_level.start_location

var level_loading : bool = true

func _on_area_3d_body_entered(body):
	if level_loading:
		return
	if body is Player:
		level_loading = true
		if !player:
			player = body
		UIControl.add_console_message("You descend to the next floor...")
		# Wait for the player's tween to finish
		while player.is_tweening:
			await get_tree().create_timer(0.1).timeout
		await load_new_level()

# Initialize the AStar grid with the walkable tiles
func initialize_astar_grid():
	astar.clear()
	for position in base_level.pathfinding_grid:
		if position != null:
			var id = get_vector3i_id(Vector3i(position))
			astar.add_point(id, position)

	# Connect each point to its neighbors
	for position in base_level.pathfinding_grid:
		if position != null:
			var id = get_vector3i_id(Vector3i(position))
			for neighbor in get_neighbors(Vector3i(position)):
				if astar.has_point(get_vector3i_id(neighbor)):
					astar.connect_points(id, get_vector3i_id(neighbor))

# Generate a unique ID for a Vector3i position
func get_vector3i_id(position: Vector3i) -> int:
	return position.x + position.z * base_level.border_size

# Get neighboring positions for a given position
func get_neighbors(position: Vector3i) -> Array[Vector3i]:
	var neighbors : Array[Vector3i] = []
	var directions = [
		Vector3i(1, 0, 0),
		Vector3i(-1, 0, 0),
		Vector3i(0, 0, 1),
		Vector3i(0, 0, -1)
	]

	for direction in directions:
		var neighbor = position + direction
		if neighbor.x >= 0 and neighbor.z >= 0 and neighbor.x < base_level.border_size and neighbor.z < base_level.border_size:
			neighbors.append(neighbor)
	return neighbors

# Calculate the shortest valid distance between two points using AStar3D
func calculate_shortest_path(start: Vector3i, end: Vector3i) -> Array[Vector3]:
	var start_id = get_vector3i_id(start)
	var end_id = get_vector3i_id(end)

	if not astar.has_point(start_id) or not astar.has_point(end_id):
		return []

	var path = astar.get_point_path(start_id, end_id)

	# Convert the path to Array[Vector3]
	var vector3_path : Array[Vector3] = []
	for point in path:
		vector3_path.append(Vector3(point.x, 0, point.z))

	# Remove the first point if it is the starting position
	if vector3_path.size() > 0 and vector3_path[0] == Vector3(start.x + 0.5, 0, start.z + 0.5):
		vector3_path.remove_at(0)

	return vector3_path
