extends Node3D

@onready var level_block_template : PackedScene = preload("res://dungeon generation/room_blocks.tscn")
@onready var dun_gen_scene : PackedScene = preload("res://dungeon generation/dun_gen.tscn")

@export var wall_texture : int = 0

var current_floor : int = 0

var border_size : int = 20

var start_location : Vector3 = Vector3.ZERO
var end_location : Vector3 = Vector3.ZERO
var pathfinding_grid : Array[Vector3] = []

func build_level():
	await generate_level()

func generate_level():
	# Instance dun_gen and add it to the scene
	var dun_gen_instance = dun_gen_scene.instantiate()
	initialize_dun_gen_instance(dun_gen_instance)
	
	await dun_gen_instance.generate()
	
	# Access DunMesh and generate the dungeon layout
	var dun_mesh_instance = dun_gen_instance.get_node("DunMesh")
	await dun_mesh_instance.generate()

	# Retrieve block data and pathfinding grid
	var block_data = dun_gen_instance.get_block_data()
	start_location = dun_gen_instance.start_room_center
	end_location = dun_gen_instance.end_room_center
	
	# Initialize the pathfinding grid to store Vector3 positions
	pathfinding_grid.clear()
	
	border_size = dun_gen_instance.border_size
	# Remove the dun_gen_instance from the scene
	dun_gen_instance.queue_free()
	# Await to ensure it's fully removed before continuing
	await get_tree().process_frame

	# Use the block data to place level blocks
	for block_info in block_data:
		set_block(block_info["position"], block_info["floor_texture"], block_info["ceiling_texture"], block_info["wall_faces"])

func initialize_dun_gen_instance(dun_gen_instance):
	# Generate a unique seed for the current floor
	var floor_seed = str(int(GlobalVariables.rng.seed) + (current_floor * GlobalVariables.rng.seed))
	add_child(dun_gen_instance)
	
	# Increase dungeon size every 5 floors
	var size_multiplier = int(current_floor / 5) + 1
	
	dun_gen_instance.room_number = GlobalVariables.rng.randi_range(4, 8) * size_multiplier
	dun_gen_instance.border_size = GlobalVariables.rng.randi_range(20, 40) * size_multiplier
	dun_gen_instance.min_room_size = GlobalVariables.rng.randi_range(2, 3) + (size_multiplier - 1)
	dun_gen_instance.max_room_size = dun_gen_instance.min_room_size + GlobalVariables.rng.randi_range(4, 6)
	dun_gen_instance.dead_ends_min = randi_range(1, 3)
	dun_gen_instance.dead_ends_max = dun_gen_instance.dead_ends_min + randi_range(1, 4)
	dun_gen_instance.dead_end_length_min = GlobalVariables.rng.randi_range(1, 3)
	dun_gen_instance.dead_end_length_max = dun_gen_instance.dead_end_length_min + GlobalVariables.rng.randi_range(1, 3)
	dun_gen_instance.set_seed(floor_seed)

func get_pathfinding_grid() -> Array[Vector3]:
	return pathfinding_grid

func set_block(tile: Vector3i, floor_tex: int, ceil_tex: int, wall_faces: Array) -> void:
	var new_block = level_block_template.instantiate()
	add_child(new_block)
	new_block.transform.origin = Vector3(tile.x + 0.5, 0, tile.z + 0.5)  # Adjust position to correct offset

	# Update the pathfinding grid with the position of the new block
	pathfinding_grid.append(new_block.transform.origin)

	# Check if the tile is the end location
	if tile == Vector3i(end_location):
		floor_tex = 15

	# Check if the tile is the start location and set the ceiling texture
	if tile == Vector3i(start_location):
		ceil_tex = 15  # Assuming the end location's floor texture is 15

	new_block.set("bottom_face", floor_tex)
	new_block.set("top_face", ceil_tex)

	# Set wall textures based on precomputed wall_faces
	if wall_faces[0]:  # east
		new_block.set("east_face", wall_texture)
	if wall_faces[1]:  # west
		new_block.set("west_face", wall_texture)
	if wall_faces[2]:  # north
		new_block.set("north_face", wall_texture)
	if wall_faces[3]:  # south
		new_block.set("south_face", wall_texture)

	new_block.call("refresh")

func set_boss_room(tile: Vector3i, wall_faces: Array) -> void:
	for x in range(tile.x - 2, tile.x + 3):
		for z in range(tile.z - 2, tile.z + 3):
			var new_block = level_block_template.instantiate()
			add_child(new_block)
			new_block.transform.origin = Vector3(x + 0.5, 0, z + 0.5)  # Adjust position to correct offset

			new_block.set("bottom_face", 14)  # Set the floor texture to 14 for the entire boss room
			new_block.set("top_face", 14)

			if wall_faces[0] and x == tile.x + 2:  # east wall
				new_block.set("east_face", wall_texture)
			if wall_faces[1] and x == tile.x - 2:  # west wall
				new_block.set("west_face", wall_texture)
			if wall_faces[2] and z == tile.z - 2:  # north wall
				new_block.set("north_face", wall_texture)
			if wall_faces[3] and z == tile.z + 2:  # south wall
				new_block.set("south_face", wall_texture)

			new_block.call("refresh")

func clear_level():
	for child in get_children():
		child.queue_free()
	start_location = Vector3.ZERO
	end_location = Vector3.ZERO
	pathfinding_grid.clear()

func get_random_block():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_block = rng.randi_range(0, pathfinding_grid.size() - 1)
	return pathfinding_grid[random_block]
