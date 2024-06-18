# GlobalVariables.gd
extends Node

# Declare a RandomNumberGenerator instance
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Function to set a random seed
func set_random_seed():
	var seed = randi()
	rng.seed = seed
	print("Seed: ", seed)

# Function to get a random number
func get_random_number():
	return rng.randf()

# Called when the node enters the scene tree for the first time
func _ready():
	# Set a random seed when the game starts
	set_random_seed()
