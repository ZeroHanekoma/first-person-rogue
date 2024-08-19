extends Node
class_name FactionManager

enum faction_list {
	HUMAN,
	ELF,
	DWARF,
	HALFLING,
	GNOME,
	ORC,
	TIEFLING,
	DRAGONBORN,
	DROW,
	HALF_ELF,
	HALF_ORC,
	AASIMAR,
	KENKU,
	TABAXI,
	LIZARDFOLK,
	MERFOLK,
	TROLL,
	FAIRY,
	VAMPIRE,
	LYCAN,
	DEMON,
	ANGEL,
	BEAST,
	MINOTAUR,
	HARPY,
	CYCLOPS,
	GIANT,
	OGRE,
	KOBOLD,
	UNDEAD,
	CHIMERA,
	GOBLIN,
	DRAGON
}

var base_stats = {
	faction_list.HUMAN: { "Str": 10, "Dex": 10, "Con": 10, "Int": 10, "Wis": 10, "Cha": 10, "health_base": 10, "mana_base": 5, "natural_armor": 0 },
	faction_list.ELF: { "Str": 8, "Dex": 12, "Con": 8, "Int": 12, "Wis": 10, "Cha": 10, "health_base": 8, "mana_base": 10, "natural_armor": 0 },
	faction_list.DWARF: { "Str": 12, "Dex": 8, "Con": 12, "Int": 8, "Wis": 10, "Cha": 8, "health_base": 12, "mana_base": 5, "natural_armor": 1 },
	faction_list.HALFLING: { "Str": 8, "Dex": 12, "Con": 8, "Int": 10, "Wis": 10, "Cha": 12, "health_base": 8, "mana_base": 5, "natural_armor": 0 },
	faction_list.GNOME: { "Str": 6, "Dex": 12, "Con": 8, "Int": 12, "Wis": 10, "Cha": 10, "health_base": 8, "mana_base": 10, "natural_armor": 0 },
	faction_list.ORC: { "Str": 14, "Dex": 8, "Con": 12, "Int": 6, "Wis": 8, "Cha": 6, "health_base": 14, "mana_base": 0, "natural_armor": 1 },
	faction_list.TIEFLING: { "Str": 8, "Dex": 10, "Con": 8, "Int": 12, "Wis": 8, "Cha": 12, "health_base": 8, "mana_base": 10, "natural_armor": 0 },
	faction_list.DRAGONBORN: { "Str": 12, "Dex": 8, "Con": 12, "Int": 8, "Wis": 8, "Cha": 10, "health_base": 12, "mana_base": 5, "natural_armor": 1 },
	faction_list.DROW: { "Str": 10, "Dex": 12, "Con": 8, "Int": 10, "Wis": 8, "Cha": 10, "health_base": 8, "mana_base": 10, "natural_armor": 0 },
	faction_list.HALF_ELF: { "Str": 10, "Dex": 10, "Con": 10, "Int": 10, "Wis": 10, "Cha": 10, "health_base": 10, "mana_base": 5, "natural_armor": 0 },
	faction_list.HALF_ORC: { "Str": 14, "Dex": 8, "Con": 12, "Int": 6, "Wis": 8, "Cha": 6, "health_base": 14, "mana_base": 0, "natural_armor": 1 },
	faction_list.AASIMAR: { "Str": 10, "Dex": 10, "Con": 10, "Int": 10, "Wis": 12, "Cha": 12, "health_base": 10, "mana_base": 10, "natural_armor": 0 },
	faction_list.KENKU: { "Str": 8, "Dex": 14, "Con": 8, "Int": 10, "Wis": 8, "Cha": 8, "health_base": 8, "mana_base": 5, "natural_armor": 0 },
	faction_list.TABAXI: { "Str": 8, "Dex": 14, "Con": 8, "Int": 10, "Wis": 8, "Cha": 8, "health_base": 8, "mana_base": 5, "natural_armor": 0 },
	faction_list.LIZARDFOLK: { "Str": 12, "Dex": 10, "Con": 12, "Int": 8, "Wis": 8, "Cha": 6, "health_base": 12, "mana_base": 0, "natural_armor": 1 },
	faction_list.MERFOLK: { "Str": 10, "Dex": 10, "Con": 8, "Int": 10, "Wis": 10, "Cha": 12, "health_base": 8, "mana_base": 10, "natural_armor": 0 },

	# Base stats for monster factions
	faction_list.UNDEAD: { "Str": 10, "Dex": 8, "Con": 12, "Int": 8, "Wis": 8, "Cha": 6, "health_base": 12, "mana_base": 0, "natural_armor": 1 },
	faction_list.TROLL: { "Str": 16, "Dex": 8, "Con": 16, "Int": 6, "Wis": 6, "Cha": 4, "health_base": 16, "mana_base": 0, "natural_armor": 2 },
	faction_list.FAIRY: { "Str": 6, "Dex": 14, "Con": 8, "Int": 12, "Wis": 12, "Cha": 14, "health_base": 8, "mana_base": 12, "natural_armor": 0 },
	faction_list.DEMON: { "Str": 12, "Dex": 12, "Con": 12, "Int": 12, "Wis": 8, "Cha": 12, "health_base": 12, "mana_base": 10, "natural_armor": 1 },
	faction_list.ANGEL: { "Str": 12, "Dex": 12, "Con": 12, "Int": 10, "Wis": 14, "Cha": 14, "health_base": 12, "mana_base": 12, "natural_armor": 1 },
	faction_list.GOBLIN: { "Str": 8, "Dex": 14, "Con": 8, "Int": 10, "Wis": 8, "Cha": 6, "health_base": 8, "mana_base": 5, "natural_armor": 0 },
	faction_list.VAMPIRE: { "Str": 12, "Dex": 12, "Con": 12, "Int": 12, "Wis": 8, "Cha": 14, "health_base": 12, "mana_base": 10, "natural_armor": 1 },
	faction_list.LYCAN: { "Str": 14, "Dex": 12, "Con": 14, "Int": 6, "Wis": 8, "Cha": 6, "health_base": 14, "mana_base": 0, "natural_armor": 1 },
	faction_list.CYCLOPS: { "Str": 14, "Dex": 12, "Con": 12, "Int": 10, "Wis": 8, "Cha": 10, "health_base": 12, "mana_base": 5, "natural_armor": 1 },
	faction_list.GIANT: { "Str": 16, "Dex": 8, "Con": 16, "Int": 6, "Wis": 6, "Cha": 4, "health_base": 16, "mana_base": 0, "natural_armor": 2 },
	faction_list.OGRE: { "Str": 16, "Dex": 8, "Con": 16, "Int": 6, "Wis": 6, "Cha": 4, "health_base": 16, "mana_base": 0, "natural_armor": 2 },
	faction_list.HARPY: { "Str": 8, "Dex": 12, "Con": 8, "Int": 10, "Wis": 8, "Cha": 10, "health_base": 8, "mana_base": 5, "natural_armor": 0 },
	faction_list.MINOTAUR: { "Str": 16, "Dex": 8, "Con": 14, "Int": 6, "Wis": 8, "Cha": 6, "health_base": 14, "mana_base": 0, "natural_armor": 1 },
	faction_list.KOBOLD: { "Str": 10, "Dex": 12, "Con": 10, "Int": 12, "Wis": 10, "Cha": 12, "health_base": 10, "mana_base": 10, "natural_armor": 0 },
	faction_list.BEAST: { "Str": 12, "Dex": 12, "Con": 12, "Int": 6, "Wis": 6, "Cha": 6, "health_base": 12, "mana_base": 0, "natural_armor": 1 },
	faction_list.CHIMERA: { "Str": 14, "Dex": 10, "Con": 14, "Int": 6, "Wis": 6, "Cha": 6, "health_base": 14, "mana_base": 0, "natural_armor": 1 },
	faction_list.DRAGON: { "Str": 20, "Dex": 14, "Con": 20, "Int": 16, "Wis": 14, "Cha": 18, "health_base": 50, "mana_base": 30, "natural_armor": 5 }
}


# Method to get the base stats for a faction
func get_base_stats(faction: int) -> Dictionary:
	if faction in base_stats:
		return base_stats[faction]
	return { "Str": 10, "Dex": 10, "Con": 10, "Int": 10, "Wis": 10, "Cha": 10, "health_base": 10, "mana_base": 5, "natural_armor": 0 }  # Default stats if not found

func get_relationship(faction1: faction_list, faction2: faction_list) -> int:
	if faction1 in faction_relationships and faction2 in faction_relationships[faction1]:
		return faction_relationships[faction1][faction2]
	return 0  # Neutral by default


var faction_relationships = {
	faction_list.HUMAN: {
		faction_list.ELF: 50, faction_list.DWARF: 30, faction_list.HALFLING: 40, faction_list.GNOME: 20,
		faction_list.ORC: -50, faction_list.TIEFLING: -20, faction_list.DRAGONBORN: 10, faction_list.DROW: -30,
		faction_list.HALF_ELF: 40, faction_list.HALF_ORC: -10, faction_list.AASIMAR: 30, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: -10, faction_list.MERFOLK: 20, faction_list.TROLL: -50,
		faction_list.FAIRY: 20, faction_list.VAMPIRE: -60, faction_list.LYCAN: -40, faction_list.DEMON: -70,
		faction_list.ANGEL: 50, faction_list.BEAST: -10, faction_list.MINOTAUR: -20, faction_list.HARPY: -30,
		faction_list.CYCLOPS: -40, faction_list.GIANT: -30, faction_list.OGRE: -50, faction_list.KOBOLD: -60,
		faction_list.UNDEAD: -80, faction_list.CHIMERA: -50, faction_list.GOBLIN: -50, faction_list.DRAGON: -100
	},
	faction_list.ELF: {
		faction_list.HUMAN: 50, faction_list.DWARF: 20, faction_list.HALFLING: 40, faction_list.GNOME: 30,
		faction_list.ORC: -70, faction_list.TIEFLING: -30, faction_list.DRAGONBORN: 0, faction_list.DROW: -50,
		faction_list.HALF_ELF: 50, faction_list.HALF_ORC: -20, faction_list.AASIMAR: 40, faction_list.KENKU: 0,
		faction_list.TABAXI: 10, faction_list.LIZARDFOLK: -10, faction_list.MERFOLK: 30, faction_list.TROLL: -60,
		faction_list.FAIRY: 40, faction_list.VAMPIRE: -70, faction_list.LYCAN: -50, faction_list.DEMON: -80,
		faction_list.ANGEL: 50, faction_list.BEAST: 0, faction_list.MINOTAUR: -30, faction_list.HARPY: -40,
		faction_list.CYCLOPS: -50, faction_list.GIANT: -40, faction_list.OGRE: -60, faction_list.KOBOLD: -70,
		faction_list.UNDEAD: -90, faction_list.CHIMERA: -60, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
	faction_list.DWARF: {
		faction_list.HUMAN: 30, faction_list.ELF: 20, faction_list.HALFLING: 30, faction_list.GNOME: 30,
		faction_list.ORC: -60, faction_list.TIEFLING: -20, faction_list.DRAGONBORN: 20, faction_list.DROW: -40,
		faction_list.HALF_ELF: 20, faction_list.HALF_ORC: -30, faction_list.AASIMAR: 20, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: -20, faction_list.MERFOLK: 10, faction_list.TROLL: -70,
		faction_list.FAIRY: 20, faction_list.VAMPIRE: -80, faction_list.LYCAN: -60, faction_list.DEMON: -80,
		faction_list.ANGEL: 40, faction_list.BEAST: -10, faction_list.MINOTAUR: -20, faction_list.HARPY: -30,
		faction_list.CYCLOPS: -40, faction_list.GIANT: -50, faction_list.OGRE: -70, faction_list.KOBOLD: -80,
		faction_list.UNDEAD: -90, faction_list.CHIMERA: -60, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
	faction_list.HALFLING: {
		faction_list.HUMAN: 40, faction_list.ELF: 40, faction_list.DWARF: 30, faction_list.GNOME: 40,
		faction_list.ORC: -40, faction_list.TIEFLING: -10, faction_list.DRAGONBORN: 10, faction_list.DROW: -30,
		faction_list.HALF_ELF: 30, faction_list.HALF_ORC: -20, faction_list.AASIMAR: 30, faction_list.KENKU: 0,
		faction_list.TABAXI: 10, faction_list.LIZARDFOLK: -20, faction_list.MERFOLK: 20, faction_list.TROLL: -60,
		faction_list.FAIRY: 30, faction_list.VAMPIRE: -50, faction_list.LYCAN: -40, faction_list.DEMON: -60,
		faction_list.ANGEL: 40, faction_list.BEAST: 0, faction_list.MINOTAUR: -10, faction_list.HARPY: -20,
		faction_list.CYCLOPS: -30, faction_list.GIANT: -40, faction_list.OGRE: -60, faction_list.KOBOLD: -70,
		faction_list.UNDEAD: -80, faction_list.CHIMERA: -50, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
	faction_list.GNOME: {
		faction_list.HUMAN: 20, faction_list.ELF: 30, faction_list.DWARF: 30, faction_list.HALFLING: 40,
		faction_list.ORC: -30, faction_list.TIEFLING: -10, faction_list.DRAGONBORN: 0, faction_list.DROW: -20,
		faction_list.HALF_ELF: 20, faction_list.HALF_ORC: -10, faction_list.AASIMAR: 20, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: -10, faction_list.MERFOLK: 10, faction_list.TROLL: -50,
		faction_list.FAIRY: 30, faction_list.VAMPIRE: -40, faction_list.LYCAN: -30, faction_list.DEMON: -50,
		faction_list.ANGEL: 30, faction_list.BEAST: 0, faction_list.MINOTAUR: -10, faction_list.HARPY: -20,
		faction_list.CYCLOPS: -30, faction_list.GIANT: -40, faction_list.OGRE: -50, faction_list.KOBOLD: -60,
		faction_list.UNDEAD: -70, faction_list.CHIMERA: -40, faction_list.GOBLIN: -50, faction_list.DRAGON: -100
	},
	faction_list.ORC: {
		faction_list.HUMAN: -50, faction_list.ELF: -70, faction_list.DWARF: -60, faction_list.HALFLING: -40,
		faction_list.GNOME: -30, faction_list.TIEFLING: 20, faction_list.DRAGONBORN: 30, faction_list.DROW: 20,
		faction_list.HALF_ELF: -20, faction_list.HALF_ORC: 50, faction_list.AASIMAR: -30, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -10, faction_list.TROLL: 50,
		faction_list.FAIRY: -30, faction_list.VAMPIRE: 40, faction_list.LYCAN: 30, faction_list.DEMON: 60,
		faction_list.ANGEL: -60, faction_list.BEAST: 0, faction_list.MINOTAUR: 10, faction_list.HARPY: 20,
		faction_list.CYCLOPS: 30, faction_list.GIANT: 40, faction_list.OGRE: 50, faction_list.KOBOLD: 20,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 30, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.TIEFLING: {
		faction_list.HUMAN: -20, faction_list.ELF: -30, faction_list.DWARF: -20, faction_list.HALFLING: -10,
		faction_list.GNOME: -10, faction_list.ORC: 20, faction_list.DRAGONBORN: 10, faction_list.DROW: 30,
		faction_list.HALF_ELF: 0, faction_list.HALF_ORC: 20, faction_list.AASIMAR: -40, faction_list.KENKU: 0,
		faction_list.TABAXI: 10, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -10, faction_list.TROLL: 40,
		faction_list.FAIRY: -30, faction_list.VAMPIRE: 50, faction_list.LYCAN: 40, faction_list.DEMON: 70,
		faction_list.ANGEL: -70, faction_list.BEAST: 0, faction_list.MINOTAUR: 20, faction_list.HARPY: 30,
		faction_list.CYCLOPS: 40, faction_list.GIANT: 30, faction_list.OGRE: 40, faction_list.KOBOLD: 30,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 40, faction_list.GOBLIN: -50, faction_list.DRAGON: -100
	},
	faction_list.DRAGONBORN: {
		faction_list.HUMAN: 10, faction_list.ELF: 0, faction_list.DWARF: 20, faction_list.HALFLING: 10,
		faction_list.GNOME: 0, faction_list.ORC: 30, faction_list.TIEFLING: 10, faction_list.DROW: -20,
		faction_list.HALF_ELF: 10, faction_list.HALF_ORC: 20, faction_list.AASIMAR: 0, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 0, faction_list.TROLL: 30,
		faction_list.FAIRY: 0, faction_list.VAMPIRE: 20, faction_list.LYCAN: 10, faction_list.DEMON: 50,
		faction_list.ANGEL: 0, faction_list.BEAST: 0, faction_list.MINOTAUR: 10, faction_list.HARPY: 20,
		faction_list.CYCLOPS: 30, faction_list.GIANT: 20, faction_list.OGRE: 30, faction_list.KOBOLD: 10,
		faction_list.UNDEAD: 40, faction_list.CHIMERA: 20, faction_list.GOBLIN: 0, faction_list.DRAGON: 100
	},
	faction_list.DROW: {
		faction_list.HUMAN: -30, faction_list.ELF: -50, faction_list.DWARF: -40, faction_list.HALFLING: -30,
		faction_list.GNOME: -20, faction_list.ORC: 20, faction_list.TIEFLING: 30, faction_list.DRAGONBORN: -20,
		faction_list.HALF_ELF: -20, faction_list.HALF_ORC: 30, faction_list.AASIMAR: -50, faction_list.KENKU: 0,
		faction_list.TABAXI: 10, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -10, faction_list.TROLL: 40,
		faction_list.FAIRY: -30, faction_list.VAMPIRE: 50, faction_list.LYCAN: 40, faction_list.DEMON: 70,
		faction_list.ANGEL: -70, faction_list.BEAST: 0, faction_list.MINOTAUR: 20, faction_list.HARPY: 30,
		faction_list.CYCLOPS: 40, faction_list.GIANT: 30, faction_list.OGRE: 40, faction_list.KOBOLD: 30,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 40, faction_list.GOBLIN: -50, faction_list.DRAGON: -100
	},
	faction_list.HALF_ELF: {
		faction_list.HUMAN: 40, faction_list.ELF: 50, faction_list.DWARF: 20, faction_list.HALFLING: 30,
		faction_list.GNOME: 20, faction_list.ORC: -20, faction_list.TIEFLING: 0, faction_list.DRAGONBORN: 10,
		faction_list.DROW: -20, faction_list.HALF_ORC: 10, faction_list.AASIMAR: 30, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: -10, faction_list.MERFOLK: 20, faction_list.TROLL: -50,
		faction_list.FAIRY: 20, faction_list.VAMPIRE: -40, faction_list.LYCAN: -30, faction_list.DEMON: -60,
		faction_list.ANGEL: 40, faction_list.BEAST: 0, faction_list.MINOTAUR: -10, faction_list.HARPY: -20,
		faction_list.CYCLOPS: -30, faction_list.GIANT: -40, faction_list.OGRE: -50, faction_list.KOBOLD: -60,
		faction_list.UNDEAD: -70, faction_list.CHIMERA: -50, faction_list.GOBLIN: -50, faction_list.DRAGON: -100
	},
	faction_list.HALF_ORC: {
		faction_list.HUMAN: -10, faction_list.ELF: -20, faction_list.DWARF: -30, faction_list.HALFLING: -20,
		faction_list.GNOME: -10, faction_list.ORC: 50, faction_list.TIEFLING: 20, faction_list.DRAGONBORN: 20,
		faction_list.DROW: 30, faction_list.HALF_ELF: 10, faction_list.AASIMAR: -30, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -10, faction_list.TROLL: 40,
		faction_list.FAIRY: -20, faction_list.VAMPIRE: 40, faction_list.LYCAN: 30, faction_list.DEMON: 60,
		faction_list.ANGEL: -60, faction_list.BEAST: 0, faction_list.MINOTAUR: 20, faction_list.HARPY: 30,
		faction_list.CYCLOPS: 40, faction_list.GIANT: 30, faction_list.OGRE: 40, faction_list.KOBOLD: 30,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 40, faction_list.GOBLIN: -20, faction_list.DRAGON: -100
	},
	faction_list.AASIMAR: {
		faction_list.HUMAN: 30, faction_list.ELF: 40, faction_list.DWARF: 20, faction_list.HALFLING: 30,
		faction_list.GNOME: 20, faction_list.ORC: -30, faction_list.TIEFLING: -40, faction_list.DRAGONBORN: 0,
		faction_list.DROW: -50, faction_list.HALF_ELF: 30, faction_list.HALF_ORC: -30, faction_list.KENKU: 0,
		faction_list.TABAXI: 0, faction_list.LIZARDFOLK: -10, faction_list.MERFOLK: 20, faction_list.TROLL: -50,
		faction_list.FAIRY: 40, faction_list.VAMPIRE: -60, faction_list.LYCAN: -40, faction_list.DEMON: -70,
		faction_list.ANGEL: 50, faction_list.BEAST: 0, faction_list.MINOTAUR: -20, faction_list.HARPY: -30,
		faction_list.CYCLOPS: -40, faction_list.GIANT: -50, faction_list.OGRE: -60, faction_list.KOBOLD: -70,
		faction_list.UNDEAD: -80, faction_list.CHIMERA: -60, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
		faction_list.KENKU: {
		faction_list.HUMAN: -10, faction_list.ELF: -10, faction_list.DWARF: -20, faction_list.HALFLING: -10,
		faction_list.GNOME: -10, faction_list.ORC: 0, faction_list.TIEFLING: 10, faction_list.DRAGONBORN: 0,
		faction_list.DROW: 10, faction_list.HALF_ELF: -10, faction_list.HALF_ORC: 0, faction_list.AASIMAR: -20,
		faction_list.TABAXI: 10, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 0, faction_list.TROLL: -30,
		faction_list.FAIRY: 0, faction_list.VAMPIRE: -30, faction_list.LYCAN: -20, faction_list.DEMON: -40,
		faction_list.ANGEL: -20, faction_list.BEAST: 0, faction_list.MINOTAUR: 0, faction_list.HARPY: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: -30, faction_list.CHIMERA: 0, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.TABAXI: {
		faction_list.HUMAN: 0, faction_list.ELF: 10, faction_list.DWARF: 0, faction_list.HALFLING: 10,
		faction_list.GNOME: 0, faction_list.ORC: 0, faction_list.TIEFLING: 10, faction_list.DRAGONBORN: 0,
		faction_list.DROW: 10, faction_list.HALF_ELF: 0, faction_list.HALF_ORC: 0, faction_list.AASIMAR: 0,
		faction_list.KENKU: 10, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 10, faction_list.TROLL: 0,
		faction_list.FAIRY: 10, faction_list.VAMPIRE: 0, faction_list.LYCAN: 0, faction_list.DEMON: 0,
		faction_list.ANGEL: 0, faction_list.BEAST: 0, faction_list.MINOTAUR: 0, faction_list.HARPY: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 0, faction_list.CHIMERA: 0, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.LIZARDFOLK: {
		faction_list.HUMAN: -10, faction_list.ELF: -10, faction_list.DWARF: -20, faction_list.HALFLING: -20,
		faction_list.GNOME: -10, faction_list.ORC: 0, faction_list.TIEFLING: 0, faction_list.DRAGONBORN: 0,
		faction_list.DROW: 0, faction_list.HALF_ELF: -10, faction_list.HALF_ORC: 0, faction_list.AASIMAR: -10,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.MERFOLK: 0, faction_list.TROLL: 0,
		faction_list.FAIRY: 0, faction_list.VAMPIRE: 0, faction_list.LYCAN: 0, faction_list.DEMON: 0,
		faction_list.ANGEL: 0, faction_list.BEAST: 0, faction_list.MINOTAUR: 0, faction_list.HARPY: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 0, faction_list.CHIMERA: 0, faction_list.GOBLIN: 0, faction_list.DRAGON: 50
	},
	faction_list.MERFOLK: {
		faction_list.HUMAN: 20, faction_list.ELF: 30, faction_list.DWARF: 10, faction_list.HALFLING: 20,
		faction_list.GNOME: 10, faction_list.ORC: -10, faction_list.TIEFLING: -10, faction_list.DRAGONBORN: 0,
		faction_list.DROW: -10, faction_list.HALF_ELF: 20, faction_list.HALF_ORC: -10, faction_list.AASIMAR: 20,
		faction_list.KENKU: 0, faction_list.TABAXI: 10, faction_list.LIZARDFOLK: 0, faction_list.TROLL: -30,
		faction_list.FAIRY: 10, faction_list.VAMPIRE: -40, faction_list.LYCAN: -20, faction_list.DEMON: -50,
		faction_list.ANGEL: 30, faction_list.BEAST: 0, faction_list.MINOTAUR: -10, faction_list.HARPY: -20,
		faction_list.CYCLOPS: -30, faction_list.GIANT: -20, faction_list.OGRE: -30, faction_list.KOBOLD: -40,
		faction_list.UNDEAD: -60, faction_list.CHIMERA: -40, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.TROLL: {
		faction_list.HUMAN: -50, faction_list.ELF: -60, faction_list.DWARF: -70, faction_list.HALFLING: -60,
		faction_list.GNOME: -50, faction_list.ORC: 50, faction_list.TIEFLING: 40, faction_list.DRAGONBORN: 30,
		faction_list.DROW: 40, faction_list.HALF_ELF: -50, faction_list.HALF_ORC: 40, faction_list.AASIMAR: -50,
		faction_list.KENKU: -30, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -30,
		faction_list.FAIRY: -50, faction_list.VAMPIRE: 30, faction_list.LYCAN: 20, faction_list.DEMON: 50,
		faction_list.ANGEL: -60, faction_list.BEAST: 10, faction_list.MINOTAUR: 20, faction_list.HARPY: 10,
		faction_list.CYCLOPS: 20, faction_list.GIANT: 10, faction_list.OGRE: 30, faction_list.KOBOLD: 10,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 30, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.FAIRY: {
		faction_list.HUMAN: 20, faction_list.ELF: 40, faction_list.DWARF: 20, faction_list.HALFLING: 30,
		faction_list.GNOME: 30, faction_list.ORC: -30, faction_list.TIEFLING: -30, faction_list.DRAGONBORN: 0,
		faction_list.DROW: -30, faction_list.HALF_ELF: 20, faction_list.HALF_ORC: -20, faction_list.AASIMAR: 40,
		faction_list.KENKU: 0, faction_list.TABAXI: 10, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 10,
		faction_list.VAMPIRE: -50, faction_list.LYCAN: -40, faction_list.DEMON: -60, faction_list.ANGEL: 50,
		faction_list.BEAST: 0, faction_list.MINOTAUR: -20, faction_list.HARPY: -30, faction_list.CYCLOPS: -40,
		faction_list.GIANT: -50, faction_list.OGRE: -60, faction_list.KOBOLD: -70, faction_list.UNDEAD: -80,
		faction_list.CHIMERA: -60, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
	faction_list.VAMPIRE: {
		faction_list.HUMAN: -60, faction_list.ELF: -70, faction_list.DWARF: -80, faction_list.HALFLING: -50,
		faction_list.GNOME: -40, faction_list.ORC: 40, faction_list.TIEFLING: 50, faction_list.DRAGONBORN: 20,
		faction_list.DROW: 50, faction_list.HALF_ELF: -40, faction_list.HALF_ORC: 40, faction_list.AASIMAR: -60,
		faction_list.KENKU: -30, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -40,
		faction_list.TROLL: 30, faction_list.FAIRY: -50, faction_list.LYCAN: 50, faction_list.DEMON: 70,
		faction_list.ANGEL: -80, faction_list.BEAST: 10, faction_list.MINOTAUR: 20, faction_list.HARPY: 10,
		faction_list.CYCLOPS: 20, faction_list.GIANT: 10, faction_list.OGRE: 30, faction_list.KOBOLD: 10,
		faction_list.UNDEAD: 50, faction_list.CHIMERA: 30, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.LYCAN: {
		faction_list.HUMAN: -40, faction_list.ELF: -50, faction_list.DWARF: -60, faction_list.HALFLING: -40,
		faction_list.GNOME: -30, faction_list.ORC: 30, faction_list.TIEFLING: 40, faction_list.DRAGONBORN: 10,
		faction_list.DROW: 40, faction_list.HALF_ELF: -30, faction_list.HALF_ORC: 30, faction_list.AASIMAR: -40,
		faction_list.KENKU: -20, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -20,
		faction_list.TROLL: 20, faction_list.FAIRY: -40, faction_list.VAMPIRE: 50, faction_list.DEMON: 60,
		faction_list.ANGEL: -70, faction_list.BEAST: 10, faction_list.MINOTAUR: 20, faction_list.HARPY: 10,
		faction_list.CYCLOPS: 20, faction_list.GIANT: 10, faction_list.OGRE: 30, faction_list.KOBOLD: 10,
		faction_list.UNDEAD: 40, faction_list.CHIMERA: 30, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.DEMON: {
		faction_list.HUMAN: -70, faction_list.ELF: -80, faction_list.DWARF: -80, faction_list.HALFLING: -60,
		faction_list.GNOME: -50, faction_list.ORC: 60, faction_list.TIEFLING: 70, faction_list.DRAGONBORN: 50,
		faction_list.DROW: 70, faction_list.HALF_ELF: -60, faction_list.HALF_ORC: 60, faction_list.AASIMAR: -70,
		faction_list.KENKU: -40, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -50,
		faction_list.TROLL: 50, faction_list.FAIRY: -60, faction_list.VAMPIRE: 70, faction_list.LYCAN: 60,
		faction_list.ANGEL: -90, faction_list.BEAST: 20, faction_list.MINOTAUR: 30, faction_list.HARPY: 20,
		faction_list.CYCLOPS: 30, faction_list.GIANT: 20, faction_list.OGRE: 40, faction_list.KOBOLD: 20,
		faction_list.UNDEAD: 60, faction_list.CHIMERA: 40, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.ANGEL: {
		faction_list.HUMAN: 50, faction_list.ELF: 50, faction_list.DWARF: 40, faction_list.HALFLING: 40,
		faction_list.GNOME: 30, faction_list.ORC: -60, faction_list.TIEFLING: -70, faction_list.DRAGONBORN: 0,
		faction_list.DROW: -70, faction_list.HALF_ELF: 40, faction_list.HALF_ORC: -60, faction_list.AASIMAR: 50,
		faction_list.KENKU: -20, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 30,
		faction_list.TROLL: -60, faction_list.FAIRY: 50, faction_list.VAMPIRE: -80, faction_list.LYCAN: -70,
		faction_list.DEMON: -90, faction_list.BEAST: 0, faction_list.MINOTAUR: -20, faction_list.HARPY: -30,
		faction_list.CYCLOPS: -40, faction_list.GIANT: -50, faction_list.OGRE: -60, faction_list.KOBOLD: -70,
		faction_list.UNDEAD: -80, faction_list.CHIMERA: -60, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.BEAST: {
		faction_list.HUMAN: -10, faction_list.ELF: 0, faction_list.DWARF: -10, faction_list.HALFLING: 0,
		faction_list.GNOME: 0, faction_list.ORC: 0, faction_list.TIEFLING: 0, faction_list.DRAGONBORN: 0,
		faction_list.DROW: 0, faction_list.HALF_ELF: 0, faction_list.HALF_ORC: 0, faction_list.AASIMAR: 0,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 0,
		faction_list.TROLL: 10, faction_list.FAIRY: 0, faction_list.VAMPIRE: 10, faction_list.LYCAN: 10,
		faction_list.DEMON: 20, faction_list.ANGEL: 0, faction_list.MINOTAUR: 0, faction_list.HARPY: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 10, faction_list.CHIMERA: 0, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.MINOTAUR: {
		faction_list.HUMAN: -20, faction_list.ELF: -30, faction_list.DWARF: -20, faction_list.HALFLING: -10,
		faction_list.GNOME: -10, faction_list.ORC: 10, faction_list.TIEFLING: 20, faction_list.DRAGONBORN: 10,
		faction_list.DROW: 20, faction_list.HALF_ELF: -10, faction_list.HALF_ORC: 20, faction_list.AASIMAR: -20,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -10,
		faction_list.TROLL: 20, faction_list.FAIRY: -20, faction_list.VAMPIRE: 20, faction_list.LYCAN: 20,
		faction_list.DEMON: 30, faction_list.ANGEL: -20, faction_list.BEAST: 0, faction_list.HARPY: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 20, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 20, faction_list.CHIMERA: 20, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.HARPY: {
		faction_list.HUMAN: -30, faction_list.ELF: -40, faction_list.DWARF: -30, faction_list.HALFLING: -20,
		faction_list.GNOME: -20, faction_list.ORC: 20, faction_list.TIEFLING: 30, faction_list.DRAGONBORN: 20,
		faction_list.DROW: 30, faction_list.HALF_ELF: -20, faction_list.HALF_ORC: 30, faction_list.AASIMAR: -30,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -20,
		faction_list.TROLL: 10, faction_list.FAIRY: -30, faction_list.VAMPIRE: 10, faction_list.LYCAN: 10,
		faction_list.DEMON: 20, faction_list.ANGEL: -30, faction_list.BEAST: 0, faction_list.MINOTAUR: 0,
		faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 10, faction_list.CHIMERA: 0, faction_list.GOBLIN: 0, faction_list.DRAGON: -100
	},
	faction_list.CYCLOPS: {
		faction_list.HUMAN: -40, faction_list.ELF: -50, faction_list.DWARF: -40, faction_list.HALFLING: -30,
		faction_list.GNOME: -30, faction_list.ORC: 30, faction_list.TIEFLING: 40, faction_list.DRAGONBORN: 30,
		faction_list.DROW: 40, faction_list.HALF_ELF: -30, faction_list.HALF_ORC: 40, faction_list.AASIMAR: -40,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -30,
		faction_list.TROLL: 20, faction_list.FAIRY: -40, faction_list.VAMPIRE: 20, faction_list.LYCAN: 20,
		faction_list.DEMON: 30, faction_list.ANGEL: -40, faction_list.BEAST: 0, faction_list.MINOTAUR: 0,
		faction_list.HARPY: 0, faction_list.GIANT: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 20, faction_list.CHIMERA: 0, faction_list.GOBLIN: 50, faction_list.DRAGON: -100
	},
	faction_list.GIANT: {
		faction_list.HUMAN: -30, faction_list.ELF: -40, faction_list.DWARF: -50, faction_list.HALFLING: -40,
		faction_list.GNOME: -30, faction_list.ORC: 40, faction_list.TIEFLING: 30, faction_list.DRAGONBORN: 20,
		faction_list.DROW: 30, faction_list.HALF_ELF: -40, faction_list.HALF_ORC: 30, faction_list.AASIMAR: -50,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -20,
		faction_list.TROLL: 10, faction_list.FAIRY: -50, faction_list.VAMPIRE: 10, faction_list.LYCAN: 10,
		faction_list.DEMON: 20, faction_list.ANGEL: -50, faction_list.BEAST: 0, faction_list.MINOTAUR: 0,
		faction_list.HARPY: 0, faction_list.CYCLOPS: 0, faction_list.OGRE: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 10, faction_list.CHIMERA: 0, faction_list.GOBLIN: 20, faction_list.DRAGON: -100
	},
	faction_list.OGRE: {
		faction_list.HUMAN: -50, faction_list.ELF: -60, faction_list.DWARF: -70, faction_list.HALFLING: -60,
		faction_list.GNOME: -50, faction_list.ORC: 50, faction_list.TIEFLING: 40, faction_list.DRAGONBORN: 30,
		faction_list.DROW: 40, faction_list.HALF_ELF: -50, faction_list.HALF_ORC: 40, faction_list.AASIMAR: -50,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -30,
		faction_list.TROLL: 30, faction_list.FAIRY: -60, faction_list.VAMPIRE: 30, faction_list.LYCAN: 30,
		faction_list.DEMON: 40, faction_list.ANGEL: -60, faction_list.BEAST: 0, faction_list.MINOTAUR: 20,
		faction_list.HARPY: 0, faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.KOBOLD: 0,
		faction_list.UNDEAD: 30, faction_list.CHIMERA: 20, faction_list.GOBLIN: 100, faction_list.DRAGON: -100
	},
	faction_list.KOBOLD: {
		faction_list.HUMAN: -60, faction_list.ELF: -70, faction_list.DWARF: -80, faction_list.HALFLING: -70,
		faction_list.GNOME: -60, faction_list.ORC: 20, faction_list.TIEFLING: 30, faction_list.DRAGONBORN: 10,
		faction_list.DROW: 30, faction_list.HALF_ELF: -60, faction_list.HALF_ORC: 20, faction_list.AASIMAR: -70,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -40,
		faction_list.TROLL: 10, faction_list.FAIRY: -70, faction_list.VAMPIRE: 10, faction_list.LYCAN: 10,
		faction_list.DEMON: 20, faction_list.ANGEL: -70, faction_list.BEAST: 0, faction_list.MINOTAUR: 0,
		faction_list.HARPY: 0, faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0,
		faction_list.UNDEAD: 10, faction_list.CHIMERA: 0, faction_list.GOBLIN: 70, faction_list.DRAGON: 100
	},
	faction_list.UNDEAD: {
		faction_list.HUMAN: -80, faction_list.ELF: -90, faction_list.DWARF: -90, faction_list.HALFLING: -80,
		faction_list.GNOME: -70, faction_list.ORC: 50, faction_list.TIEFLING: 50, faction_list.DRAGONBORN: 40,
		faction_list.DROW: 50, faction_list.HALF_ELF: -70, faction_list.HALF_ORC: 50, faction_list.AASIMAR: -80,
		faction_list.KENKU: -30, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -60,
		faction_list.TROLL: 50, faction_list.FAIRY: -80, faction_list.VAMPIRE: 50, faction_list.LYCAN: 40,
		faction_list.DEMON: 60, faction_list.ANGEL: -80, faction_list.BEAST: 10, faction_list.MINOTAUR: 20,
		faction_list.HARPY: 10, faction_list.CYCLOPS: 20, faction_list.GIANT: 10, faction_list.OGRE: 30,
		faction_list.KOBOLD: 10, faction_list.CHIMERA: 20, faction_list.GOBLIN: -100, faction_list.DRAGON: -100
	},
	faction_list.CHIMERA: {
		faction_list.HUMAN: -50, faction_list.ELF: -60, faction_list.DWARF: -60, faction_list.HALFLING: -50,
		faction_list.GNOME: -40, faction_list.ORC: 30, faction_list.TIEFLING: 40, faction_list.DRAGONBORN: 20,
		faction_list.DROW: 40, faction_list.HALF_ELF: -50, faction_list.HALF_ORC: 30, faction_list.AASIMAR: -60,
		faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: -40,
		faction_list.TROLL: 30, faction_list.FAIRY: -60, faction_list.VAMPIRE: 30, faction_list.LYCAN: 30,
		faction_list.DEMON: 40, faction_list.ANGEL: -60, faction_list.BEAST: 0, faction_list.MINOTAUR: 20,
		faction_list.HARPY: 0, faction_list.CYCLOPS: 0, faction_list.GIANT: 0, faction_list.OGRE: 0,
		faction_list.KOBOLD: 0, faction_list.UNDEAD: 20, faction_list.GOBLIN: 0, faction_list.DRAGON: -50
	},
	faction_list.GOBLIN: {
	faction_list.HUMAN: -50, faction_list.ELF: -100, faction_list.DWARF: -100, faction_list.HALFLING: -100,
	faction_list.GNOME: -50, faction_list.ORC: 0, faction_list.TIEFLING: -50, faction_list.DRAGONBORN: 0,
	faction_list.DROW: -50, faction_list.HALF_ELF: -50, faction_list.HALF_ORC: -20, faction_list.AASIMAR: -100,
	faction_list.KENKU: 0, faction_list.TABAXI: 0, faction_list.LIZARDFOLK: 0, faction_list.MERFOLK: 0,
	faction_list.TROLL: 0, faction_list.FAIRY: -100, faction_list.VAMPIRE: 0, faction_list.LYCAN: 0,
	faction_list.DEMON: 0, faction_list.ANGEL: 0, faction_list.BEAST: 0, faction_list.MINOTAUR: 0,
	faction_list.HARPY: 0, faction_list.CYCLOPS: 50, faction_list.GIANT: 20, faction_list.OGRE: 100,
	faction_list.KOBOLD: 70, faction_list.UNDEAD: -100, faction_list.CHIMERA: 0, faction_list.DRAGON: -100
},
	faction_list.DRAGON: {
		faction_list.HUMAN: -100, faction_list.ELF: -100, faction_list.DWARF: -100, faction_list.HALFLING: -100,
		faction_list.GNOME: -100, faction_list.ORC: -100, faction_list.TIEFLING: -100, faction_list.DRAGONBORN: 100,
		faction_list.DROW: -100, faction_list.HALF_ELF: -100, faction_list.HALF_ORC: -100, faction_list.AASIMAR: -100,
		faction_list.KENKU: -100, faction_list.TABAXI: -100, faction_list.LIZARDFOLK: 50, faction_list.MERFOLK: -100,
		faction_list.TROLL: -100, faction_list.FAIRY: -100, faction_list.VAMPIRE: -100, faction_list.LYCAN: -100,
		faction_list.DEMON: -100, faction_list.ANGEL: -100, faction_list.GOBLIN: -100, faction_list.BEAST: -100, faction_list.MINOTAUR: -100,
		faction_list.HARPY: -100, faction_list.CYCLOPS: -100, faction_list.GIANT: -100, faction_list.OGRE: -100,
		faction_list.KOBOLD: 70,  faction_list.UNDEAD: -100, faction_list.CHIMERA: -50, faction_list.DRAGON: 0 
}

}

var race_descriptions = {
	faction_list.HUMAN: "Versatile and adaptable, capable in many areas.",
	faction_list.ELF: "Graceful and wise, skilled in magic and archery.",
	faction_list.DWARF: "Stout and strong, expert miners and warriors.",
	faction_list.HALFLING: "Small and nimble, known for their luck and stealth.",
	faction_list.GNOME: "Inventive and curious, masters of illusion and trickery.",
	faction_list.ORC: "Brutish and strong, fierce warriors with a primal nature.",
	faction_list.TIEFLING: "Charismatic and cunning, with a touch of infernal heritage.",
	faction_list.DRAGONBORN: "Draconic ancestry, powerful and honorable warriors.",
	faction_list.DROW: "Dark elves, stealthy and adept in dark magic.",
	faction_list.HALF_ELF: "Blend of human versatility and elven grace.",
	faction_list.HALF_ORC: "Strong and resilient, combining human and orcish traits.",
	faction_list.AASIMAR: "Celestial beings, radiant and noble.",
	faction_list.KENKU: "Flightless birdfolk, mimics and master thieves.",
	faction_list.TABAXI: "Cat-like agility, curious explorers and rogues.",
	faction_list.LIZARDFOLK: "Reptilian hunters, practical and survival-focused.",
	faction_list.MERFOLK: "Aquatic beings, enchanting and mysterious.",
	faction_list.UNDEAD: "Reanimated corpses, driven by dark magic.",
	faction_list.TROLL: "Regenerative giants, tough and formidable.",
	faction_list.FAIRY: "Tiny magical beings, playful and mischievous.",
	faction_list.DEMON: "Fiendish creatures, malevolent and powerful.",
	faction_list.ANGEL: "Celestial guardians, pure and righteous.",
	faction_list.GOBLIN: "Small and cunning, known for their trickery.",
	faction_list.VAMPIRE: "Undead aristocrats, seductive and dangerous.",
	faction_list.LYCAN: "Werebeasts, driven by primal instincts.",
	faction_list.CYCLOPS: "One-eyed giants, strong and solitary.",
	faction_list.GIANT: "Towering beings, incredibly strong and hardy.",
	faction_list.OGRE: "Large and brutish, formidable foes.",
	faction_list.HARPY: "Winged creatures, luring with their enchanting voices.",
	faction_list.MINOTAUR: "Bull-headed warriors, known for their labyrinths.",
	faction_list.KOBOLD: "Small reptilian scavengers, cunning and crafty.",
	faction_list.BEAST: "Wild creatures, embodying primal nature.",
	faction_list.CHIMERA: "Three-headed beasts, fearsome and deadly.",
	faction_list.DRAGON: "Mighty and ancient, masters of magic and combat."
}

# Function to return the description of a given race
func get_race_description(race: FactionManager.faction_list) -> String:
	return race_descriptions.get(race, "Unknown race")

func faction_to_string(faction: int) -> String:
	match faction:
		faction_list.HUMAN:
			return "Human"
		faction_list.ELF:
			return "Elf"
		faction_list.DWARF:
			return "Dwarf"
		faction_list.HALFLING:
			return "Halfling"
		faction_list.GNOME:
			return "Gnome"
		faction_list.ORC:
			return "Orc"
		faction_list.TIEFLING:
			return "Tiefling"
		faction_list.DRAGONBORN:
			return "Dragonborn"
		faction_list.DROW:
			return "Drow"
		faction_list.HALF_ELF:
			return "Half-Elf"
		faction_list.HALF_ORC:
			return "Half-Orc"
		faction_list.AASIMAR:
			return "Aasimar"
		faction_list.KENKU:
			return "Kenku"
		faction_list.TABAXI:
			return "Tabaxi"
		faction_list.LIZARDFOLK:
			return "Lizardfolk"
		faction_list.MERFOLK:
			return "Merfolk"
		faction_list.TROLL:
			return "Troll"
		faction_list.FAIRY:
			return "Fairy"
		faction_list.VAMPIRE:
			return "Vampire"
		faction_list.LYCAN:
			return "Lycan"
		faction_list.DEMON:
			return "Demon"
		faction_list.ANGEL:
			return "Angel"
		faction_list.BEAST:
			return "Beast"
		faction_list.MINOTAUR:
			return "Minotaur"
		faction_list.HARPY:
			return "Harpy"
		faction_list.CYCLOPS:
			return "Cyclops"
		faction_list.GIANT:
			return "Giant"
		faction_list.OGRE:
			return "Ogre"
		faction_list.KOBOLD:
			return "Kobold"
		faction_list.UNDEAD:
			return "Undead"
		faction_list.CHIMERA:
			return "Chimera"
		faction_list.GOBLIN:
			return "Goblin"
		faction_list.DRAGON:
			return "Dragon"
		_:
			return "Unknown"


const Rarity = {
	"COMMON": 0.85,
	"UNCOMMON": 0.10,
	"RARE": 0.05,
	"VERY_RARE": 0.01,
	"LEGENDARY": 0.005
}

const FACTION_WEIGHTS = {
	"human": {"name": "human", "rarity": Rarity.COMMON},
	"elf": {"name": "elf", "rarity": Rarity.UNCOMMON},
	"dwarf": {"name": "dwarf", "rarity": Rarity.UNCOMMON},
	"halfling": {"name": "halfling", "rarity": Rarity.RARE},
	"gnome": {"name": "gnome", "rarity": Rarity.RARE},
	"orc": {"name": "orc", "rarity": Rarity.UNCOMMON},
	"tiefling": {"name": "tiefling", "rarity": Rarity.RARE},
	"dragonborn": {"name": "dragonborn", "rarity": Rarity.RARE},
	"drow": {"name": "drow", "rarity": Rarity.RARE},
	"half_elf": {"name": "half_elf", "rarity": Rarity.RARE},
	"half_orc": {"name": "half_orc", "rarity": Rarity.RARE},
	"aasimar": {"name": "aasimar", "rarity": Rarity.RARE},
	"kenku": {"name": "kenku", "rarity": Rarity.VERY_RARE},
	"tabaxi": {"name": "tabaxi", "rarity": Rarity.VERY_RARE},
	"lizardfolk": {"name": "lizardfolk", "rarity": Rarity.VERY_RARE},
	"merfolk": {"name": "merfolk", "rarity": Rarity.VERY_RARE},
	"troll": {"name": "troll", "rarity": Rarity.LEGENDARY},
	"fairy": {"name": "fairy", "rarity": Rarity.LEGENDARY},
	"demon": {"name": "demon", "rarity": Rarity.LEGENDARY},
	"angel": {"name": "angel", "rarity": Rarity.LEGENDARY},
	"goblin": {"name": "goblin", "rarity": Rarity.LEGENDARY},
	"vampire": {"name": "vampire", "rarity": Rarity.LEGENDARY},
	"lycan": {"name": "lycan", "rarity": Rarity.LEGENDARY},
	"cyclops": {"name": "cyclops", "rarity": Rarity.LEGENDARY},
	"giant": {"name": "giant", "rarity": Rarity.LEGENDARY},
	"ogre": {"name": "ogre", "rarity": Rarity.LEGENDARY},
	"harpy": {"name": "harpy", "rarity": Rarity.LEGENDARY},
	"minotaur": {"name": "minotaur", "rarity": Rarity.LEGENDARY},
	"kobold": {"name": "kobold", "rarity": Rarity.LEGENDARY},
	"undead": {"name": "undead", "rarity": Rarity.LEGENDARY},
	"chimera": {"name": "chimera", "rarity": Rarity.LEGENDARY},
	"dragon": {"name": "dragon", "rarity": Rarity.LEGENDARY}
}

var faction_name_to_enum = {
	"human": faction_list.HUMAN,
	"elf": faction_list.ELF,
	"dwarf": faction_list.DWARF,
	"halfling": faction_list.HALFLING,
	"gnome": faction_list.GNOME,
	"orc": faction_list.ORC,
	"tiefling": faction_list.TIEFLING,
	"dragonborn": faction_list.DRAGONBORN,
	"drow": faction_list.DROW,
	"half_elf": faction_list.HALF_ELF,
	"half_orc": faction_list.HALF_ORC,
	"aasimar": faction_list.AASIMAR,
	"kenku": faction_list.KENKU,
	"tabaxi": faction_list.TABAXI,
	"lizardfolk": faction_list.LIZARDFOLK,
	"merfolk": faction_list.MERFOLK,
	"troll": faction_list.TROLL,
	"fairy": faction_list.FAIRY,
	"demon": faction_list.DEMON,
	"angel": faction_list.ANGEL,
	"goblin": faction_list.GOBLIN,
	"vampire": faction_list.VAMPIRE,
	"lycan": faction_list.LYCAN,
	"cyclops": faction_list.CYCLOPS,
	"giant": faction_list.GIANT,
	"ogre": faction_list.OGRE,
	"harpy": faction_list.HARPY,
	"minotaur": faction_list.MINOTAUR,
	"kobold": faction_list.KOBOLD,
	"undead": faction_list.UNDEAD,
	"chimera": faction_list.CHIMERA,
	"dragon": faction_list.DRAGON
}

func get_random_faction() -> faction_list:
	var key = WeightedChoice.pick(FACTION_WEIGHTS, "rarity")
	return faction_name_to_enum[key]
