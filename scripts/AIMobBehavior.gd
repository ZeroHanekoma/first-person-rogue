extends Node3D

var grid_size = 2.0
var current_position
var target_position

# Directions: North, East, South, West
var directions = [Vector3(0, 0, -grid_size), Vector3(grid_size, 0, 0), Vector3(0, 0, grid_size), Vector3(-grid_size, 0, 0)]

# Define the adjacent block positions based on grid size
func get_adjacent_positions():
	return [
		current_position + Vector3(0, 0, -grid_size),  # North
		current_position + Vector3(grid_size, 0, 0),   # East
		current_position + Vector3(0, 0, grid_size),   # South
		current_position + Vector3(-grid_size, 0, 0)   # West
	]

# Function to check if the mob can move to the target position
func can_move_to(target_pos: Vector3) -> bool:
	var space_state = get_world_3d().direct_space_state
	var ray_origin = global_transform.origin + Vector3(0, 1, 0)  # Slightly above ground to avoid ground hits
	var ray_target = target_pos + Vector3(0, 1, 0)

	var result = space_state.intersect_ray(ray_origin, ray_target, [self], PhysicsRayQueryParameters3D.FLAG_COLLIDE_STATIC_ONLY)
	if result:
		var collider = result.collider
		if collider and collider is LevelBlock:
			var block = collider as LevelBlock
			var direction = (target_pos - current_position).normalized()
			if direction == Vector3(0, 0, -1):  # North
				return block.north_face == -1
			elif direction == Vector3(1, 0, 0):  # East
				return block.east_face == -1
			elif direction == Vector3(0, 0, 1):  # South
				return block.south_face == -1
			elif direction == Vector3(-1, 0, 0):  # West
				return block.west_face == -1
	return false

# Function to get all possible move directions
func get_valid_moves() -> Array:
	var valid_moves = []
	var adjacent_positions = get_adjacent_positions()
	for target_pos in adjacent_positions:
		if can_move_to(target_pos):
			valid_moves.append(target_pos)
	return valid_moves

func _ready():
	current_position = global_transform.origin
	target_position = current_position

# Example function to move the mob to a new valid position
func move_mob():
	var valid_moves = get_valid_moves()
	if valid_moves.size() > 0:
		target_position = valid_moves[randi() % valid_moves.size()]  # Randomly choose a valid move
		global_transform.origin = target_position
		current_position = target_position
