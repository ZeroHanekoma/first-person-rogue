@tool
extends Node3D

@onready var grid_map : GridMap = $"../GridMap"

@export var floor_texture : int = 4
@export var ceiling_texture : int = 5
@export var wall_texture : int = 0

var block_data = []
var door_positions = []

func generate():
	# Clear existing block data
	block_data.clear()
	door_positions.clear()

	# Precompute block data with wall information
	var used_cells = grid_map.get_used_cells()
	for cell in used_cells:
		var cell_item = grid_map.get_cell_item(cell)
		if cell_item == 0 or cell_item == 1 or cell_item == 2 or cell_item == 6 or cell_item == 7:  # including new room types
			var neighbors = [
				Vector3i(cell.x + 1, cell.y, cell.z),  # east
				Vector3i(cell.x - 1, cell.y, cell.z),  # west
				Vector3i(cell.x, cell.y, cell.z - 1),  # north
				Vector3i(cell.x, cell.y, cell.z + 1)   # south
			]

			var wall_faces = [false, false, false, false]  # [east, west, north, south]
			for i in range(neighbors.size()):
				var neighbor_item = grid_map.get_cell_item(neighbors[i])
				if neighbor_item == -1 or neighbor_item == 3:  # consider empty and border cells for walls
					wall_faces[i] = true

			block_data.append({
				"position": cell,
				"floor_texture": floor_texture,
				"ceiling_texture": ceiling_texture,
				"wall_faces": wall_faces,
				"is_door": cell_item == 2
			})

			if cell_item == 2:
				door_positions.append(cell)

func get_block_data() -> Array:
	return block_data

func get_door_positions() -> Array:
	return door_positions
