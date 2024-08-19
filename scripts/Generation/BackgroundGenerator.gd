extends Node
class_name BackgroundGenerator

var faction_manager: FactionManager
var class_manager: ClassManager

var dungeon_name : String = ""

var random = RandomNumberGenerator.new()

var dungeon_name_prefixes = [
	"Blood", "Shadow", "Stone", "Iron", "Dark", "Fire", "Grim", "Frost", "Black", "Deep",
	"Bone", "Skull", "Ghost", "Silver", "Storm", "Thunder", "Ash", "Wind", "Night", "Hell",
	"Crystal", "Dragon", "Doom", "Death", "Cursed", "Blight", "War", "Raven", "Wolf", "Dread",
	"Ancient", "Mystic", "Gloom", "Infernal", "Searing", "Blazing", "Frozen", "Eternal", "Sacred", "Arcane",
	"Golden", "Emerald", "Ruby", "Sapphire", "Twilight", "Shadowy", "Forbidden", "Hallowed", "Forgotten", "Wicked",
	"Vengeful", "Savage", "Vicious", "Wild", "Divine", "Feral", "Phantom", "Malevolent", "Desolate", "Haunted",
	"Wrathful", "Terrifying", "Hellish", "Gruesome", "Macabre", "Morbid", "Ominous", "Sinister", "Malevolent", "Dire",
	"Perilous", "Deadly", "Treacherous", "Vile", "Ghastly", "Menacing", "Brutal", "Horrific", "Appalling", "Gory",
	"Unholy", "Petrifying", "Spine-chilling", "Bloodcurdling", "Creepy", "Eerie", "Terrifying", "Dreadful", "Alarming", "Horrifying",
	"Bloodthirsty", "Ferocious", "Ruthless", "Savage", "Merciless", "Relentless", "Barbarous", "Cruel", "Inhumane", "Fiendish",
	"Devilish", "Diabolical", "Infernal", "Demonic", "Beastly", "Inhuman", "Monstrous", "Abominable", "Grisly", "Grotesque"
]


var dungeon_name_suffixes = [
	"Cavern", "Abyss", "Crypt", "Dungeon", "Fortress", "Labyrinth", "Pit", "Sanctuary", "Vault", "Warren",
	"Maze", "Sepulcher", "Chasm", "Grotto", "Lair", "Nest", "Tomb", "Catacomb", "Stronghold", "Citadel",
	"Keep", "Castle", "Sanctum", "Chamber", "Prison", "Hold", "Den", "Retreat", "Hideout", "Refuge",
	"Sanctuary", "Domain", "Realm", "Expanse", "Enclave", "Barracks", "Outpost", "Camp", "Encampment", "Settlement",
	"Shelter", "Haven", "Asylum", "Hovel", "Bastion", "Bulwark", "Fortification", "Citadel", "Barricade", "Bunker",
	"Redoubt", "Stockade", "Stronghold", "Fastness", "Fort", "Castle", "Tower", "Palace", "Manor", "Residence",
	"Estate", "Dwelling", "Abode", "Homestead", "Lodge", "Cottage", "House", "Quarters", "Parsonage", "Villa",
	"Household", "Residence", "Lair", "Retreat", "Hideaway", "Getaway", "Sanctum", "Chamber", "Room", "Compartment",
	"Hovel", "Shelter", "Domicile", "Homestead", "Rookery", "Hideout", "Den", "Cavern", "Hollow", "Alcove",
	"Warren", "Sanctuary", "Haven", "Refuge", "Retreat", "Haunt", "Recess", "Cache", "Nook", "Hermitage"
]


var visitors : Array[Dictionary] = []

var dungeon_background : String = ""


func _ready_dungeon_background():
	faction_manager = FactionManager.new()
	add_child(faction_manager)
	class_manager = ClassManager.new()
	add_child(class_manager)
	random.randomize()
	dungeon_background = generate_dungeon_background()
#	print(dungeon_name)
#	print(dungeon_background)
#	print(format_visitors(visitors))

func generate_dungeon_background() -> String:
	dungeon_name = generate_dungeon_name()
	generate_visitors()

	var dungeon_background = """Long ago, in a time forgotten by most, the dungeon was a place of great power and intrigue. \n
Hidden deep beneath the surface, it served as a fortress for many powerful beings. \n \n"""

	dungeon_background += generate_additional_history()

	dungeon_background += """\nOver time, the dungeon fell into ruin and was abandoned. \nNow, it stands as a dark and foreboding place, where few dare to tread."""
	
	return dungeon_background

var dungeon_pre_suffixes = [
	"Mystery", "Doom", "Shadow", "Fury", "Chaos", "Whispers", "Echoes", "Secrets", 
	"Despair", "Terror", "Nightmares", "Legends", "Horror", "Sorrow", "Wrath", 
	"Vengeance", "Storms", "Embers", "Ashes", "Ruins", "Specters", "Phantoms", 
	"Wraiths", "Torment", "Grief", "Gloom", "Oblivion", "Havoc", "Horror", 
	"Enigma", "Obscurity", "Twilight", "Midnight", "Dread", "Mystics", "Labyrinth",
	"Curses", "Dread", "Bones", "Fear", "Decay", "Eclipses", "Forsaken", "Forgotten",
	"Abyss", "Nether", "Inferno", "Hell", "Catacombs", "Ages", "Forgotten", "Despair",
	"Desolation", "Fate", "Fury", "Agony", "Pandemonium", "Shadows", "Mists", 
	"Veils", "Fables", "Hollows", "Tombs", "Crypts", "Annihilation", "Misery", 
	"Echoes", "Wonders", "Perils", "Maze", "Caverns", "Depths", "Labyrinth", 
	"Void", "Chaos", "Darkness", "Bleakness", "Dungeons", "Trials", "Tribulations"
]

func generate_dungeon_name() -> String:
	var prefix = dungeon_name_prefixes[random.randi_range(0, dungeon_name_prefixes.size() - 1)]
	var suffix = dungeon_name_suffixes[random.randi_range(0, dungeon_name_suffixes.size() - 1)]
	var dungeon_name = prefix + " " + suffix

	# Randomly add "The" at the beginning (25% chance)
	var add_the = random.randi_range(0, 3) == 0

	# Randomly add "of" and special pre_suffix (5% chance)
	if random.randi_range(0, 19) == 0:
		var pre_suffix = dungeon_pre_suffixes[random.randi_range(0, dungeon_pre_suffixes.size() - 1)]
		dungeon_name = prefix + " of " + pre_suffix + " " + suffix
	elif random.randi_range(0, 9) == 0:  # "of" with 10% chance
		dungeon_name = suffix + " of " + prefix

	# Append "The" after "of" if needed
	if add_the:
		if dungeon_name.begins_with("of"):
			dungeon_name = "of The " + dungeon_name.substr(3)
		else:
			dungeon_name = "The " + dungeon_name
	if randi_range(0, 99) <= 25:
		# Add BBCode to make the name a random color
		dungeon_name = BbCodeColor.random_colorize_text(dungeon_name)

	return dungeon_name

func generate_visitors():
	visitors.clear()
	for i in range(randi_range(1, 5)):
		visitors.append(generate_important_figure())

var adjectives = ["brave", "fearless", "cunning", "wise", "strong", "agile", "mighty", "skillful", "valiant", "ruthless", "merciful", "noble", "savage", "tenacious", "daring", "clever", "resourceful", "steadfast", "resolute", "formidable", "vigilant", "brilliant", "charismatic", "fierce", "intrepid", "bold", "relentless", "tactical", "strategic", "graceful", "heroic", "determined", "brutal", "fearsome", "loyal", "ingenious", "crafty", "meticulous", "perceptive", "quick-witted", "adventurous", "courageous", "inventive", "indomitable", "unwavering", "gallant", "stout-hearted", "audacious", "undaunted", "shrewd", "astute", "energetic", "spirited", "decisive", "magnanimous", "benevolent", "stoic", "disciplined", "devout", "pious", "farsighted", "kind-hearted", "virtuous", "steadfast", "impartial", "legendary", "mythic", "unyielding", "fearless", "enigmatic", "valorous", "enigmatic", "dauntless", "unbreakable", "unrelenting", "wily", "sagacious", "stalwart", "merciless", "pioneering", "arcane", "mystical", "fabled", "peerless", "revered", "chivalrous", "doughty", "heroic", "immovable", "lionhearted", "mercenary", "mythical", "pragmatic", "prodigious", "reputable", "serene", "steadfast", "tireless", "venerable", "virtuous", "wary", "willful", "zealous"]
var actions = ["defeated", "outsmarted", "befriended", "conquered", "led", "protected", "trained", "guided", "vanquished", "overcame", "challenged", "subdued", "triumphed over", "ambushed", "outwitted", "bested", "subjugated", "overpowered", "captured", "intimidated", "assisted", "saved", "rescued", "liberated", "defended", "harried", "repelled", "routed", "exterminated", "expelled", "evaded", "eluded", "neutralized", "negotiated with", "mediated", "brokered peace with", "collaborated with", "allied with", "dismantled", "decimated", "annihilated", "crushed", "demolished", "eradicated", "extinguished", "obliterated", "sabotaged", "foiled", "frustrated", "thwarted", "circumvented", "dodged", "escaped", "fled from", "retreated from", "reconnoitered", "spied on", "scouted", "surveyed", "tracked", "hunted", "pursued", "observed", "watched", "shadowed", "taunted", "provoked", "aggravated", "inflamed","overcame", "challenged", "subdued", "triumphed over", "ambushed", "outwitted", "bested", "subjugated", "overpowered", "captured", "intimidated", "assisted", "saved", "rescued", "liberated", "defended", "harried", "repelled", "routed", "exterminated", "expelled", "evaded", "eluded", "neutralized", "negotiated with", "mediated", "brokered peace with", "collaborated with", "allied with", "dismantled", "decimated", "annihilated", "crushed", "demolished", "eradicated", "extinguished", "obliterated", "sabotaged", "foiled", "frustrated", "thwarted", "circumvented", "dodged", "escaped", "fled from", "retreated from", "reconnoitered", "spied on", "scouted", "surveyed", "tracked", "hunted", "pursued", "observed", "watched", "shadowed", "taunted", "provoked", "aggravated", "inflamed", "vanquished", "suppressed", "quelled", "overcame", "braved", "challenged", "confronted", "surpassed", "exceeded", "mastered", "navigated", "triumphed over", "overthrew", "deposed", "reclaimed", "seized", "consolidated", "fortified", "solidified", "deflected", "averted", "diverted", "dispelled", "disarmed", "resolved", "addressed", "tackled", "disputed", "questioned", "debated", "persuaded", "coerced", "compelled", "engaged", "fought", "battled", "waged war on", "mounted an assault on", "encountered", "crossed paths with", "stood against", "clashed with", "locked horns with", "dueled", "exchanged blows with", "parried", "countered", "retaliated against","skirmished with", "outmaneuvered", "confounded", "stymied", "outflanked", "outpaced", "overtook", "overran", "infiltrated", "besieged", "bombarded", "raided", "pillaged", "plundered", "ransacked", "devastated", "ravaged", "scorched", "torched", "stormed", "overwhelmed", "trounced", "crushed", "smashed", "broke", "wrecked", "shattered", "wrecked", "scattered", "dispersed", "disbanded", "dismayed", "disheartened", "dispelled", "dissuaded", "deterred", "coaxed", "enticed", "lured", "beguiled", "seduced", "enraptured", "enchanted", "bewitched", "hypnotized", "mesmerized", "enthralled", "captivated", "ensnared", "enslaved", "imprisoned", "bound", "shackled", "chained", "locked up", "sequestered", "islanded", "marooned", "forsaken", "banished", "exiled", "cast out", "ostracized", "expelled", "banished", "condemned", "doomed", "cursed", "hexed", "jinxed", "bewitched", "damned", "reviled", "abhorred", "detested", "loathed", "despised", "scorned", "spurned", "repulsed", "repelled", "drove away", "chased off", "warded off", "fended off", "turned away", "pushed back", "repelled", "drove back", "resisted", "withstood", "held off", "fought off", "staved off"]
var traits = ["strength", "intelligence", "agility", "wisdom", "charisma", "dexterity", "endurance", "skill", "bravery", "honor", "integrity", "compassion", "fierceness", "determination", "resilience", "tenacity", "vitality", "valor", "courage", "fortitude", "ingenuity", "resourcefulness", "cleverness", "tactical acumen", "strategic insight", "perception", "insight", "willpower", "leadership", "command", "authority", "mystical power", "arcane knowledge", "spirituality", "piety", "faith", "sorcery", "alchemy", "martial prowess", "combat skills", "stealth", "subterfuge", "espionage", "influence", "persuasion", "deception", "trickery", "guile", "quickness", "swiftness", "mobility", "adaptability", "flexibility", "creativity", "inventiveness", "athleticism", "fitness", "coordination", "balance", "reflexes", "timing", "precision", "accuracy", "stamina", "resilience", "durability", "tenacity", "brilliance", "sagacity", "heroism", "virtue", "nobility", "finesse", "steadfastness", "mettle", "cunning", "vigilance", "zeal", "discipline", "decisiveness", "fortitude", "prowess", "gallantry", "loyalty", "magnanimity", "astuteness", "pragmatism", "shrewdness", "audacity", "fearlessness", "resolve", "perseverance", "spirit", "moxie", "chutzpah", "brilliance", "sagacity", "prudence", "diligence", "hardiness", "indomitability", "fearlessness", "farsightedness", "foresight", "vision", "focus", "concentration", "dedication", "vigor", "energy", "potency", "mastery", "expertise", "proficiency", "command", "reputation", "reliability", "trustworthiness", "ethics", "morality", "veracity", "truthfulness","initiative", "cunning", "vigilance", "zeal", "discipline", "decisiveness", "fortitude", "prowess", "gallantry", "loyalty", "magnanimity", "astuteness", "pragmatism", "shrewdness", "audacity", "fearlessness", "resolve", "perseverance", "spirit", "moxie", "chutzpah", "prudence", "diligence", "hardiness", "indomitability", "farsightedness", "foresight", "vision", "focus", "concentration", "dedication", "vigor", "energy", "potency", "mastery", "expertise", "proficiency", "reputation", "reliability", "trustworthiness", "ethics", "morality", "veracity", "truthfulness", "justice", "mercy", "altruism", "generosity", "humility", "modesty", "patience", "serenity", "tranquility", "calmness", "equanimity", "humor", "wit", "joviality", "cheerfulness", "optimism", "positivity", "hope", "determination", "bravery", "intensity", "competence", "heroism", "fortitude", "insightfulness", "observational skill", "keen senses", "sharp mind", "swift reflexes", "light-footedness", "daring", "plucky nature", "bold spirit", "invincibility", "peerless skill", "dauntless spirit", "undaunted courage", "endless energy", "untiring resolve", "boundless creativity", "indomitable will"]

var goals = [
	"find a hidden treasure", 
	"defeat a great evil", 
	"save a village", 
	"discover ancient knowledge", 
	"protect the kingdom", 
	"lead a rebellion", 
	"build an empire", 
	"seek vengeance", 
	"uncover a dark secret", 
	"restore their family's honor", 
	"defend their homeland", 
	"master the arcane arts", 
	"become the strongest warrior", 
	"forge a legendary weapon", 
	"unite the warring factions", 
	"break a powerful curse", 
	"recover a stolen artifact", 
	"avenge their fallen comrades", 
	"establish a new order", 
	"explore uncharted lands", 
	"challenge the gods", 
	"create a utopia", 
	"achieve immortality", 
	"rescue a captured ally", 
	"bring peace to the realm", 
	"destroy an ancient menace", 
	"unleash a hidden power", 
	"protect the natural world", 
	"spread their faith", 
	"prove their worth", 
	"conquer a neighboring kingdom", 
	"find a cure for a deadly plague", 
	"learn the secrets of the universe", 
	"defeat an ancient dragon", 
	"tame a mythical beast", 
	"reclaim a lost city", 
	"overthrow a tyrant", 
	"establish a trade route", 
	"defend the weak", 
	"mentor the next generation", 
	"revive a fallen hero", 
	"solve a legendary mystery", 
	"build an alliance", 
	"gain favor with the gods", 
	"end a long-standing feud", 
	"unveil a conspiracy", 
	"forge a magical relic", 
	"achieve ultimate enlightenment"
]

var story_fragments = [
	"The $ADJ $NAME once $ACTION their $FOES using their $TRAIT.",
	"In their quest to $GOAL, $NAME faced many challenges.",
	"Legends speak of the $ADJ $NAME who $ABILITY their foes.",
	"With their $TRAIT, $NAME $ACTION those who stood against them.",
	"$NAME was known for their $ADJ nature and their quest to $GOAL.",
	"Many tales are told of $NAME who $ACTION enemies using their $TRAIT.",
	"$NAME's $TRAIT was $ADJ, and they were able to $ABILITY with ease.",
	"Throughout the ages, $NAME's $TRAIT allowed them to $ACTION their $FOES.",
	"In pursuit of their goal to $GOAL, the $ADJ $NAME became a legend.",
	"$NAME, famed for their $TRAIT, set out to $GOAL and $ACTION many $FOES.",
	"Stories of $NAME who $ACTION with $TRAIT have been passed down through generations.",
	"Known for their $TRAIT, the $ADJ $NAME was destined to $GOAL.",
	"To $GOAL, $NAME had to $ACTION their $FOES using $TRAIT.",
	"The $ADJ $NAME, with their $TRAIT, was a key figure in the quest to $GOAL.",
	"With a goal to $GOAL, $NAME's $TRAIT was their greatest asset.",
	"$NAME, renowned for their $TRAIT, $ACTION all who opposed them.",
	"In the tales of old, the $ADJ $NAME's $TRAIT was instrumental in their quest to $GOAL.",
	"$NAME was known to $ACTION their $FOES through sheer $TRAIT.",
	"Many remember the $ADJ $NAME for their ability to $ABILITY.",
	"Throughout their journey to $GOAL, $NAME's $TRAIT was unmatched.",
	"$NAME was legendary for their $TRAIT and their ability to $ABILITY.",
	"Many feared the $ADJ $NAME because of their $TRAIT.",
	"$NAME was a master of $TRAIT, which they used to $ACTION their $FOES.",
	"In tales of old, $NAME's $ADJ $TRAIT made them a force to be reckoned with.",
	"The $ADJ $NAME traveled far and wide to $GOAL.",
	"Using their $TRAIT, $NAME $ACTION countless $FOES.",
	"$NAME's journey to $GOAL was filled with $ADJ feats of $TRAIT.",
	"$NAME was known to $ABILITY with great $TRAIT.",
	"Their $ADJ $TRAIT made $NAME a key player in the quest to $GOAL.",
	"With $TRAIT and $TRAIT, $NAME $ACTION their way to $GOAL.",
	"The $ADJ $NAME's $TRAIT allowed them to $ABILITY effortlessly.",
	"Through their $TRAIT, $NAME was able to $ACTION and $GOAL.",
	"Legends tell of $NAME who used their $TRAIT to $ACTION $FOES.",
	"The $ADJ $NAME's $TRAIT was the stuff of legend, helping them to $GOAL.",
	"In pursuit of $GOAL, $NAME's $ADJ $TRAIT shone brightly.",
	"With their $ADJ $TRAIT, $NAME $ACTION their $FOES and achieved $GOAL.",
	"$NAME's $TRAIT was instrumental in their quest to $GOAL.",
	"Stories of the $ADJ $NAME and their $TRAIT are told even today.",
	"Using their $TRAIT, $NAME $ACTION those who stood in their way to $GOAL.",
	"$NAME, with $ADJ $TRAIT, became a legend in the quest to $GOAL.",
	"The $ADJ $NAME once $ACTION their $FOES using their $TRAIT.",
"In their quest to $GOAL, $NAME faced many challenges.",
"Legends speak of the $ADJ $NAME who $ABILITY their foes.",
"With their $TRAIT, $NAME $ACTION those who stood against them.",
"$NAME was known for their $ADJ nature and their quest to $GOAL.",
"Many tales are told of $NAME who $ACTION enemies using their $TRAIT.",
"$NAME's $TRAIT was $ADJ, and they were able to $ABILITY with ease.",
"Throughout the ages, $NAME's $TRAIT allowed them to $ACTION their $FOES.",
"In pursuit of their goal to $GOAL, the $ADJ $NAME became a legend.",
"$NAME, famed for their $TRAIT, set out to $GOAL and $ACTION many $FOES.",
"Stories of $NAME who $ACTION with $TRAIT have been passed down through generations.",
"Known for their $TRAIT, the $ADJ $NAME was destined to $GOAL.",
"To $GOAL, $NAME had to $ACTION their $FOES using $TRAIT.",
"The $ADJ $NAME, with their $TRAIT, was a key figure in the quest to $GOAL.",
"With a goal to $GOAL, $NAME's $TRAIT was their greatest asset.",
"$NAME, renowned for their $TRAIT, $ACTION all who opposed them.",
"In the tales of old, the $ADJ $NAME's $TRAIT was instrumental in their quest to $GOAL.",
"$NAME was known to $ACTION their $FOES through sheer $TRAIT.",
"Many remember the $ADJ $NAME for their ability to $ABILITY.",
"Throughout their journey to $GOAL, $NAME's $TRAIT was unmatched.",
"$NAME was legendary for their $TRAIT and their ability to $ABILITY.",
"Many feared the $ADJ $NAME because of their $TRAIT.",
"$NAME was a master of $TRAIT, which they used to $ACTION their $FOES.",
"In tales of old, $NAME's $ADJ $TRAIT made them a force to be reckoned with.",
"The $ADJ $NAME traveled far and wide to $GOAL.",
"Using their $TRAIT, $NAME $ACTION countless $FOES.",
"$NAME's journey to $GOAL was filled with $ADJ feats of $TRAIT.",
"$NAME was known to $ABILITY with great $TRAIT.",
"Their $ADJ $TRAIT made $NAME a key player in the quest to $GOAL.",
"With $TRAIT and $TRAIT, $NAME $ACTION their way to $GOAL.",
"The $ADJ $NAME's $TRAIT allowed them to $ABILITY effortlessly.",
"Through their $TRAIT, $NAME was able to $ACTION and $GOAL.",
"Legends tell of $NAME who used their $TRAIT to $ACTION $FOES.",
"The $ADJ $NAME's $TRAIT was the stuff of legend, helping them to $GOAL.",
"In pursuit of $GOAL, $NAME's $ADJ $TRAIT shone brightly.",
"With their $ADJ $TRAIT, $NAME $ACTION their $FOES and achieved $GOAL.",
"$NAME's $TRAIT was instrumental in their quest to $GOAL.",
"Stories of the $ADJ $NAME and their $TRAIT are told even today.",
"Using their $TRAIT, $NAME $ACTION those who stood in their way to $GOAL.",
"$NAME, with $ADJ $TRAIT, became a legend in the quest to $GOAL.",
"The $ADJ $NAME $ACTION their $FOES in the pursuit of $GOAL.",
"With unwavering $TRAIT, $NAME $ACTION their $FOES.",
"$NAME's journey was marked by $ADJ acts of $TRAIT.",
"In the annals of history, $NAME's $TRAIT was paramount.",
"$NAME's $ADJ $TRAIT enabled them to $ABILITY their $FOES.",
"Throughout their saga, $NAME's $TRAIT $ACTION many $FOES.",
"During their quest, $NAME's $TRAIT proved $ADJ.",
"The legacy of $NAME's $TRAIT in the quest to $GOAL remains.",
"Using their $TRAIT, $NAME was able to $ACTION and $GOAL.",
"With $ADJ $TRAIT, $NAME overcame many $FOES.",
"The tales of $NAME speak of their $TRAIT and $ACTION.",
"With determination, $NAME used $TRAIT to $ACTION $FOES.",
"Through sheer $TRAIT, $NAME $ACTION their $FOES.",
"The $ADJ $NAME's $TRAIT was a crucial factor in achieving $GOAL.",
"Many legends recall $NAME's $ADJ $TRAIT in their journey.",
"$NAME's $TRAIT allowed them to $ACTION with great $ADJ.","With unparalleled $TRAIT, $NAME $ACTION their foes.",
"In pursuit of $GOAL, the $ADJ $NAME $ACTION with unmatched $TRAIT.",
"$NAME's $TRAIT and $ADJ nature were legendary.",
"Even in the darkest moments, $NAME's $TRAIT helped them $ACTION.",
"$NAME's journey was fraught with peril, but their $TRAIT saw them through.",
"Many doubted $NAME, but their $TRAIT allowed them to $GOAL.",
"The $ADJ $NAME's $TRAIT was a beacon of hope.",
"With $TRAIT as their guide, $NAME $ACTION all obstacles.",
"In the quest to $GOAL, $NAME's $TRAIT proved invaluable.",
"$NAME, the $ADJ hero, used their $TRAIT to $ACTION.",
"Legends tell of $NAME who, with $TRAIT, $ACTION every challenge.",
"The tales of $NAME's $ADJ $TRAIT inspire many.",
"In their quest for $GOAL, $NAME's $TRAIT never wavered.",
"$NAME's $ADJ $TRAIT made them a key figure in the quest to $GOAL.",
"With $TRAIT and bravery, $NAME $ACTION all who opposed them.",
"Through their journey, $NAME's $ADJ $TRAIT was their greatest weapon.",
"Many tales speak of $NAME, whose $TRAIT was $ADJ.",
"$NAME's legend grew, fueled by their $ADJ $TRAIT.",
"In the pursuit of $GOAL, $NAME's $TRAIT led the way.",
"The $ADJ $NAME used their $TRAIT to $ACTION countless foes.",
"With $TRAIT and $ADJ determination, $NAME sought to $GOAL.",
"$NAME's $ADJ journey was marked by feats of $TRAIT.",
"Stories of $NAME's $TRAIT and $ADJ deeds spread far and wide.",
"Even in the face of danger, $NAME's $TRAIT never failed them.",
"Using $TRAIT, $NAME $ACTION their foes and pursued $GOAL.",
"The $ADJ $NAME, with their $TRAIT, was a force of nature.",
"In pursuit of $GOAL, $NAME's $ADJ $TRAIT shone brightest.",
"With $TRAIT and unwavering resolve, $NAME $ACTION.",
"The $ADJ $NAME's $TRAIT made them a hero to many.",
"$NAME's $TRAIT was legendary, allowing them to $ABILITY.",
"The $ADJ $NAME's $TRAIT was key to their success.",
"In the annals of history, $NAME's $TRAIT is remembered.",
"With $TRAIT and courage, $NAME $ACTION their way to $GOAL.",
"$NAME's $TRAIT was their greatest asset in the quest to $GOAL.",
"Legends tell of the $ADJ $NAME who $ACTION with $TRAIT.",
"With their $TRAIT, $NAME $ACTION every obstacle.",
"The $ADJ $NAME's $TRAIT made them unstoppable.",
"In pursuit of $GOAL, $NAME's $TRAIT was unmatched.",
"Using $TRAIT, $NAME $ACTION their way to legend.",
"$NAME's $TRAIT allowed them to $ABILITY with ease.",
"The $ADJ $NAME's $TRAIT was renowned throughout the land.",
"With $TRAIT as their guide, $NAME $ACTION many challenges.",
"Throughout their journey, $NAME's $TRAIT was their compass.",
"$NAME's $ADJ $TRAIT made them a key player in the quest for $GOAL.",
"Through trials and tribulations, $NAME's $TRAIT prevailed.",
"Using $TRAIT, $NAME $ACTION and became a legend.",
"In pursuit of $GOAL, the $ADJ $NAME's $TRAIT was vital.",
"With $TRAIT and resolve, $NAME $ACTION all foes.",
"$NAME's $TRAIT made them a hero in the quest to $GOAL.",
"The $ADJ $NAME's $TRAIT allowed them to $ACTION and succeed.",
"Legends speak of $NAME whose $TRAIT was $ADJ and $ACTION.",
"With $TRAIT, $NAME $ACTION every challenge and $GOAL.",
"The $ADJ $NAME's $TRAIT was a symbol of their journey.",
"Using $TRAIT, $NAME $ACTION and inspired many.",
"With $TRAIT and bravery, $NAME $ACTION to achieve $GOAL.",
"The $ADJ $NAME's $TRAIT was a beacon of their legend.",
"With $TRAIT, $NAME $ACTION and became a myth.",
"Using $TRAIT, $NAME $ACTION and their legend grew.",
"The $ADJ $NAME's $TRAIT was their guiding light.",
"With $TRAIT, $NAME $ACTION and secured their place in history.",
"$NAME's $TRAIT made them a figure of legend."


]

var survival_outcomes : Array[String] = [
"they survived to tell the tale.",
"they were never seen again.",
"their legend lives on.",
"they met their end within its dark halls.",
"they emerged victorious.",
"they were lost to the dungeon's depths.",
"their story became a beacon of hope.",
"they perished in the shadows.",
"they became a hero among their people.",
"their fate remains a mystery.",
"they triumphed over the darkness.",
"they fell to the dungeon's perils.",
"their name is remembered in songs.",
"they were consumed by the dungeon.",
"they returned with newfound wisdom.",
"they were claimed by the dungeon's curse.",
"their bravery inspired generations.",
"they vanished without a trace.",
"their deeds are celebrated to this day.",
"they were never heard from again.",
"they escaped the dungeon's grasp.",
"they succumbed to the dungeon's dangers.",
"their tale is told around campfires.",
"their remains were never found.",
"their courage is etched in history.",
"they were ensnared by the dungeon.",
"they left a mark on the dungeon's history.",
"they were defeated by the dungeon's traps.",
"they forged an alliance with a mysterious creature.",
"they uncovered a hidden passage to safety.",
"they encountered an ancient guardian who spared them.",
"they found a powerful artifact and returned home.",
"they deciphered the dungeon's secrets and shared their knowledge.",
"they encountered an old friend who guided them out.",
"they barely escaped with their lives.",
"they rescued other lost adventurers on their way out.",
"they found a hidden treasure and became wealthy.",
"they discovered a portal to another realm.",
"they made a pact with an enigmatic entity.",
"they were transformed by the dungeon's magic.",
"they were cursed but managed to break free.",
"they sealed away an ancient evil within the dungeon.",
"they became the dungeon's new guardian.",
"they were saved by a divine intervention.",
"they found a lost civilization within the dungeon.",
"they unearthed a relic of immense power.",
"they encountered spectral beings who aided their escape.",
"they were bestowed with a legendary weapon.",
"they brought back tales of wonder and horror.",
"they were changed forever by their experiences.",
"they returned as a revered sage.",
"they were hailed as champions of their people.",
"they unlocked the dungeon's deepest mysteries.",
"they emerged with a newfound purpose.",
"they wrote a tome about their adventures.",
"they forged a new path through the dungeon.",
"they encountered a hidden tribe and learned their ways.",
"they discovered an ancient library of forbidden knowledge.",
"they met a tragic but heroic end.",
"they emerged as legends of their time.",
"they returned with visions of the future.",
"they found redemption within the dungeon.",
"they became a myth, inspiring countless others.",
"they unraveled the dungeon's dark history.",
"they faced their greatest fears and overcame them.",
"they found an unexpected ally in the depths.",
"they brought peace to warring factions within the dungeon.",
"they discovered a sanctuary of light in the darkness.",
"they were forever trapped in a labyrinthine maze.",
"they were captured by a tribe of dungeon-dwellers.",
"they were turned to stone by a cursed artifact.",
"they fell into a bottomless chasm.",
"they were ensnared by living shadows.",
"they succumbed to a hallucinogenic mist.",
"they were driven mad by the dungeon's whispers.",
"they were devoured by a monstrous beast.",
"they were imprisoned in a magical barrier.",
"they were overwhelmed by a horde of undead.",
"they were claimed by a malevolent spirit.",
"they were transformed into a dungeon creature.",
"they were swallowed by quicksand.",
"they were sacrificed by a dark cult.",
"they became part of the dungeon's walls.",
"they were cursed to wander the dungeon eternally.",
"they were betrayed by their own comrades.",
"they were consumed by enchanted flames.",
"they were buried in a sudden cave-in.",
"they were torn apart by feral beasts.",
"they were lost in an illusionary landscape.",
"they were poisoned by toxic spores.",
"they fell victim to a deadly trap.",
"they were absorbed into a sentient ooze.",
"they were struck down by a vengeful ghost.",
"they were blinded and stumbled into an abyss.",
"they were frozen by a frost spell.",
"they were ensnared by magical vines.",
"they were suffocated by a cloud of noxious gas.",
"they were drained of life by a vampire.",
"they were drowned in an underground lake.",
"they were paralyzed by a venomous creature.",
"they were incinerated by a dragon's breath.",
"they were electrocuted by a lightning trap.",
"they were ripped apart by spectral claws.",
"they were buried alive in shifting sands.",
"they were hunted by an invisible predator.",
"they were trapped in an eternal nightmare.",
"they were impaled by spikes from the floor.",
"they were disintegrated by a magic spell.",
"they were ensnared by a mimic posing as treasure.",
"they were crushed by collapsing walls.",
"they were driven insane by the dungeon's horrors.",
"they were rendered unconscious and never awoke.",
"they were dissolved by corrosive slime.",
"they were lured into a false sanctuary.",
"they were exiled to a void dimension.",
"they were cursed to relive their failure eternally.",
"they were outmatched by a rival adventurer."
]
var survival_prefix: Array[String] = [
	"After braving the dungeon's dangers",
"Upon facing the dungeon's countless perils",
"With courage through the dungeon's depths",
"During their perilous journey within",
"After navigating the treacherous paths",
"Through their harrowing adventure",
"Amid the dungeon's sinister trials",
"While battling the dungeon's fierce creatures",
"Upon discovering hidden secrets",
"Through enduring the dark trials",
"After fighting the dungeon's guardians",
"Within the dark, twisted passages",
"After venturing deep into the dungeon",
"Amid the ancient, forgotten chambers",
"After facing the unknown perils",
"During their exploration of the dark halls",
"Amid the shadows and secrets",
"Through battling the relentless dangers",
"Upon encountering hidden traps",
"After facing the dungeon's terrors",
"While navigating the eerie corridors",
"Deep within the haunted chambers",
"Among the cursed pathways",
"Within the dungeon's depths",
"Among the dungeon's many challenges",
"During their relentless exploration",
"After uncovering ancient mysteries",
"Through the maze of dark magic",
"Within the heart of the darkness",
"Facing the ominous trials",
"Amid the whispers of the past",
"Through the relentless shadows",
"Deep in the dungeon's history",
"Amid the sinister forces",
"Exploring shadowy depths",
"After battling the ancient evils",
"Enduring the relentless horrors",
"Amid the hidden treasures",
"Facing the wicked traps",
"Through the endless trials",
"Enduring ancient curses",
"Among the dungeon's legends",
"After uncovering lost secrets",
"While braving the dungeon's dangers",
"Upon facing the dungeon's countless perils",
"With courage through the dungeon's depths",
"During their perilous journey within",
"After navigating the treacherous paths",
"Through their harrowing adventure",
"Amid the dungeon's sinister trials",
"While battling the dungeon's fierce creatures",
"Upon discovering hidden secrets",
"Through enduring the dark trials",
"After fighting the dungeon's guardians",
"Within the dark, twisted passages",
"After venturing deep into the dungeon",
"Amid the ancient, forgotten chambers",
"After facing the unknown perils",
"During their exploration of the dark halls",
"Amid the shadows and secrets",
"Through battling the relentless dangers",
"Upon encountering hidden traps",
"After facing the dungeon's terrors",
"While navigating the eerie corridors",
"Deep within the haunted chambers",
"Among the cursed pathways",
"Within the dungeon's depths",
"Among the dungeon's many challenges",
"During their relentless exploration",
"After uncovering ancient mysteries",
"Through the maze of dark magic",
"Within the heart of the darkness",
"Facing the ominous trials",
"Amid the whispers of the past",
"Through the relentless shadows",
"Deep in the dungeon's history",
"Amid the sinister forces",
"Exploring shadowy depths",
"After battling the ancient evils",
"Enduring the relentless horrors",
"Amid the hidden treasures",
"Facing the wicked traps",
"Through the endless trials",
"Enduring ancient curses",
"Among the dungeon's legends",
"After uncovering lost secrets",
"Amidst the perilous darkness",
"Through the echoing chambers",
"While confronting their deepest fears",
"Among the ruins of a lost civilization",
"During their quest for knowledge",
"While unraveling the dungeon's mysteries",
"Upon encountering malevolent spirits",
"Amid the echoes of past adventurers",
"Through the maze of enchanted traps",
"Within the cursed catacombs",
"Among the spectral guardians",
"Through the labyrinth of despair",
"While battling relentless foes",
"During their descent into madness",
"Amid the dungeon's twisted reality",
"Through the paths of ancient magic",
"While confronting nightmarish creatures",
"Within the endless corridors",
"Amid the realm of shadows",
"Through the perilous depths of the unknown",
"While navigating the dungeon's illusions",
"Amid the haunted relics",
"Within the domain of darkness",
"Through the gauntlet of horrors",
"Among the dungeon's malevolent forces",
"While traversing the treacherous grounds",
"Amid the ancient seals and wards",
"Through the forsaken halls",
"While confronting spectral visions",
"Amid the forgotten altars",
"Within the abyssal passages",
"During the harrowing trials",
"Amid the ever-changing labyrinth",
"Through the shadowed caverns",
"While seeking the lost treasures",
"Amid the cries of the lost souls",
"Through the web of deceit",
"Within the grasp of darkness",
"While uncovering the dungeon's secrets",
"Amid the relentless challenges",
"Through the halls of torment",
"While deciphering the ancient runes",
"Amid the echoes of forgotten lore",
"Within the perilous unknown",
"While facing the ultimate test",
"Amid the corridors of fear",
"Through the maze of horrors",
"While braving the unknown depths",
"Within the dungeon's deadly embrace",
"During the final confrontation",
"Amid the realm of eternal night",
"Through the depths of despair",
"While unraveling the dark history"
]
func generate_important_figure() -> Dictionary:
	var faction = get_random_faction()
#	print(faction)
	var char_class = get_random_class()
	var visitor_name = NameGenerator.generate_name(faction)
	if GlobalVariables.rng.randi_range(1,100) == 1:
		visitor_name = BbCodeColor.random_colorize_text(visitor_name)
	var story = generate_story(visitor_name, faction, char_class)
	var visitor_background = "The " + faction + " " + char_class + " known as " + visitor_name + ". " + story

	return {"name": visitor_name, "faction": faction, "class": char_class, "background": visitor_background}

func generate_story(visitor_name: String, faction: String, char_class: String) -> String:
	var story = story_fragments[random.randi_range(0, story_fragments.size() - 1)]
	story = story.replace("$NAME", visitor_name.to_lower().capitalize())
	story = story.replace("$FACTION", faction.to_lower().capitalize())
	story = story.replace("$CLASS", char_class.to_lower().capitalize())
	story = story.replace("$ADJ", adjectives[random.randi_range(0, adjectives.size() - 1)])
	story = story.replace("$ACTION", actions[random.randi_range(0, actions.size() - 1)])
	story = story.replace("$TRAIT", traits[random.randi_range(0, traits.size() - 1)])
	story = story.replace("$GOAL", goals[random.randi_range(0, goals.size() - 1)])
	story = story.replace("$FOES", "enemies")
	story = story.replace("$ABILITY", actions[random.randi_range(0, actions.size() - 1)])
	story += " " + survival_prefix[random.randi_range(0, survival_prefix.size() - 1)] + " " + survival_outcomes[random.randi_range(0, survival_outcomes.size() - 1)]
	
	return story

# Function to get specific information about a notable person by index
func get_notable_person_info(index: int, info_type: String) -> String:
	if index >= 0 and index < visitors.size():
		var person = visitors[index]
		match info_type:
			"name":
				return person["name"]
			"faction":
				return person["faction"]
			"class":
				return person["class"]
			"background":
				return person["background"]
			_:
				return "Invalid info type"
	return get_notable_person_info(0, info_type)

# Function to pull a random notable person
func get_random_notable_person() -> Dictionary:
	if visitors.size() > 0:
		return visitors[GlobalVariables.rng.randi_range(0, visitors.size() - 1)]
	return {}



var additional_notes = [
	"The dungeon was once a bustling hub of activity, with many adventurers seeking its secrets.",
	"It is said that the dungeon was built upon ancient ruins, adding to its mystique.",
	"Many believe that a powerful artifact lies hidden within its depths, waiting to be discovered.",
	"The dungeon is rumored to be haunted by the spirits of those who perished within its walls.",
	"Some say that the dungeon's layout changes over time, making it nearly impossible to map.",
	"Legends tell of a hidden chamber filled with untold riches, guarded by ancient traps.",
	"The dungeon is said to be connected to a network of underground tunnels spanning the entire kingdom.",
	"It is believed that a dragon once made its lair within the dungeon's deepest chamber.",
	"The walls of the dungeon are inscribed with mysterious runes that few have been able to decipher.",
	"The air within the dungeon is thick with the scent of decay and the echoes of forgotten battles.",
	"The dungeon has been a site of many battles between warring factions, leaving it scarred and broken.",
	"A secret society is rumored to use the dungeon as a meeting place for their clandestine activities.",
	"The entrance to the dungeon is hidden by a powerful illusion, making it difficult to find.",
	"The dungeon is said to have been a prison for powerful beings who defied ancient rulers.",
	"A cursed treasure lies within the dungeon, bringing misfortune to those who seek it.",
	"The dungeon's walls are lined with ancient inscriptions that hint at a long-lost civilization.",
	"It is said that time flows differently within the dungeon, with days passing like minutes.",
	"The dungeon is a labyrinthine maze, with many adventurers losing their way forever.",
	"Some say the dungeon is alive, shifting and changing to protect its secrets.",
	"The dungeon's deepest chambers are rumored to hold the remains of an ancient deity.",
	"Whispers of ghostly apparitions and eerie sounds are common among those who venture near.",
	"The dungeon is said to be the resting place of a legendary hero, buried with their powerful weapon.",
	"Tales of hidden passages and secret doors are passed down through generations of adventurers.",
	"The dungeon's guardian is a fearsome creature, said to be undefeatable by mortal hands.",
	"Ancient tomes found within the dungeon speak of a great cataclysm that once befell the land.",
	"The dungeon is a place of power, with many seeking to harness its mystical energies.",
	"Legend has it that the dungeon was created by a powerful sorcerer as a test for their apprentices.",
	"The dungeon is said to be cursed, bringing madness to those who spend too long within its walls.",
	"The deeper one goes into the dungeon, the more dangerous and treacherous it becomes.",
	"Many adventurers have sought to conquer the dungeon, but few have returned to tell the tale.",
	"The dungeon is a repository of forbidden knowledge, guarded jealously by its denizens.",
	"It is believed that the dungeon's creation is tied to the alignment of the stars and celestial events.",
	"A magical barrier surrounds the dungeon's core, preventing entry by all but the most powerful mages.",
	"The dungeon is known for its complex traps, designed to ensnare the unwary.",
	"Artifacts found within the dungeon often possess strange and unpredictable powers.",
	"The dungeon's architecture defies the laws of physics, with rooms stacked in impossible configurations.",
	"Echoes of ancient chants can be heard in the dungeon's depths, chilling the blood of those who listen.",
	"Many sections of the dungeon are flooded, hiding secrets beneath murky waters.",
	"The dungeon's library contains scrolls of forbidden spells, coveted by dark wizards.",
	"The dungeon's creators left behind cryptic messages, hinting at a grand design.",
	"A sect of monks once used the dungeon as a place of meditation and training.",
	"Portals to other realms are said to be hidden within the dungeon's deepest chambers.",
	"The dungeon's flora is unlike anything found on the surface, with glowing mushrooms and carnivorous plants.",
	"An ancient prophecy foretells that a great hero will rise from the dungeon's depths.",
	"The dungeon's halls are patrolled by spectral guardians, bound to protect it for eternity.",
	"A powerful relic was shattered within the dungeon, its pieces scattered throughout its halls.",
	"The dungeon is said to be a gateway to the underworld, guarded by fearsome demons.",
	"Legend speaks of a hidden sanctuary within the dungeon, offering respite to weary adventurers.",
	"The dungeon's forges still burn, crafting weapons of unparalleled quality.",
	"The dungeon was once a thriving city, now reduced to ruins over centuries of neglect.",
	"Golems crafted from the dungeon's stone serve as tireless sentinels.",
	"The dungeon is a nexus of ley lines, amplifying magical energy in unpredictable ways.",
	"A hidden cult worships an ancient deity within the dungeon's darkest recesses.",
	"The dungeon's treasury is said to be bottomless, filled with gold and jewels beyond imagination.",
	"A plague was once unleashed from the dungeon, decimating nearby villages.",
	"The dungeon's halls echo with the roars of beasts that defy description.",
	"The walls are adorned with frescoes depicting epic battles and legendary heroes.",
	"The dungeon is rumored to hold the key to immortality, sought by many but found by none.",
	"The air grows colder as one descends, with frost covering the deepest chambers.",
	"The dungeon's entrance is guarded by a riddle, only solvable by those of great intellect.",
	"Ancient machinery hums deep within the dungeon, hinting at forgotten technology.",
	"The dungeon is a confluence of elements, with areas dominated by fire, water, earth, and air.",
	"The dungeon is said to house the tomb of a forgotten king, surrounded by his loyal undead knights.",
"A waterfall of molten lava flows through one of the dungeon's chambers, illuminating it with an eerie glow.",
"Giant crystals protrude from the dungeon walls, pulsing with arcane energy.",
"The dungeon's air is filled with the constant hum of ancient magic, making it difficult to concentrate.",
"A labyrinth of twisting tunnels leads deeper into the dungeon, each path more treacherous than the last.",
"The dungeon's ceiling is so high it disappears into darkness, giving the impression of an endless void above.",
"Ancient altars covered in bloodstains suggest dark rituals once took place within the dungeon.",
"The walls of the dungeon are covered in ivy and moss, a testament to its age and neglect.",
"It is said that the dungeon was once the site of a great battle between gods, and their power still lingers.",
"The dungeon's entrance is guarded by a pair of stone statues that seem to watch those who enter.",
"Strange, otherworldly music can be heard echoing through the dungeon's halls, luring adventurers deeper.",
"The dungeon floor is littered with the bones of previous explorers, a grim warning to those who follow.",
"Pillars of obsidian rise from the ground, etched with symbols that seem to shift and change.",
"A massive, chained door blocks the way, rumored to be the entrance to the dungeon's most dangerous depths.",
"The air in the dungeon is filled with a thick, magical fog that obscures vision and dampens sound.",
"Bioluminescent fungi light the way through some of the dungeon's darker passages.",
"Ancient murals on the dungeon walls depict scenes of great heroes and their tragic ends.",
"Some say the dungeon's layout is influenced by the dreams of a slumbering god beneath it.",
"The dungeon is filled with the sound of dripping water, echoing through its silent halls.",
"A giant chasm splits the dungeon in two, spanned only by a rickety, ancient bridge.",
"Rumors speak of a hidden library within the dungeon, containing lost knowledge and forbidden spells.",
"The dungeon's entrance is carved into the side of a mountain, hidden behind a cascading waterfall.",
"An oppressive darkness fills the dungeon, resisting all attempts to illuminate it with mundane light.",
"A strange, metallic tang fills the air, hinting at the presence of ancient machines deep within the dungeon.",
"The dungeon's corridors twist and turn like a snake, confusing even the most seasoned adventurers.",
"Massive chains dangle from the ceiling, their purpose long forgotten.",
"The walls are warm to the touch, as if the dungeon itself is alive and breathing.",
"Some sections of the dungeon are submerged in water, requiring adventurers to swim through flooded passages.",
"The dungeon's guardian is said to be a colossal stone golem, animated by ancient magic.",
"Strange, glowing runes float in the air, their meaning lost to time.",
"The dungeon is home to a colony of giant bats, their screeches echoing through the halls.",
"The temperature drops dramatically in certain parts of the dungeon, causing breath to mist and fingers to numb.",
"A faint, otherworldly glow emanates from cracks in the dungeon floor, hinting at untold power below.",
"Ancient traps still function within the dungeon, waiting to ensnare the unwary.",
"Whispers of a lost civilization can be heard in the dungeon's depths, their language long forgotten.",
"The dungeon's walls are adorned with carvings of monstrous creatures, their eyes seeming to follow those who pass.",
"The scent of brimstone fills the air, suggesting the presence of demonic entities.",
"Glistening veins of precious metals run through the dungeon walls, tempting adventurers with their wealth.",
"Strange, otherworldly flora grows in the dungeon, with some plants reacting to the presence of intruders.",
"The dungeon's deepest chamber is said to contain a portal to another realm, guarded by eldritch horrors.",
"The sound of grinding gears echoes through the dungeon, hinting at ancient machinery still in operation.",
"Patches of glowing moss provide faint light in the otherwise pitch-black tunnels.",
"The dungeon's halls are patrolled by spectral knights, bound to protect it for all eternity.",
"Some say the dungeon's heart is a sentient entity, manipulating its layout to challenge those who enter.",
"The air is thick with the smell of rot and decay, a testament to the many who have perished within.",
"Ancient, rusted weapons are scattered throughout the dungeon, relics of long-forgotten battles.",
"The walls seem to close in on you, creating a claustrophobic atmosphere.",
"A faint, eerie glow comes from deep within the dungeon, as if calling adventurers to their doom.",
"The sound of distant drums can be heard, their rhythm drawing you deeper into the dungeon.",
"The dungeon's deepest chambers are said to house a colossal beast, its roar shaking the very foundations.",
"The dungeon's entrance is marked by a circle of standing stones, each engraved with cryptic runes.",
"The sound of chains rattling echoes through the dungeon, though the source remains unseen.",
"Veins of glowing crystals run through the walls, casting an eerie light on the surroundings.",
"Legend has it that a powerful lich rules over the dungeon's deepest levels, commanding legions of undead.",
"The dungeon's chambers are filled with ancient statues, each one depicting a long-forgotten deity.",
"Flickering torches line the walls, though no one knows who keeps them lit.",
"The dungeon's floor is covered in a thick layer of dust, undisturbed for centuries.",
"A thick, black mist fills the lower levels of the dungeon, obscuring vision and chilling the bones.",
"Ancient inscriptions warn of a curse that befalls those who take treasure from the dungeon.",
"The dungeon is said to be a nexus of magical energy, drawing sorcerers and warlocks from across the land.",
"The dungeon's corridors are lined with cells, suggesting it once served as a prison.",
"Strange, echoing voices can be heard in the dungeon, speaking in an unknown tongue.",
"The dungeon's walls are adorned with paintings depicting scenes of great battles and heroic deeds.",
"A sense of foreboding fills the air, as if the dungeon itself is aware of your presence.",
"The dungeon's architecture changes abruptly, as if different parts were built by various civilizations.",
"A large, ornate door blocks the way, covered in ancient symbols and magical wards.",
"The dungeon's air is thick with the smell of sulfur, suggesting a volcanic origin.",
"Giant spider webs cover parts of the dungeon, hinting at the presence of monstrous arachnids.",
"The floor is covered in a thin layer of water, making each step echo loudly through the halls.",
"The dungeon's walls are made of a strange, unidentifiable metal that hums with latent energy.",
"The sound of distant footsteps can be heard, though their source remains a mystery.",
"Faded tapestries hang from the walls, depicting the rise and fall of ancient empires.",
"The dungeon's passages are narrow and winding, making it easy to get lost.",
"A series of levers and gears are built into the walls, hinting at hidden mechanisms and traps.",
"The air grows warmer as you descend, suggesting that something fiery awaits below.",
"The dungeon's walls are inscribed with the names of those who have perished within.",
"A strange, pulsating light emanates from deep within the dungeon, drawing adventurers closer.",
"The dungeon is said to house the remains of a great dragon, its bones still radiating power.",
"The floor is uneven and covered in rubble, making progress slow and treacherous.",
"The dungeon's architecture features high arches and vaulted ceilings, giving it a cathedral-like atmosphere.",
"Strange symbols glow faintly on the walls, casting a dim light in the otherwise dark corridors.",
"The dungeon is filled with the sound of dripping water, echoing through its many chambers.",
"Ancient shields and weapons are mounted on the walls, trophies from long-forgotten battles.",
"The scent of rotting flesh fills the air, suggesting the presence of undead creatures.",
"The dungeon's floors are covered in a thick, viscous slime that makes movement difficult.",
"An ominous silence fills the dungeon, broken only by the occasional distant scream.",
"The walls are covered in moss and lichen, giving the dungeon a damp, musty smell.",
"A powerful enchantment wards the entrance, requiring a spell to break.",
"The dungeon's passages are narrow and claustrophobic, pressing in on all sides.",
"The walls are lined with ancient bookshelves, filled with tomes of forbidden knowledge.",
"The floor is covered in a thick layer of ash, suggesting a fire swept through long ago.",
"The dungeon's corridors twist and turn, creating a maze that confounds even seasoned adventurers.",
"The air is filled with the scent of decay, a grim reminder of those who perished within.",
"Ancient stone sarcophagi line the walls, each one sealed with powerful magic.",
"The dungeon's walls are carved with scenes of otherworldly landscapes, hinting at a connection to other realms.",
"The floor is covered in a thick carpet of moss, muffling the sound of footsteps.",
"Flickering shadows dance on the walls, as if the dungeon itself is alive and watching.",
"A strange, metallic taste fills the air, hinting at the presence of powerful magic.",
"The dungeon's corridors are lined with statues, each one more grotesque than the last.",
"A sense of unease fills the air, as if something terrible is watching from the shadows.",
"The walls are covered in ancient graffiti, left by previous explorers who never returned.",
"Hidden passageways and secret doors are said to be scattered throughout the dungeon, leading to unknown depths."
]

func generate_additional_history() -> String:
	var unique_additional_notes = additional_notes.duplicate()
	unique_additional_notes.shuffle()

	var history = ""
	var num_lines = min((random.randi_range(2, 5) + GlobalVariables.rng.randi_range(0,3)), 6)

	for i in range(num_lines):
		history += unique_additional_notes[i] + "\n"

	return history

func get_random_faction() -> String:
	var factions = faction_manager.faction_list.values()
	return get_faction_name(factions[random.randi_range(0, factions.size() - 1)]).to_lower().capitalize()

func get_random_class() -> String:
	var classes = class_manager.class_list.values()
	return get_class_name(classes[random.randi_range(0, classes.size() - 1)]).to_lower().capitalize()

func get_faction_name(faction: int) -> String:
	return FactionManager.faction_list.keys()[faction]

func get_class_name(mob_class: int) -> String:
	return ClassManager.class_list.keys()[mob_class]

func format_visitors(visitors) -> String:
	var output : String = ""
	for visitor in visitors:
		var visitor_name = visitor.get("name", "Unknown")
		var faction = visitor.get("faction", "Unknown")
		var char_class = visitor.get("class", "Unknown")
		var background = visitor.get("background", "No background available")
		
		output += "Name: " + visitor_name + "\n"
		output += "Faction: " + faction + "\n"
		output += "Class: " + char_class + "\n"
		output += "Background: " + background + "\n\n"
		output += "\n"  # Two blank lines between visitors
	
	return output

