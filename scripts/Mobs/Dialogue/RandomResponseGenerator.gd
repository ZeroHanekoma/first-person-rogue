extends Node
class_name RandomResponseGenerator

@export var greeting_resource: Resource
@export var farewell_resource: Resource
@export var rumor_resource: Resource

# Function to determine relationship category
func get_relationship_category(relationship: int) -> String:
	if relationship == 100:
		return "ally"
	elif relationship > 50:
		return "friendly"
	elif relationship < -50:
		return "refuse"
	elif relationship < -25:
		return "hostile"
	else:
		return "neutral"

# Function to generate a random greeting based on faction and relationship
func get_random_greeting(faction: String, relationship: int) -> String:
	var category = get_relationship_category(relationship)
	if category == "refuse":
		return "The NPC refuses to talk to you."
	var greetings = greeting_resource.greetings[faction][category]
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return greetings[rng.randi_range(0, greetings.size() - 1)]

# Function to generate a random farewell based on faction and relationship
func get_random_farewell(faction: String, relationship: int) -> String:
	var category = get_relationship_category(relationship)
	if category == "refuse":
		return "The NPC refuses to talk to you."
	var farewells = farewell_resource.farewells[faction][category]
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return farewells[rng.randi_range(0, farewells.size() - 1)]

# Function to generate a random rumor based on relationship
func get_random_rumor(relationship: int) -> String:
	var category = get_relationship_category(relationship)
	if category == "refuse":
		return "The NPC refuses to talk to you."
	var rumor_templates = rumor_resource.rumors[category]
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var template = rumor_templates[rng.randi_range(0, rumor_templates.size() - 1)]
	return generate_rumor_from_template(template, category)

# Function to generate a rumor from a template
func generate_rumor_from_template(template: String, category: String) -> String:
	# Example implementation, replace placeholders with actual values from the rumor resource
	template = template.replace("$PLACE", get_random_from_list(rumor_resource.places))
	template = template.replace("$PERSON", get_random_from_list(rumor_resource.people))
	template = template.replace("$EVENT", get_random_from_list(rumor_resource.events))
	template = template.replace("$OBJECT", get_random_from_list(rumor_resource.objects))
	template = template.replace("$ACTION", get_random_from_list(rumor_resource.actions))
	
	# If the category is ally or friendly, add a special dungeon-related rumor
	if category in ["ally", "friendly"]:
		template += " I've heard there's something special on floor " + str(get_random_floor()) + " of the dungeon."

	return template

# Helper function to get a random item from a list
func get_random_from_list(list: Array) -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return list[rng.randi_range(0, list.size() - 1)]

# Helper function to get a random dungeon floor number
func get_random_floor() -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(1, 10)  # Example range, adjust as needed

# Function to add a new type of response based on relationship
func add_response(response_type: String, relationship: String, new_response: String):
	match response_type:
		"greeting":
			greeting_resource.greetings[relationship].append(new_response)
		"farewell":
			farewell_resource.farewells[relationship].append(new_response)
		"rumor":
			rumor_resource.rumors[relationship].append(new_response)

# Function to get all responses of a certain type based on relationship
func get_all_responses(response_type: String, relationship: String) -> Array:
	match response_type:
		"greeting":
			return greeting_resource.greetings[relationship]
		"farewell":
			return farewell_resource.farewells[relationship]
		"rumor":
			return rumor_resource.rumors[relationship]
		_:
			return []
