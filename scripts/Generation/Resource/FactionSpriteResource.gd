extends Resource
class_name FactionSpriteResource

# Define the dictionary structure
@export var faction_sprites = {
	FactionManager.faction_list.HUMAN: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.ELF: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.DWARF: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.HALFLING: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.GNOME: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.ORC: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.TIEFLING: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.DRAGONBORN: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.DROW: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.HALF_ELF: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.HALF_ORC: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.AASIMAR: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.KENKU: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.TABAXI: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.LIZARDFOLK: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.MERFOLK: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.UNDEAD: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.TROLL: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.FAIRY: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.DEMON: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.ANGEL: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.GOBLIN: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.VAMPIRE: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.LYCAN: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.CYCLOPS: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.GIANT: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.OGRE: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.HARPY: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.MINOTAUR: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.KOBOLD: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.CHIMERA: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	},
	FactionManager.faction_list.DRAGON: {
		"front": Texture3D,
		"back": Texture3D,
		"left": Texture3D,
		"right": Texture3D
	}
}

@export var human_front: Texture3D
@export var human_back: Texture3D
@export var human_left: Texture3D
@export var human_right: Texture3D

@export var elf_front: Texture3D
@export var elf_back: Texture3D
@export var elf_left: Texture3D
@export var elf_right: Texture3D

@export var dwarf_front: Texture3D
@export var dwarf_back: Texture3D
@export var dwarf_left: Texture3D
@export var dwarf_right: Texture3D

@export var halfling_front: Texture3D
@export var halfling_back: Texture3D
@export var halfling_left: Texture3D
@export var halfling_right: Texture3D

@export var gnome_front: Texture3D
@export var gnome_back: Texture3D
@export var gnome_left: Texture3D
@export var gnome_right: Texture3D

@export var orc_front: Texture3D
@export var orc_back: Texture3D
@export var orc_left: Texture3D
@export var orc_right: Texture3D

@export var tiefling_front: Texture3D
@export var tiefling_back: Texture3D
@export var tiefling_left: Texture3D
@export var tiefling_right: Texture3D

@export var dragonborn_front: Texture3D
@export var dragonborn_back: Texture3D
@export var dragonborn_left: Texture3D
@export var dragonborn_right: Texture3D

@export var drow_front: Texture3D
@export var drow_back: Texture3D
@export var drow_left: Texture3D
@export var drow_right: Texture3D

@export var half_elf_front: Texture3D
@export var half_elf_back: Texture3D
@export var half_elf_left: Texture3D
@export var half_elf_right: Texture3D

@export var half_orc_front: Texture3D
@export var half_orc_back: Texture3D
@export var half_orc_left: Texture3D
@export var half_orc_right: Texture3D

@export var aasimar_front: Texture3D
@export var aasimar_back: Texture3D
@export var aasimar_left: Texture3D
@export var aasimar_right: Texture3D

@export var kenku_front: Texture3D
@export var kenku_back: Texture3D
@export var kenku_left: Texture3D
@export var kenku_right: Texture3D

@export var tabaxi_front: Texture3D
@export var tabaxi_back: Texture3D
@export var tabaxi_left: Texture3D
@export var tabaxi_right: Texture3D

@export var lizardfolk_front: Texture3D
@export var lizardfolk_back: Texture3D
@export var lizardfolk_left: Texture3D
@export var lizardfolk_right: Texture3D

@export var merfolk_front: Texture3D
@export var merfolk_back: Texture3D
@export var merfolk_left: Texture3D
@export var merfolk_right: Texture3D

@export var undead_front: Texture3D
@export var undead_back: Texture3D
@export var undead_left: Texture3D
@export var undead_right: Texture3D

@export var troll_front: Texture3D
@export var troll_back: Texture3D
@export var troll_left: Texture3D
@export var troll_right: Texture3D

@export var fairy_front: Texture3D
@export var fairy_back: Texture3D
@export var fairy_left: Texture3D
@export var fairy_right: Texture3D

@export var demon_front: Texture3D
@export var demon_back: Texture3D
@export var demon_left: Texture3D
@export var demon_right: Texture3D

@export var angel_front: Texture3D
@export var angel_back: Texture3D
@export var angel_left: Texture3D
@export var angel_right: Texture3D

@export var goblin_front: Texture3D
@export var goblin_back: Texture3D
@export var goblin_left: Texture3D
@export var goblin_right: Texture3D

@export var vampire_front: Texture3D
@export var vampire_back: Texture3D
@export var vampire_left: Texture3D
@export var vampire_right: Texture3D

@export var lycan_front: Texture3D
@export var lycan_back: Texture3D
@export var lycan_left: Texture3D
@export var lycan_right: Texture3D

@export var cyclops_front: Texture3D
@export var cyclops_back: Texture3D
@export var cyclops_left: Texture3D
@export var cyclops_right: Texture3D

@export var giant_front: Texture3D
@export var giant_back: Texture3D
@export var giant_left: Texture3D
@export var giant_right: Texture3D

@export var ogre_front: Texture3D
@export var ogre_back: Texture3D
@export var ogre_left: Texture3D
@export var ogre_right: Texture3D

@export var harpy_front: Texture3D
@export var harpy_back: Texture3D
@export var harpy_left: Texture3D
@export var harpy_right: Texture3D

@export var minotaur_front: Texture3D
@export var minotaur_back: Texture3D
@export var minotaur_left: Texture3D
@export var minotaur_right: Texture3D

@export var kobold_front: Texture3D
@export var kobold_back: Texture3D
@export var kobold_left: Texture3D
@export var kobold_right: Texture3D

@export var chimera_front: Texture3D
@export var chimera_back: Texture3D
@export var chimera_left: Texture3D
@export var chimera_right: Texture3D

@export var dragon_front: Texture3D
@export var dragon_back: Texture3D
@export var dragon_left: Texture3D
@export var dragon_right: Texture3D
