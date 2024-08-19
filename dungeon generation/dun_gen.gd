@tool
extends Node3D

@onready var grid_map: GridMap = $GridMap
@onready var dun_mesh: Node3D = $DunMesh

func _ready():
	if Engine.is_editor_hint():
		grid_map.clear()

@export var start: bool = false:
	set = set_start

func set_start(val: bool) -> void:
	if Engine.is_editor_hint():
		generate()

@export_range(0, 1) var survival_chance: float = 0.25
@export var border_size: int = 20:
	set = set_border_size

func set_border_size(val: int) -> void:
	border_size = val
	if Engine.is_editor_hint():
		visualize_border()

@export var room_number: int = 4
@export var room_margin: int = 1
@export var room_recursion: int = 15
@export var min_room_size: int = 2
@export var max_room_size: int = 4
@export var dead_ends_min: int = 1
@export var dead_ends_max: int = 4
@export var dead_end_length_min: int = 2
@export var dead_end_length_max: int = 3
@export_multiline var custom_seed: String = "":
	set = set_seed

func set_seed(val: String) -> void:
	custom_seed = val
	seed(val.hash())

var room_tiles: Array[PackedVector3Array] = []
var room_positions: PackedVector3Array = []
var start_room_center: Vector3 = Vector3.ZERO
var end_room_center: Vector3 = Vector3.ZERO

var pathfinding_grid: Array = []

func visualize_border():
	grid_map.clear()
	for i in range(border_size + 1):
		if i >= 0 and i < border_size:
			grid_map.set_cell_item(Vector3i(i, 0, -1), 3)
			grid_map.set_cell_item(Vector3i(i, 0, border_size), 3)
			grid_map.set_cell_item(Vector3i(border_size, 0, i), 3)
			grid_map.set_cell_item(Vector3i(-1, 0, i), 3)

@export var boss_floor : bool = false

func generate():
	room_tiles.clear()
	room_positions.clear()
	pathfinding_grid = []
	for i in range(border_size):
		var row = []
		for j in range(border_size):
			row.append(-1)  # Initialize with -1 indicating unwalkable
		pathfinding_grid.append(row)

	var t: int = 0
	if custom_seed:
		set_seed(custom_seed)
	visualize_border()

	# Generate start and end rooms first
	place_start_room()

	for i in room_number:
		t += 1
		make_room(room_recursion)
		if t % 17 == 16:
			await get_tree().create_timer(0).timeout

	var rpv2: PackedVector2Array = []
	var del_graph: AStar2D = AStar2D.new()
	var mst_graph: AStar2D = AStar2D.new()

	for p in room_positions:
		rpv2.append(Vector2(p.x, p.z))
		del_graph.add_point(del_graph.get_available_point_id(), Vector2(p.x, p.z))
		mst_graph.add_point(mst_graph.get_available_point_id(), Vector2(p.x, p.z))

	var delaunay: Array = Array(Geometry2D.triangulate_delaunay(rpv2))

	for i in delaunay.size() / 3:
		var p1: int = delaunay.pop_front()
		var p2: int = delaunay.pop_front()
		var p3: int = delaunay.pop_front()
		del_graph.connect_points(p1, p2)
		del_graph.connect_points(p2, p3)
		del_graph.connect_points(p1, p3)

	var visited_points: PackedInt32Array = []
	visited_points.append(randi() % room_positions.size())
	while visited_points.size() != mst_graph.get_point_count():
		var possible_connections: Array[PackedInt32Array] = []
		for vp in visited_points:
			for c in del_graph.get_point_connections(vp):
				if !visited_points.has(c):
					var con: PackedInt32Array = [vp, c]
					possible_connections.append(con)

		if possible_connections.size() == 0:
			break

		var connection: PackedInt32Array = possible_connections.pick_random()
		for pc in possible_connections:
			if rpv2[pc[0]].distance_squared_to(rpv2[pc[1]]) < rpv2[connection[0]].distance_squared_to(rpv2[connection[1]]):
				connection = pc

		visited_points.append(connection[1])
		mst_graph.connect_points(connection[0], connection[1])
		del_graph.disconnect_points(connection[0], connection[1])

	var hallway_graph: AStar2D = mst_graph

	for p in del_graph.get_point_ids():
		for c in del_graph.get_point_connections(p):
			if c > p:
				var kill: float = randf()
				if survival_chance > kill:
					hallway_graph.connect_points(p, c)
	
	create_hallways(hallway_graph)
	place_end_room()
	if boss_floor:
		generate_boss_floor()
	update_pathfinding_grid()

func update_pathfinding_grid():
	var used_cells = grid_map.get_used_cells()
	for cell in used_cells:
		var cell_item = grid_map.get_cell_item(cell)
		if cell_item != -1 and cell.z >= 0 and cell.z < border_size and cell.x >= 0 and cell.x < border_size:
			pathfinding_grid[cell.z][cell.x] = 0

func get_pathfinding_grid():
	return pathfinding_grid

func create_hallways(hallway_graph: AStar2D):
	var hallways: Array[PackedVector3Array] = []
	var random = RandomNumberGenerator.new()
	random.randomize()

	for p in hallway_graph.get_point_ids():
		for c in hallway_graph.get_point_connections(p):
			if c > p:
				var room_from: PackedVector3Array = room_tiles[p]
				var room_to: PackedVector3Array = room_tiles[c]
				var tile_from: Vector3 = room_from[0]
				var tile_to: Vector3 = room_to[0]
				for t in room_from:
					if t.distance_squared_to(room_positions[c]) < tile_from.distance_squared_to(room_positions[c]):
						tile_from = t
				for t in room_to:
					if t.distance_squared_to(room_positions[p]) < tile_to.distance_squared_to(room_positions[p]):
						tile_to = t

				# Avoid direct connection between start and end rooms
				if not (tile_from == start_room_center and tile_to == end_room_center) and not (tile_from == end_room_center and tile_to == start_room_center):
					var hallway: PackedVector3Array = [tile_from, tile_to]
					hallways.append(hallway)
					grid_map.set_cell_item(Vector3i(tile_from), 2)
					grid_map.set_cell_item(Vector3i(tile_to), 2)

	var astar: AStarGrid2D = AStarGrid2D.new()
	astar.size = Vector2i.ONE * border_size
	astar.update()
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN

	for t in grid_map.get_used_cells_by_item(0):
		astar.set_point_solid(Vector2i(t.x, t.z))

	var _t: int = 0
	for h in hallways:
		_t += 1
		var pos_from: Vector2i = Vector2i(h[0].x, h[0].z)
		var pos_to: Vector2i = Vector2i(h[1].x, h[1].z)
		var hall: PackedVector2Array = astar.get_point_path(pos_from, pos_to)

		for t in hall:
			var pos: Vector3i = Vector3i(t.x, 0, t.y)
			if grid_map.get_cell_item(pos) < 0:
				grid_map.set_cell_item(pos, 1)
		if _t % 16 == 15:
			await get_tree().create_timer(0).timeout

	generate_dead_ends(random, hallways)

func generate_dead_ends(random: RandomNumberGenerator, hallways: Array[PackedVector3Array]):
	var additional_hallways_count = random.randi_range(dead_ends_min, dead_ends_max)

	for i in range(additional_hallways_count):
		var generate_from_hallway = true  # Always generate from hallways

		if generate_from_hallway and hallways.size() > 0:
			var random_hallway_index = random.randi_range(0, hallways.size() - 1)
			var random_hallway = hallways[random_hallway_index]
			var random_hallway_position = random_hallway[random.randi_range(0, random_hallway.size() - 1)]
			create_dead_end_from_position(random_hallway_position, random, true)
		else:
			if room_tiles.size() == 0:
				break  # Avoid trying to access an empty array

			var random_room_index = random.randi_range(0, room_tiles.size() - 1)
			var random_room = room_tiles[random_room_index]
			if random_room.size() == 0:
				continue  # Avoid trying to access an empty array

			var random_room_position = random_room[random.randi_range(0, random_room.size() - 1)]
			create_dead_end_from_position(random_room_position, random, false)

func create_dead_end_from_position(start_position: Vector3, random: RandomNumberGenerator, from_hallway: bool):
	var random_direction = Vector3i.ZERO

	# Ensure only horizontal or vertical movement
	if random.randf() < 0.5:
		random_direction = Vector3i(1, 0, 0) * (random.randi_range(0, 1) * 2 - 1)
	else:
		random_direction = Vector3i(0, 0, 1) * (random.randi_range(0, 1) * 2 - 1)

	var hallway_tile_position = Vector3i.ZERO  # Declare the variable here
	var hallway_length = random.randi_range(dead_end_length_min, dead_end_length_max)

	for j in range(hallway_length):
		hallway_tile_position = Vector3i(start_position) + random_direction * (j + 1)
		if hallway_tile_position.x < 0 or hallway_tile_position.z < 0 or hallway_tile_position.x >= border_size or hallway_tile_position.z >= border_size:
			break  # Don't go past the border
		if grid_map.get_cell_item(hallway_tile_position) < 0:
			grid_map.set_cell_item(hallway_tile_position, 1)
			await get_tree().create_timer(0).timeout

	# If generating from a hallway, attempt to create a T shape
	if from_hallway:
		var perpendicular_direction = Vector3i.ZERO
		if random_direction.x != 0:
			perpendicular_direction = Vector3i(0, 0, 1) * (random.randi_range(0, 1) * 2 - 1)
		else:
			perpendicular_direction = Vector3i(1, 0, 0) * (random.randi_range(0, 1) * 2 - 1)

		for k in range(1, hallway_length):
			var t_shape_position = hallway_tile_position + perpendicular_direction * k
			if t_shape_position.x < 0 or t_shape_position.z < 0 or t_shape_position.x >= border_size or t_shape_position.z >= border_size:
				break  # Don't go past the border
			if grid_map.get_cell_item(t_shape_position) < 0:
				grid_map.set_cell_item(t_shape_position, 1)
				await get_tree().create_timer(0).timeout

		# Additional perpendicular direction to increase T-shape likelihood
		perpendicular_direction = -perpendicular_direction
		for k in range(1, hallway_length):
			var t_shape_position = hallway_tile_position + perpendicular_direction * k
			if t_shape_position.x < 0 or t_shape_position.z < 0 or t_shape_position.x >= border_size or t_shape_position.z >= border_size:
				break  # Don't go past the border
			if grid_map.get_cell_item(t_shape_position) < 0:
				grid_map.set_cell_item(t_shape_position, 1)
				await get_tree().create_timer(0).timeout

func make_room(rec: int):
	if rec <= 0:
		return

	var width: int = (randi() % (max_room_size - min_room_size)) + min_room_size
	var height: int = (randi() % (max_room_size - min_room_size)) + min_room_size

	var start_pos: Vector3i
	start_pos.x = randi() % (border_size - width + 1)
	start_pos.z = randi() % (border_size - height + 1)

	for r in range(-room_margin, height + room_margin):
		for c in range(-room_margin, width + room_margin):
			var pos: Vector3i = start_pos + Vector3i(c, 0, r)
			if grid_map.get_cell_item(pos) == 0:
				make_room(rec - 1)
				return

	var room: PackedVector3Array = []
	for r in range(height):
		for c in range(width):
			var pos: Vector3i = start_pos + Vector3i(c, 0, r)
			grid_map.set_cell_item(pos, 0)
			room.append(pos)
	room_tiles.append(room)
	var avg_x: float = start_pos.x + (float(width) / 2)
	var avg_z: float = start_pos.z + (float(height) / 2)
	var pos: Vector3 = Vector3(avg_x, 0, avg_z)
	room_positions.append(pos)

func place_start_room():
	start_room_center = place_3x3_room(6)

func place_end_room():
	var furthest_distance: float = -1
	var furthest_position: Vector3 = Vector3.ZERO
	var furthest_room: PackedVector3Array = []

	for room in room_tiles:
		var avg_position: Vector3 = Vector3.ZERO
		for tile in room:
			avg_position += tile
		avg_position /= room.size()

		var distance = avg_position.distance_squared_to(start_room_center)
		if distance > furthest_distance:
			furthest_distance = distance
			furthest_position = avg_position
			furthest_room = room

	end_room_center = furthest_position

	if furthest_room.size() > 0:
		var center_tile = furthest_room[furthest_room.size() / 2]

		# Try to place the end room next to a room tile, away from hallway tiles
		var placed = false
		var directions = [Vector3i(1, 0, 0), Vector3i(-1, 0, 0), Vector3i(0, 0, 1), Vector3i(0, 0, -1)]
		directions.shuffle()
		
		for direction in directions:
			var adjacent_pos = Vector3i(center_tile) + direction
			if adjacent_pos.x >= 0 and adjacent_pos.x < border_size and adjacent_pos.z >= 0 and adjacent_pos.z < border_size:
				if grid_map.get_cell_item(adjacent_pos) == -1:  # Empty tile
					var has_hallway = false
					for check_direction in directions:
						var check_pos = adjacent_pos + check_direction
						if grid_map.get_cell_item(check_pos) == 1:  # Hallway tile
							has_hallway = true
							break
					if not has_hallway:
						grid_map.set_cell_item(adjacent_pos, 7)  # End room tile
						end_room_center = Vector3(adjacent_pos) + Vector3(0.5, 0, 0.5)
						placed = true
						break
				await get_tree().process_frame  # Yield to avoid long blocking operation

		# If couldn't place next to a room tile, place it in the closest empty position
		if not placed:
			for direction in directions:
				var adjacent_pos = Vector3i(center_tile) + direction
				if adjacent_pos.x >= 0 and adjacent_pos.x < border_size and adjacent_pos.z >= 0 and adjacent_pos.z < border_size:
					if grid_map.get_cell_item(adjacent_pos) == -1:  # Empty tile
						grid_map.set_cell_item(adjacent_pos, 7)  # End room tile
						end_room_center = Vector3(adjacent_pos) + Vector3(0.5, 0, 0.5)
						placed = true
						break
				await get_tree().process_frame  # Yield to avoid long blocking operation

	ensure_single_hallway(Vector3i(end_room_center))

func place_3x3_room(room_type: int) -> Vector3:
	var start_pos: Vector3i
	while true:
		start_pos.x = randi() % (border_size - 2)
		start_pos.z = randi() % (border_size - 2)
		var overlap: bool = false
		for r in range(3):
			for c in range(3):
				var pos: Vector3i = start_pos + Vector3i(c, 0, r)
				if grid_map.get_cell_item(pos) != -1:
					overlap = true
					break
			if overlap:
				break
		if not overlap:
			break

	var room: PackedVector3Array = []
	for r in range(3):
		for c in range(3):
			var pos: Vector3i = start_pos + Vector3i(c, 0, r)
			grid_map.set_cell_item(pos, 0)
			room.append(pos)
	room_tiles.append(room)
	var avg_x: float = start_pos.x + 1.5
	var avg_z: float = start_pos.z + 1.5
	var center_pos: Vector3 = Vector3(avg_x, 0, avg_z)
	grid_map.set_cell_item(Vector3i(avg_x, 0, avg_z), room_type)
	room_positions.append(center_pos)
	return center_pos

func ensure_single_hallway(position: Vector3i):
	var connected_hallways = []
	for direction in [Vector3i(1, 0, 0), Vector3i(-1, 0, 0), Vector3i(0, 0, 1), Vector3i(0, 0, -1)]:
		var adjacent_pos = position + direction
		if grid_map.get_cell_item(adjacent_pos) == 1:  # Check for hallway
			connected_hallways.append(adjacent_pos)

	while connected_hallways.size() > 1:
		var hallway_to_remove = connected_hallways.pop_back()
		grid_map.set_cell_item(hallway_to_remove, -1)  # Remove extra hallway

func get_block_data():
	return dun_mesh.block_data

func generate_boss_floor():
	#this function should generate a 5x5 room somewhere in the dungeon 
	pass
