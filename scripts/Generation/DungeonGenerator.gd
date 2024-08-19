extends Node3D

@export var dungeon_width: int = 50  # Width of the dungeon in tiles
@export var dungeon_height: int = 50  # Height of the dungeon in tiles
@export var max_rooms: int = 10  # Maximum number of rooms
@export var min_room_size: int = 6  # Minimum room size
@export var max_room_size: int = 12  # Maximum room size

var map = []
var rooms = []

func _ready():
	initialize_map()
	generate_random_rooms()
	connect_rooms()

func initialize_map():
	map = []
	for x in range(dungeon_width):
		var row = []
		for y in range(dungeon_height):
			row.append("X")  # "X" represents a wall
		map.append(row)

func generate_random_rooms():
	for i in range(max_rooms):
		var room = generate_room()
		if place_room(room):
			rooms.append(room)

func generate_room():
	var room_width = randi_range(min_room_size, max_room_size)
	var room_height = randi_range(min_room_size, max_room_size)
	var x = randi_range(0, dungeon_width - room_width - 1)
	var y = randi_range(0, dungeon_height - room_height - 1)
	return Rect2(Vector2(x, y), Vector2(room_width, room_height))

func place_room(room: Rect2) -> bool:
	for x in range(room.position.x, room.position.x + room.size.x):
		for y in range(room.position.y, room.position.y + room.size.y):
			if map[x][y] != "X":
				return false

	for x in range(room.position.x, room.position.x + room.size.x):
		for y in range(room.position.y, room.position.y + room.size.y):
			map[x][y] = "O"  # "O" represents a walkable tile

	return true

func connect_rooms():
	for i in range(1, rooms.size()):
		var room1 = rooms[i - 1]
		var room2 = rooms[i]
		var point1 = room1.position + room1.size / 2
		var point2 = room2.position + room2.size / 2

		if randi() % 2 == 0:
			create_h_tunnel(point1.x, point2.x, point1.y)
			create_v_tunnel(point1.y, point2.y, point2.x)
		else:
			create_v_tunnel(point1.y, point2.y, point1.x)
			create_h_tunnel(point1.x, point2.x, point2.y)

func create_h_tunnel(x1: int, x2: int, y: int):
	for x in range(min(x1, x2), max(x1, x2) + 1):
		if map[x][y] == "X":
			map[x][y] = "O"  # "O" represents a walkable tile

func create_v_tunnel(y1: int, y2: int, x: int):
	for y in range(min(y1, y2), max(y1, y2) + 1):
		if map[x][y] == "X":
			map[x][y] = "O"  # "O" represents a walkable tile

# Function to get the generated map data
func get_map():
	return map
