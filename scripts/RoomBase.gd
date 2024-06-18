@tool
extends Node3D
class_name RoomBase

const LevelBlock = preload("res://addons/level_block/level_block_node.gd")

@export var room_width: int = 3
@export var room_length: int = 3
@export var block_size: float = 2.0  # Each tile is 2x2 meters
@export var texture_sheet: Texture2D = null
@export var texture_size: float = 32.0

func create_room():
	var half_room_width = (room_width - 1) / 2.0
	var half_room_length = (room_length - 1) / 2.0

	for x in range(room_width):
		for z in range(room_length):
			var block = LevelBlock.new()
			block.texture_sheet = texture_sheet
			block.texture_size = texture_size
			block.position = Vector3((x - half_room_width) * block_size, 0, (z - half_room_length) * block_size)

			# Set the floor and ceiling textures
			block.top_face = 4  # Floor texture
			block.bottom_face = 5  # Ceiling texture

			# Set the wall textures
			if x == 0:
				block.west_face = 0  # Wall texture
			if x == room_width - 1:
				block.east_face = 0  # Wall texture
			if z == 0:
				block.north_face = 0  # Wall texture
			if z == room_length - 1:
				block.south_face = 0  # Wall texture

			add_child(block)
