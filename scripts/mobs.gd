extends Node3D
class_name Mob

enum faction_list {
	PLAYER,
	UNDEAD,
	GOBLIN,
	ELF,
	ORC,
	HUMAN,
	DWARF,
	TROLL
}

var health : int = 5
var health_max : int = 5
var mana : int = 0
var mana_max : int = 0
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

var faction : faction_list = faction_list.UNDEAD

# Relationship ratings between factions
var faction_relationships = {
	faction_list.PLAYER: {faction_list.UNDEAD: -100, faction_list.GOBLIN: -50, faction_list.ELF: 100, faction_list.ORC: -75, faction_list.HUMAN: 100, faction_list.DWARF: 75, faction_list.TROLL: -100},
	faction_list.UNDEAD: {faction_list.PLAYER: -100, faction_list.GOBLIN: 25, faction_list.ELF: -100, faction_list.ORC: 50, faction_list.HUMAN: -100, faction_list.DWARF: -50, faction_list.TROLL: 50},
	faction_list.GOBLIN: {faction_list.PLAYER: -50, faction_list.UNDEAD: 25, faction_list.ELF: -75, faction_list.ORC: 75, faction_list.HUMAN: -50, faction_list.DWARF: -50, faction_list.TROLL: 25},
	faction_list.ELF: {faction_list.PLAYER: 100, faction_list.UNDEAD: -100, faction_list.GOBLIN: -75, faction_list.ORC: -100, faction_list.HUMAN: 100, faction_list.DWARF: 50, faction_list.TROLL: -100},
	faction_list.ORC: {faction_list.PLAYER: -75, faction_list.UNDEAD: 50, faction_list.GOBLIN: 75, faction_list.ELF: -100, faction_list.HUMAN: -50, faction_list.DWARF: -75, faction_list.TROLL: 25},
	faction_list.HUMAN: {faction_list.PLAYER: 100, faction_list.UNDEAD: -100, faction_list.GOBLIN: -50, faction_list.ELF: 100, faction_list.ORC: -50, faction_list.DWARF: 75, faction_list.TROLL: -100},
	faction_list.DWARF: {faction_list.PLAYER: 75, faction_list.UNDEAD: -50, faction_list.GOBLIN: -50, faction_list.ELF: 50, faction_list.ORC: -75, faction_list.HUMAN: 75, faction_list.TROLL: -50},
	faction_list.TROLL: {faction_list.PLAYER: -100, faction_list.UNDEAD: 50, faction_list.GOBLIN: 25, faction_list.ELF: -100, faction_list.ORC: 25, faction_list.HUMAN: -100, faction_list.DWARF: -50}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	prepare_mob() #called first so the mob can prepare
	update_modifiers()
	health_max = 10 + con_mod * health
	health = health_max
	mana = mana_max
	
func prepare_mob():
	#mob unique ready function.
	#mobs will set their base stats, do whatever they need to do to get ready
	pass

func update_modifiers():
	str_mod = calculate_modifier(Str)
	dex_mod = calculate_modifier(Dex)
	con_mod = calculate_modifier(Con)
	int_mod = calculate_modifier(Int)
	wis_mod = calculate_modifier(Wis)
	cha_mod = calculate_modifier(Cha)

func calculate_modifier(stat: int) -> int:
	return (stat - 10) / 2

func get_relationship(other_faction: faction_list) -> int:
	if faction in faction_relationships and other_faction in faction_relationships[faction]:
		return faction_relationships[faction][other_faction]
	return 0 # Neutral by default

func adjust_health(amount):
	if amount > 0:
		health -= amount
		if health <= 0:
			health = 0
			die()
		if health > health_max:
			health = health_max

func adjust_mana(amount):
	if amount > 0:
		mana -= amount
		if mana < 0:
			mana = 0
		if mana > mana_max:
			mana = mana_max

func die():
	pass

# Calculate Hit chance
func calculate_hit_chance() -> int:
	return 10 + dex_mod  # Base hit chance + Dexterity modifier

# Calculate Dodge chance
func calculate_dodge_chance() -> int:
	return 10 + dex_mod  # Base dodge chance + Dexterity modifier

# Calculate Melee Damage
func calculate_melee_damage() -> int:
	return 1 + str_mod  # Base melee damage + Strength modifier

# Calculate Magic Defense
func calculate_magic_defense() -> int:
	return 10 + wis_mod  # Base magic defense + Wisdom modifier

# Calculate Armor
func calculate_armor() -> int:
	return 0  # Default armor value; can be modified based on gear
