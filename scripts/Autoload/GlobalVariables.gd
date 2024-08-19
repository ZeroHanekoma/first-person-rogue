extends Node

# Declare a RandomNumberGenerator instance
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Equipment materials sorted into tiers
var equipment_materials: Array = [
	"Bronze",
	"Iron",
	"Steel",
	"Silver",
	"Gold",
	"Electrum",
	"Platinum",
	"Mithril",
	"Adamantine",
	"Orichalcum",
	"Obsidian",
	"Dragonbone",
	"Starmetal",
	"Darksteel",
	"Runite",
	"Titanium"
]

# Arbitrarily large number for seed cap
const SEED_CAP: int = 4294967295

# Function to set a random seed
func set_random_seed():
	var seed = randi() % SEED_CAP
	rng.seed = seed

# Function to get a random number
func get_random_number():
	return rng.randf()

# Called when the node enters the scene tree for the first time
func _ready():
	# Set a random seed when the game starts
	set_random_seed()

# Function to colorize equipment name based on its material
func get_colored_equipment_name(equipment_name: String) -> String:
	var material_colors = {
		"Bronze": "orange",
		"Iron": "gray",
		"Steel": "silver",
		"Silver": "lightgray",
		"Gold": "gold",
		"Electrum": "palegoldenrod",
		"Platinum": "lightcyan",
		"Mithril": "skyblue",
		"Adamantine": "navy",
		"Orichalcum": "darkorange",
		"Obsidian": "black",
		"Dragonbone": "saddlebrown",
		"Starmetal": "mediumblue",
		"Darksteel": "darkslategray",
		"Runite": "teal",
		"Titanium": "whitesmoke"
	}

	# Extract the material from the equipment name
	for material in equipment_materials:
		if equipment_name.begins_with(material):
			var color = material_colors.get(material, "white")  # Default to white if material not found
			return BbCodeColor.colorize_text(equipment_name, color)

	# If no material is found, return the name in default color
	return BbCodeColor.colorize_text(equipment_name, "white")
