extends Node
class_name Inventory

@export var base_carry_limit: int = 50  # Base carry limit, adjustable as needed
@export var strength_modifier: float = 1.0  # Multiplier for carry limit based on strength
@export var race_modifier: float = 1.0  # Multiplier for carry limit based on race

var items: Dictionary = {}  # Inventory items
var current_weight: float = 0.0  # Current total weight of the inventory

var character : Mob

# Equipment slots
enum EquipmentSlot {
	NONE,
	HEAD,
	NECK,
	BODY,
	ARMS,
	HANDS,
	WAIST,
	LEGS,
	FEET,
	RING1,
	RING2,
	BACK,
	MAINHAND,
	OFFHAND
}

var equipment: Dictionary = {
	EquipmentSlot.HEAD: null,
	EquipmentSlot.NECK: null,
	EquipmentSlot.BODY: null,
	EquipmentSlot.ARMS: null,
	EquipmentSlot.HANDS: null,
	EquipmentSlot.WAIST: null,
	EquipmentSlot.LEGS: null,
	EquipmentSlot.FEET: null,
	EquipmentSlot.RING1: null,
	EquipmentSlot.RING2: null,
	EquipmentSlot.BACK: null,
	EquipmentSlot.MAINHAND: null,
	EquipmentSlot.OFFHAND: null
}

var locked_slots: Dictionary = {
	EquipmentSlot.HEAD: false,
	EquipmentSlot.NECK: false,
	EquipmentSlot.BODY: false,
	EquipmentSlot.ARMS: false,
	EquipmentSlot.HANDS: false,
	EquipmentSlot.WAIST: false,
	EquipmentSlot.LEGS: false,
	EquipmentSlot.FEET: false,
	EquipmentSlot.RING1: false,
	EquipmentSlot.RING2: false,
	EquipmentSlot.BACK: false,
	EquipmentSlot.MAINHAND: null,
	EquipmentSlot.OFFHAND: null
}

# Function to calculate the carry limit based on modifiers
func get_carry_limit(strength: int, race: String) -> float:
	return base_carry_limit * strength * strength_modifier * race_modifier

# Function to add an item to the inventory
func add_item(item_name: String, item_weight: float, strength: int, race: String) -> bool:
	var carry_limit = get_carry_limit(strength, race)
	if current_weight + item_weight <= carry_limit:
		if items.has(item_name):
			items[item_name] += 1
		else:
			items[item_name] = 1
		current_weight += item_weight
		return true
	else:
		print("Cannot add item. Carry limit exceeded.")
		return false

# Function to remove an item from the inventory
func remove_item(item_name: String, item_weight: float) -> bool:
	if items.has(item_name):
		items[item_name] -= 1
		if items[item_name] <= 0:
			items.erase(item_name)
		current_weight -= item_weight
		return true
	else:
		print("Item not found in inventory.")
		return false

# Function to get the current weight of the inventory
func get_current_weight() -> float:
	return current_weight

# Function to check if an item is in the inventory
func has_item(item_name: String) -> bool:
	return items.has(item_name)

# Function to get the quantity of an item in the inventory
func get_item_quantity(item_name: String) -> int:
	return items.get(item_name, 0)

# Function to clear the inventory
func clear_inventory():
	items.clear()
	current_weight = 0.0

# Function to equip an item
func equip_item(slot: EquipmentSlot, item: Item) -> bool:
	if slot == EquipmentSlot.NONE:
		print("This item cannot be equipped.")
		return false
	if locked_slots[slot]:
		print("This slot is locked and cannot be equipped.")
		return false
	if equipment[slot] != null:
		print("Slot already occupied. Unequip the item first.")
		return false
	if not has_item(item.name):
		print("Item not found in inventory.")
		return false
	equipment[slot] = item
	remove_item(item.name, item.weight)
	return true

# Function to unequip an item
func unequip_item(slot: EquipmentSlot) -> bool:
	if equipment[slot] == null:
		print("Slot is already empty.")
		return false
	var item = equipment[slot]
	equipment[slot] = null
	add_item(item.name, item.weight, 0, "")  # Assume strength and race are not relevant for unequipping
	return true

# Function to get the item in a specific equipment slot
func get_equipped_item(slot: EquipmentSlot) -> Item:
	return equipment[slot]

# Function to lock an equipment slot
func lock_slot(slot: EquipmentSlot):
	locked_slots[slot] = true

# Function to unlock an equipment slot
func unlock_slot(slot: EquipmentSlot):
	locked_slots[slot] = false

# Function to check if a slot is locked
func is_slot_locked(slot: EquipmentSlot) -> bool:
	return locked_slots[slot]

# Function to use a consumable item
func use_consumable(item_name: String, target: Mob) -> bool:
	if items.has(item_name):
		var item = items[item_name]
		if item is Consumable:
			var consumable = item as Consumable
			consumable.use(target)
			if consumable.quantity <= 0:
				items.erase(item_name)
			return true
		else:
			print("Item is not a consumable.")
			return false
	else:
		print("Item not found in inventory.")
		return false
