extends Node
class_name MobRelations

# Dictionary to store personal relations with other mobs
# The key is the instance ID of the other mob, and the value is the relationship score
var relations: Dictionary = {}

# Adds a mob to the relations dictionary with an initial relationship value
func add_mob_relation(mob: Mob, initial_relation: int = 0):
	var mob_id = mob.get_instance_id()
	if not relations.has(mob_id):
		relations[mob_id] = initial_relation
	print(relations)

# Updates the relationship value for a given mob
func update_mob_relation(mob: Mob, value: int):
	var mob_id = mob.get_instance_id()
	if relations.has(mob_id):
		relations[mob_id] += value
	else:
		relations[mob_id] = value
	print(relations)

# Returns the relationship value for a given mob
func get_mob_relation(mob: Mob) -> int:
	var mob_id = mob.get_instance_id()
	if relations.has(mob_id):
		return relations[mob_id]
	else:
		return 0  # Default relationship value if not found

# Removes a mob from the relations dictionary
func remove_mob_relation(mob: Mob):
	var mob_id = mob.get_instance_id()
	if relations.has(mob_id):
		relations.erase(mob_id)

# Resets all relations
func reset_relations():
	relations.clear()
