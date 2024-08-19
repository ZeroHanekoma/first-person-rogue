extends Resource
class_name Item

enum ItemType {
	GENERIC,
	EQUIPMENT,
	CONSUMABLE
}

@export var name: String
@export var weight: float
@export var description: String = ""
@export var quantity: int = 1
@export var item_type: ItemType = ItemType.GENERIC
@export var equipment_slot: int = -1  # Default value to avoid type errors

# Constructor to initialize the item
func _init_item(name: String = "", weight: float = 0.0, description: String = "", quantity: int = 1, item_type: ItemType = ItemType.GENERIC, equipment_slot: int = -1):
	self.name = name
	self.weight = weight
	self.description = description
	self.quantity = quantity
	self.item_type = item_type
	self.equipment_slot = equipment_slot
