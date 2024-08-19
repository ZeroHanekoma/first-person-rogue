extends Node
class_name ClassManager

enum class_list {
	# Player Classes
	WARRIOR,
	MAGE,
	ROGUE,
	CLERIC,
	PALADIN,
	RANGER,
	BARD,
	DRUID,
	MONK,
	BARBARIAN,
	SORCERER,
	WARLOCK,
	ASSASSIN,
	NECROMANCER,
	ALCHEMIST,
	SPELLBLADE,
	SHAMAN,  # New addition
	ARCHER,  # New addition
	KNIGHT,  # New addition
	SUMMONER,  # New addition
	ILLUSIONIST,  # New addition
	PSIONIC,  # New addition
	BATTLEMAGE,  # New addition
	SWASHBUCKLER,  # New addition
	SPELLSWORD,  # New addition
	HUNTER  # New addition
}


var class_base_stats = {
	class_list.WARRIOR: { "Str": 2, "Dex": 0, "Con": 2, "Int": -1, "Wis": 0, "Cha": 0 },
	class_list.MAGE: { "Str": -1, "Dex": 0, "Con": 0, "Int": 2, "Wis": 2, "Cha": 0 },
	class_list.ROGUE: { "Str": 0, "Dex": 2, "Con": 0, "Int": 0, "Wis": -1, "Cha": 1 },
	class_list.CLERIC: { "Str": 0, "Dex": 0, "Con": 1, "Int": 0, "Wis": 2, "Cha": 0 },
	class_list.PALADIN: { "Str": 2, "Dex": 0, "Con": 1, "Int": 0, "Wis": 1, "Cha": 2 },
	class_list.RANGER: { "Str": 1, "Dex": 2, "Con": 0, "Int": 0, "Wis": 1, "Cha": 0 },
	class_list.BARD: { "Str": 0, "Dex": 1, "Con": 0, "Int": 1, "Wis": 0, "Cha": 2 },
	class_list.DRUID: { "Str": 0, "Dex": 0, "Con": 1, "Int": 0, "Wis": 2, "Cha": 0 },
	class_list.MONK: { "Str": 1, "Dex": 2, "Con": 0, "Int": 0, "Wis": 1, "Cha": 0 },
	class_list.BARBARIAN: { "Str": 2, "Dex": 1, "Con": 2, "Int": -1, "Wis": -1, "Cha": 0 },
	class_list.SORCERER: { "Str": 0, "Dex": 0, "Con": -1, "Int": 1, "Wis": 0, "Cha": 2 },
	class_list.WARLOCK: { "Str": 0, "Dex": 0, "Con": 0, "Int": 1, "Wis": -1, "Cha": 2 },
	class_list.ASSASSIN: { "Str": 1, "Dex": 2, "Con": 0, "Int": 1, "Wis": 0, "Cha": -1 },
	class_list.NECROMANCER: { "Str": -1, "Dex": 0, "Con": 0, "Int": 2, "Wis": 1, "Cha": 0 },
	class_list.ALCHEMIST: { "Str": 0, "Dex": 1, "Con": 0, "Int": 2, "Wis": 1, "Cha": 0 },
	class_list.SPELLBLADE: { "Str": 1, "Dex": 1, "Con": 0, "Int": 1, "Wis": 0, "Cha": 0 },
	class_list.SHAMAN: { "Str": 0, "Dex": 0, "Con": 1, "Int": 1, "Wis": 2, "Cha": 0 },
	class_list.ARCHER: { "Str": 0, "Dex": 2, "Con": 0, "Int": 0, "Wis": 1, "Cha": 0 },
	class_list.KNIGHT: { "Str": 2, "Dex": 0, "Con": 2, "Int": 0, "Wis": 0, "Cha": 1 },
	class_list.SUMMONER: { "Str": 0, "Dex": 0, "Con": 0, "Int": 2, "Wis": 1, "Cha": 1 },
	class_list.ILLUSIONIST: { "Str": -1, "Dex": 0, "Con": 0, "Int": 2, "Wis": 0, "Cha": 2 },
	class_list.PSIONIC: { "Str": 0, "Dex": 0, "Con": 1, "Int": 2, "Wis": 1, "Cha": 0 },
	class_list.BATTLEMAGE: { "Str": 1, "Dex": 0, "Con": 1, "Int": 1, "Wis": 0, "Cha": 0 },
	class_list.SWASHBUCKLER: { "Str": 0, "Dex": 2, "Con": 0, "Int": 0, "Wis": 0, "Cha": 2 },
	class_list.SPELLSWORD: { "Str": 1, "Dex": 1, "Con": 0, "Int": 1, "Wis": 0, "Cha": 0 },
	class_list.HUNTER: { "Str": 1, "Dex": 2, "Con": 0, "Int": 0, "Wis": 1, "Cha": 0 }
}

func get_class_base_stats(mob_class: class_list) -> Dictionary:
	if mob_class in class_base_stats:
		return class_base_stats[mob_class]
	return { "Str": 0, "Dex": 0, "Con": 0, "Int": 0, "Wis": 0, "Cha": 0 }  # Default stats adjustment if class is not found

func get_random_class() -> class_list:
	var classes = class_list.values()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return classes[rng.randi_range(0,classes.size() - 1)]

func get_class_name(mob_class: class_list) -> String:
	match mob_class:
		class_list.WARRIOR:
			return "Warrior"
		class_list.MAGE:
			return "Mage"
		class_list.ROGUE:
			return "Rogue"
		class_list.CLERIC:
			return "Cleric"
		class_list.PALADIN:
			return "Paladin"
		class_list.RANGER:
			return "Ranger"
		class_list.BARD:
			return "Bard"
		class_list.DRUID:
			return "Druid"
		class_list.MONK:
			return "Monk"
		class_list.BARBARIAN:
			return "Barbarian"
		class_list.SORCERER:
			return "Sorcerer"
		class_list.WARLOCK:
			return "Warlock"
		class_list.ASSASSIN:
			return "Assassin"
		class_list.NECROMANCER:
			return "Necromancer"
		class_list.ALCHEMIST:
			return "Alchemist"
		class_list.SPELLBLADE:
			return "Spellblade"
		class_list.SHAMAN:
			return "Shaman"
		class_list.ARCHER:
			return "Archer"
		class_list.KNIGHT:
			return "Knight"
		class_list.SUMMONER:
			return "Summoner"
		class_list.ILLUSIONIST:
			return "Illusionist"
		class_list.PSIONIC:
			return "Psionic"
		class_list.BATTLEMAGE:
			return "Battlemage"
		class_list.SWASHBUCKLER:
			return "Swashbuckler"
		class_list.SPELLSWORD:
			return "Spellsword"
		class_list.HUNTER:
			return "Hunter"
		_:
			return "Unknown"
