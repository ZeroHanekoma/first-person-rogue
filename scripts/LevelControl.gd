@tool
extends Node3D
class_name LevelControl

const RoomBase = preload("res://level/Rooms/RoomBase.tscn")

@export var block_size: float = 2.0  # Each tile is 2x2 meters
@export var dungeon_floor: int = 1  # The floor number, higher floors will have more rooms

func _ready():
	create_dungeon()

func create_dungeon():
	var occupied_positions = {}  # Dictionary to keep track of occupied positions
	var room_positions = []  # List to keep track of room positions

	# Create the initial 3x3 room at (0, 0)
	var initial_room = RoomBase.instantiate()
	initial_room.room_width = 3
	initial_room.room_length = 3
	initial_room.position = Vector3(0, 0, 0)
	add_child(initial_room)
	initial_room.create_room()
	mark_occupied_positions(Vector2(0, 0), Vector2(3, 3), occupied_positions)
	room_positions.append(Vector2(0, 0))

	# Generate a random number of rooms based on dungeon_floor
	var num_rooms = int(GlobalVariables.rng.randf_range(5, 10) * dungeon_floor)
	for i in range(num_rooms):
		var room_width = int(GlobalVariables.rng.randf_range(2, 5))
		var room_length = int(GlobalVariables.rng.randf_range(2, 5))
		var room = RoomBase.instantiate()
		room.room_width = room_width
		room.room_length = room_length
		
		# Find a valid position for the new room
		var valid_position = false
		var new_position = Vector2()
		var attempts = 0
		while not valid_position and attempts < 100:
			var offset_x = GlobalVariables.rng.randi_range(-5, 5) * room_width
			var offset_y = GlobalVariables.rng.randi_range(-5, 5) * room_length
			new_position = Vector2(offset_x, offset_y)
			valid_position = is_valid_position(new_position, Vector2(room_width, room_length), occupied_positions)
			attempts += 1
		
		if not valid_position:
			continue
		
		# Adjust position to ensure the center of the room is aligned with a block
		var centered_position = new_position + Vector2((room_width / 2 - 0.5) if room_width % 2 == 0 else room_width / 2, (room_length / 2 - 0.5) if room_length % 2 == 0 else room_length / 2)

		# Add the new room at the valid position
		room.position = Vector3(centered_position.x * block_size, 0, centered_position.y * block_size)
		add_child(room)
		room.create_room()
		
		# Mark the positions occupied by the new room
		mark_occupied_positions(new_position, Vector2(room_width, room_length), occupied_positions)
		room_positions.append(centered_position)
	
	# Connect rooms with hallways ensuring all rooms are accessible
	connect_all_rooms(room_positions, occupied_positions)

# Function to check if the position is valid (no overlap)
func is_valid_position(position, size, occupied_positions):
	for x in range(size.x):
		for y in range(size.y):
			var check_position = position + Vector2(x, y)
			if occupied_positions.has(check_position):
				return false
	return true

# Function to mark the positions occupied by the room
func mark_occupied_positions(position, size, occupied_positions):
	for x in range(size.x):
		for y in range(size.y):
			var occupied_position = position + Vector2(x, y)
			occupied_positions[occupied_position] = true

# Function to connect all rooms ensuring accessibility
func connect_all_rooms(room_positions, occupied_positions):
	var connected_rooms = [room_positions[0]]
	var remaining_rooms = room_positions.slice(1)

	while remaining_rooms.size() > 0:
		var closest_room = null
		var closest_distance = INF
		var start_room = null

		for connected_room in connected_rooms:
			for room in remaining_rooms:
				var distance = connected_room.distance_to(room)
				if distance < closest_distance:
					closest_distance = distance
					closest_room = room
					start_room = connected_room

		connect_rooms(start_room, closest_room, occupied_positions)
		connected_rooms.append(closest_room)
		remaining_rooms.erase(closest_room)

# Function to connect two rooms with a hallway
func connect_rooms(start, end, occupied_positions):
	print("Starting connection from", start, "to", end)
	var current_position = start

	# Visited positions to avoid infinite loops
	var visited_positions = []

	# First, move horizontally until x-coordinates match
	while current_position.x != end.x:
		print("Current position:", current_position, "End position:", end)
		visited_positions.append(current_position)
		var next_x = current_position.x + sign(end.x - current_position.x)
		var next_position = Vector2(next_x, current_position.y)

		# Check if next position has been visited to avoid oscillation
		if next_position in visited_positions:
			print("Breaking horizontal loop to avoid infinite loop")
			break
		
		create_hallway(Vector2(current_position.x, current_position.y), next_position, occupied_positions)
		current_position.x = next_x
		print("Moved horizontally to", current_position)

	# Then, move vertically until y-coordinates match
	while current_position.y != end.y:
		print("Current position:", current_position, "End position:", end)
		visited_positions.append(current_position)
		var next_y = current_position.y + sign(end.y - current_position.y)
		var next_position = Vector2(current_position.x, next_y)

		# Check if next position has been visited to avoid oscillation
		if next_position in visited_positions:
			print("Breaking vertical loop to avoid infinite loop")
			break

		create_hallway(Vector2(current_position.x, current_position.y), next_position, occupied_positions)
		current_position.y = next_y
		print("Moved vertically to", current_position)

	print("Finished connection to", end)

# Function to create a hallway segment
func create_hallway(start_pos, end_pos, occupied_positions):
	var hallway_width = 2 if start_pos.x != end_pos.x else 1
	var hallway_length = 1 if start_pos.y != end_pos.y else 2
	
	var hallway = RoomBase.instantiate()
	hallway.room_width = hallway_width
	hallway.room_length = hallway_length
	hallway.position = Vector3(start_pos.x * block_size, 0, start_pos.y * block_size)
	add_child(hallway)
	hallway.create_room()
	
	mark_occupied_positions(start_pos, Vector2(hallway_width, hallway_length), occupied_positions)
	print("Hallway created from", start_pos, "to", end_pos)
