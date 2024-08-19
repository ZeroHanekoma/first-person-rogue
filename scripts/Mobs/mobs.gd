extends CharacterBody3D
class_name Mob

var mob_name : String = "default"

var health : int = 5
var health_max : int = 5
var health_base : int = 5
var mana : int = 0
var mana_max : int = 0
var mana_base : int = 0
var Str : int = 10
var Dex : int = 10
var Con : int = 10
var Int : int = 10
var Wis : int = 10
var Cha : int = 10
var str_mod : int = 0
var dex_mod : int = 0
var con_mod : int = 0
var int_mod : int = 0
var wis_mod : int = 0
var cha_mod : int = 0
var natural_armor : int = 0
var attack_mod : int = 0
var armor_mod : int  = 0

var faction : FactionManager.faction_list = FactionManager.faction_list.UNDEAD

var class_manager : ClassManager
var mob_class: ClassManager.class_list = ClassManager.class_list.WARRIOR
var mob_manager : MobManager
var faction_manager : FactionManager
var inventory : Inventory

var mob_fov : int = 135

# Called when the node enters the scene tree for the first time.
func _ready_mob():
	inventory = Inventory.new()
	add_child(inventory)
	inventory.character = self
	await prepare_mob() # Called first so the mob can prepare
	await set_base_stats() # Set base stats based on faction
	await apply_class_stats()
	await update_modifiers()
	health_max = calculate_health()
	mana_max = calculate_mana()
	health = health_max
	mana = mana_max
	print("Mob Prepared: ", mob_name, " the ", faction_manager.faction_to_string(faction), " ", class_manager.get_class_name(mob_class),
	"\nHealth: ", health,"/",health_max,
	"\nMana: ", mana,"/",mana_max,
	"\nStr: ", Str, "[",str_mod,"]",
	"\nCon: ", Con, "[",con_mod,"]",
	"\nDex: ", Dex, "[",dex_mod,"]",
	"\nInt: ", Int, "[",int_mod,"]",
	"\nWis: ", Wis, "[",wis_mod,"]",
	"\nCha: ", Cha, "[",cha_mod,"]",)
	
func prepare_mob():
	# Mob unique ready function.
	# Mobs will set their base stats, do whatever they need to do to get ready
	pass

func set_base_stats():
	var base_stats = faction_manager.get_base_stats(faction)
	Str = base_stats["Str"]
	Dex = base_stats["Dex"]
	Con = base_stats["Con"]
	Int = base_stats["Int"]
	Wis = base_stats["Wis"]
	Cha = base_stats["Cha"]
	health_base = base_stats["health_base"]
	mana_base = base_stats["mana_base"]
	natural_armor = base_stats["natural_armor"]

func update_modifiers():
	str_mod = calculate_modifier(Str)
	dex_mod = calculate_modifier(Dex)
	con_mod = calculate_modifier(Con)
	int_mod = calculate_modifier(Int)
	wis_mod = calculate_modifier(Wis)
	cha_mod = calculate_modifier(Cha)

func calculate_modifier(stat: int) -> int:
	return (stat - 10) / 2

func get_relationship(other_faction: FactionManager.faction_list) -> int:
	return faction_manager.get_relationship(faction, other_faction)

func apply_class_stats():
	var class_stats = class_manager.get_class_base_stats(mob_class)
	Str += class_stats["Str"]
	Dex += class_stats["Dex"]
	Con += class_stats["Con"]
	Int += class_stats["Int"]
	Wis += class_stats["Wis"]
	Cha += class_stats["Cha"]

	update_modifiers()


func adjust_health(amount : int):
	if amount != 0:
		health += amount
		if health <= 0:
			health = 0
			die()
		if health > health_max:
			health = health_max

func adjust_mana(amount : int):
	if amount != 0:
		mana += amount
		if mana < 0:
			mana = 0
		if mana > mana_max:
			mana = mana_max

func die():
	if self is Player:
		get_tree().reload_current_scene()
	else:
		var state_machine : StateMachine = self.state_machine
		state_machine.switch_states(state_machine.death_state)

# Calculate Health
func calculate_health() -> int:
	return health_base + con_mod * health_max  # Base health + Constitution modifier times max health

# Calculate Mana
func calculate_mana() -> int:
	return mana_base + int_mod * mana_max  # Base mana + Intelligence modifier times max mana

# Calculate Hit chance
func calculate_hit_chance() -> int:
	return 10 + attack_mod + dex_mod  # Base hit chance + Attack modifier + Dexterity modifier

# Calculate Dodge chance
func calculate_dodge_chance() -> int:
	return 10 + dex_mod + armor_mod  # Base dodge chance + Dexterity modifier + Armor modifier

func calculate_damage(base_damage : int) -> int:
	return base_damage + str_mod + attack_mod

# Calculate Melee Damage
func calculate_melee_damage() -> int:
	return 1 + str_mod + attack_mod  # Base melee damage + Strength modifier + Attack modifier

# Calculate Magic Defense
func calculate_magic_defense() -> int:
	return 10 + wis_mod + int_mod  # Base magic defense + Wisdom modifier + Intelligence modifier

# Calculate Armor
func calculate_armor() -> int:
	return natural_armor + armor_mod  # Natural armor + Armor modifier

func equip_item(item_name: String) -> bool:
	var item = inventory.get_item_by_name(item_name)
	if item and item.item_type == Item.ItemType.EQUIPMENT:
		var slot = item.equipment_slot
		if slot in Inventory.EquipmentSlot.values():
			return inventory.equip_item(slot, item)
	return false

# Function to unequip an item from a specific slot
func unequip_item(slot: Inventory.EquipmentSlot) -> bool:
	return inventory.unequip_item(slot)

# Function to add an item to the inventory
func add_item_to_inventory(item: Item, quantity: int = 1) -> bool:
	return inventory.add_item(item.name, item.weight * quantity, Str, faction_manager.get_faction_name(faction))

# Function to remove an item from the inventory
func remove_item_from_inventory(item_name: String, quantity: int = 1) -> bool:
	var item = inventory.get_item_by_name(item_name)
	if item:
		return inventory.remove_item(item_name, item.weight * quantity)
	return false

# Function to check if an item is in the inventory
func has_item_in_inventory(item_name: String) -> bool:
	return inventory.has_item(item_name)

# Function to get the quantity of an item in the inventory
func get_item_quantity(item_name: String) -> int:
	return inventory.get_item_quantity(item_name)

# Function to get the current weight of the inventory
func get_inventory_weight() -> float:
	return inventory.get_current_weight()

# Function to get an item by name from the inventory
func get_item_by_name(item_name: String) -> Item:
	return inventory.get_item_by_name(item_name)

func calculate_physical_damage(base_damage: int, physical_type: DamageTypes.PhysicalType) -> int:
	var damage = base_damage + str_mod + attack_mod
	if physical_type == DamageTypes.PhysicalType.RANGED:
		damage += dex_mod
	return damage

func calculate_magical_damage(base_damage: int, element: DamageTypes.DamageElements) -> int:
	var damage = base_damage + int_mod
	match element:
		DamageTypes.DamageElements.FIRE, DamageTypes.DamageElements.ICE, DamageTypes.DamageElements.THUNDER:
			damage += int_mod
		DamageTypes.DamageElements.DARK, DamageTypes.DamageElements.LIGHT:
			damage += cha_mod
		DamageTypes.DamageElements.PSIONIC:
			damage += wis_mod
		DamageTypes.DamageElements.NONE:
			pass
		_:
			pass
	return damage

func calculate_pure_damage(base_damage: int) -> int:
	return base_damage

func calculate_physical_resistance(damage: int, physical_type: DamageTypes.PhysicalType) -> int:
	var resistance = natural_armor + con_mod
	if physical_type == DamageTypes.PhysicalType.RANGED:
		resistance += dex_mod
	return max(damage - resistance, 0)

func calculate_magical_resistance(damage: int, element: DamageTypes.DamageElements) -> int:
	var resistance = int_mod + wis_mod
	match element:
		DamageTypes.DamageElements.FIRE, DamageTypes.DamageElements.ICE, DamageTypes.DamageElements.THUNDER:
			resistance += con_mod
		DamageTypes.DamageElements.DARK, DamageTypes.DamageElements.LIGHT:
			resistance += cha_mod
		DamageTypes.DamageElements.PSIONIC:
			resistance += int_mod + wis_mod
		DamageTypes.DamageElements.NONE:
			pass
		_:
			pass
	return max(damage - resistance, 0)

func take_damage(amount: int, source: Mob = null, damage_type: DamageTypes.DamageType = DamageTypes.PHYSICAL, element: DamageTypes.DamageElements = DamageTypes.DamageElements.NONE, physical_type: DamageTypes.PhysicalType = DamageTypes.PhysicalType.MELEE) -> int:
	var damage_taken = amount
	match damage_type:
		DamageTypes.DamageType.PHYSICAL:
			damage_taken = calculate_physical_resistance(amount, physical_type)
		DamageTypes.DamageType.MAGICAL:
			damage_taken = calculate_magical_resistance(amount, element)
		DamageTypes.DamageType.PURE:
			damage_taken = amount  # Pure damage bypasses resistances
	damage_taken = max(damage_taken, 1)
	adjust_health(-damage_taken)
	var console_message : String
	if self is Player:
		console_message = str("You take ", damage_taken, " from ", source.mob_name, " the ", source.faction_manager.faction_to_string(source.faction))
		if source.inventory.get_equipped_item(source.inventory.EquipmentSlot.MAINHAND) == null:
			console_message += " using their fists"
		self.playerUI.add_console_message(console_message)
			
	elif source is Player:
		console_message = str("You deal ", damage_taken, " to ", self.mob_name, " the ", self.faction_manager.faction_to_string(self.faction))
		if source.inventory.get_equipped_item(source.inventory.EquipmentSlot.MAINHAND) == null:
			console_message += " with your fists"
		source.playerUI.add_console_message(console_message)

		# Update relationship with the player
		var relation = self.relations.get_mob_relation(source)
		if relation > -50:
			self.relations.update_mob_relation(source, -50 - relation)
		else:
			self.relations.update_mob_relation(source, -5)

		# Target the player immediately
		self.target = source

	return damage_taken

func deal_damage(target: Mob, base_damage: int,source : Mob = null ,damage_type: DamageTypes.DamageType = DamageTypes.DamageType.PHYSICAL, element: DamageTypes.DamageElements = DamageTypes.DamageElements.NONE, physical_type: DamageTypes.PhysicalType = DamageTypes.PhysicalType.MELEE) -> int:
	var damage_dealt = base_damage
	match damage_type:
		DamageTypes.DamageType.PHYSICAL:
			damage_dealt = calculate_physical_damage(base_damage, physical_type)
		DamageTypes.DamageType.MAGICAL:
			damage_dealt = calculate_magical_damage(base_damage, element)
		DamageTypes.DamageType.PURE:
			damage_dealt = calculate_pure_damage(base_damage)
	return target.take_damage(damage_dealt, source, damage_type, element, physical_type)
