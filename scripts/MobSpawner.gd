extends Node
class_name MobSpawnManager

var mob_manager : MobManager
const MOB_BASE = preload("res://mobs/mobs/mob_base.tscn")
func generate_mobs(mobs : int):
	for i in mobs:
		var mob = generate_random_mob()
		mob_manager.add_to_mob_list(mob)

# Function to generate a random mob of a random faction
func generate_random_mob():
	# Access the faction manager via mob_manager
	var faction_manager = mob_manager.faction_manager
	var class_manager = mob_manager.class_manager
	# Get a random faction
	var random_faction = faction_manager.get_random_faction()
	var random_class = class_manager.get_random_class()
	# Create a new mob
	var new_mob = MOB_BASE.instantiate()

	# Set the mob's faction
	new_mob.faction = random_faction
	new_mob.mob_class = random_class

	return new_mob
