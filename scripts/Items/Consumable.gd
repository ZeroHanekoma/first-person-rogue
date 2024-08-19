extends Item
class_name Consumable

@export var effect: String
@export var duration: float = 0.0
@export var magnitude: int = 0

# Constructor to initialize the consumable item
func _init_consumable(name: String = "", weight: float = 0.0, description: String = "", quantity: int = 1, effect: String = "", duration: float = 0.0, magnitude: int = 0):
	self.name = name
	self.weight = weight
	self.description = description
	self.quantity = quantity
	self.item_type = Item.ItemType.CONSUMABLE
	self.effect = effect
	self.duration = duration
	self.magnitude = magnitude

# Function to use the consumable
func use(target):
	match effect:
		"heal":
			target.adjust_health(magnitude)
			print("Used " + name + " to heal " + str(magnitude) + " health.")
		"mana":
			target.adjust_mana(magnitude)
			print("Used " + name + " to restore " + str(magnitude) + " mana.")
		# Add other effects as needed
		_:
			print("Used " + name + " but nothing happened.")

	# Decrease the quantity of the consumable
	quantity -= 1
	if quantity < 0:
		quantity = 0

# Function to get the effect description
func get_effect_description() -> String:
	return "Effect: " + effect + ", Duration: " + str(duration) + " seconds, Magnitude: " + str(magnitude)
