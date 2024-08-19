extends Item
class_name Equipment

enum EquipmentType {
	MAINHAND,
	OFFHAND,
	HEAD,
	NECK,
	BODY,
	ARMS,
	HANDS,
	WAIST,
	LEGS,
	FEET,
	RING
}

@export var equipment_type: EquipmentType = EquipmentType.MAINHAND

# Function to generate a random piece of equipment made of a specified material
static func generate_random_equipment(material: String) -> Equipment:
	var equipment_names = {
		EquipmentType.MAINHAND: ["Sword", "Axe", "Spear", "Mace"],
		EquipmentType.OFFHAND: ["Shield", "Dagger"],
		EquipmentType.HEAD: ["Helmet", "Hat"],
		EquipmentType.NECK: ["Amulet", "Necklace"],
		EquipmentType.BODY: ["Armor", "Robe"],
		EquipmentType.ARMS: ["Bracers", "Vambraces"],
		EquipmentType.HANDS: ["Gloves", "Gauntlets"],
		EquipmentType.WAIST: ["Belt", "Sash"],
		EquipmentType.LEGS: ["Greaves", "Pants"],
		EquipmentType.FEET: ["Boots", "Shoes"],
		EquipmentType.RING: ["Ring"]
	}

	var rng = RandomNumberGenerator.new()
	rng.randomize()

	var equip_type = EquipmentType.values()[rng.randi_range(0, EquipmentType.RING)]
	var name_list = equipment_names[equip_type]
	var item_name = material + " " + name_list[rng.randi_range(0, name_list.size() - 1)]

	var new_equipment = Equipment.new()
	new_equipment.name = item_name
	new_equipment.weight = rng.randf_range(1.0, 10.0)  # Random weight between 1 and 10
	new_equipment.description = "A " + item_name + " made of " + material
	new_equipment.quantity = 1
	new_equipment.item_type = Item.ItemType.EQUIPMENT
	new_equipment.equipment_slot = equip_type

	return new_equipment

# Function to determine a random material based on a weight variable
func determine_random_material(weight: float = 0.5) -> String:
	var materials = GlobalVariables.equipment_materials
	var material_weights = []
	var total_weight = 0.0

	for i in range(materials.size()):
		var w = pow(abs(weight - float(i) / float(materials.size() - 1)), 2)
		material_weights.append(w)
		total_weight += w

	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_value = rng.randf() * total_weight

	for i in range(materials.size()):
		if random_value < material_weights[i]:
			return materials[i]
		random_value -= material_weights[i]

	return materials[materials.size() - 1]  # Default to the last material if none selected
