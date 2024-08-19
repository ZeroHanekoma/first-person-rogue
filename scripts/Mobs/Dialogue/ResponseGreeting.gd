extends Resource
class_name ResponseGreeting

@export var greetings: Dictionary = {
	"human": {
		"ally": [
			"What can I do for you, my friend?", 
			"It's always a joy to see you!", 
			"How can I be of service today?", 
			"Greetings, esteemed ally.", 
			"Your presence brightens my day, friend."
		],
		"friendly": [
			"Hello, dear friend!", 
			"Good to see you, companion!", 
			"Ah, a familiar face!", 
			"Welcome, my good friend!", 
			"It's always a pleasure to see you!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, wanderer.", 
			"Salutations, stranger.", 
			"Welcome, unknown one.", 
			"Hello, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Get lost, now!", 
			"Why are you here?", 
			"Leave at once!", 
			"You're not welcome here."
		]
	},
	"elf": {
		"ally": [
			"What can I do for you, noble friend?", 
			"It's always a delight to see you!", 
			"How may I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a gift, dear friend."
		],
		"friendly": [
			"Greetings, forest friend.", 
			"Welcome, kindred spirit.", 
			"Salutations, ally of the woods.", 
			"Hail, trusted one.", 
			"Hello, my dear friend."
		],
		"neutral": [
			"Hello, wanderer.", 
			"Greetings, stranger.", 
			"Welcome, outsider.", 
			"Hello, traveler.", 
			"Greetings, unknown one."
		],
		"hostile": [
			"Leave now, intruder!", 
			"You are not welcome here.", 
			"Begone, unwelcome one!", 
			"Your presence is not desired.", 
			"Depart from these lands immediately."
		]
	},
	"dwarf": {
		"ally": [
			"What can I do for you, friend?", 
			"It's always good to see you, mate!", 
			"How can I assist you today?", 
			"Greetings, trusted ally.", 
			"Your presence is a comfort, friend."
		],
		"friendly": [
			"Ah, a friend!", 
			"Good to see you, mate!", 
			"Welcome, fellow traveler!", 
			"Hello, dear friend!", 
			"Always a pleasure to see you!"
		],
		"neutral": [
			"Hello, stranger.", 
			"Greetings, traveler.", 
			"Welcome, unknown one.", 
			"Hello, newcomer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want here?", 
			"Get out of my sight!", 
			"Why are you here?", 
			"Leave now!", 
			"You're not welcome here."
		]
	},
	"halfling": {
		"ally": [
			"What can I do for you, my friend?", 
			"It's always wonderful to see you!", 
			"How may I help you today?", 
			"Greetings, dear ally.", 
			"Your presence brings joy, friend."
		],
		"friendly": [
			"Hello, dear friend!", 
			"Welcome, traveler!", 
		"Greetings, my good friend!", 
			"Ah, a familiar face!", 
			"It's always a pleasure to see you!"
		],
		"neutral": [
			"Hello there.", 
			"Greetings.", 
			"Welcome, stranger.", 
			"Hello, traveler.", 
			"Greetings, unknown one."
		],
		"hostile": [
			"What are you doing here?", 
			"You should leave now.", 
			"Why are you here?", 
			"Leave immediately!", 
			"You're not welcome here."
		]
	},
	"gnome": {
		"ally": [
			"What can I do for you, my friend?", 
			"It's always a delight to see you!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence brightens my day, friend."
		],
		"friendly": [
			"Greetings, friend!", 
			"Hello, ally!", 
			"Welcome, trusted one!", 
			"Ah, a familiar face!", 
			"Good to see you, my friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"orc": {
		"ally": [
			"What can I do for you, strong one?", 
			"Always good to see you, warrior!", 
			"How may I assist you today?", 
			"Greetings, mighty ally.", 
			"Your presence is an honor, friend."
		],
		"friendly": [
			"Hello, strong one!", 
			"Greetings, ally.", 
			"Welcome, warrior!", 
			"Ah, a fellow fighter!", 
			"Good to see you, friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"What do you want?", 
			"Greetings, stranger.", 
			"Welcome, outsider.", 
			"Hello, wanderer."
		],
		"hostile": [
			"Get out of here!", 
			"You're not welcome.", 
			"Leave now!", 
			"Why are you here?", 
			"Begone, intruder!"
		]
	},
	"tiefling": {
		"ally": [
			"What can I do for you, friend?", 
			"Always good to see you, trusted one!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is valued, friend."
		],
		"friendly": [
			"Greetings, friend.", 
			"Hello, ally.", 
			"Welcome, trusted one.", 
			"Ah, a familiar face!", 
			"Good to see you, friend!"
		],
		"neutral": [
			"Hello, stranger.", 
			"Greetings.", 
			"Welcome, traveler.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"dragonborn": {
		"ally": [
			"What can I do for you, noble one?", 
			"Always good to see you, warrior!", 
			"How may I assist you today?", 
			"Greetings, honored ally.", 
			"Your presence is a privilege, friend."
		],
		"friendly": [
			"Greetings, noble one.", 
			"Hello, friend.", 
			"Welcome, warrior!", 
			"Ah, a fellow dragonborn!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"drow": {
		"ally": [
			"What can I do for you, friend?", 
			"Always good to see you, trusted one!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is valued, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, trusted one.", 
			"Ah, a familiar face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, stranger.", 
			"Greetings.", 
			"Welcome, traveler.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"half_elf": {
		"ally": [
			"What can I do for you, my friend?", 
			"It's always a joy to see you!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence brightens my day, friend."
		],
		"friendly": [
			"Greetings, friend.", 
			"Hello, ally.", 
			"Welcome, trusted one.", 
			"Ah, a familiar face!", 
			"Good to see you, friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"half_orc": {
		"ally": [
			"What can I do for you, strong one?", 
			"Always good to see you, warrior!", 
			"How may I assist you today?", 
			"Greetings, mighty ally.", 
			"Your presence is an honor, friend."
		],
		"friendly": [
			"Hello, strong one!", 
			"Greetings, ally.", 
			"Welcome, warrior!", 
			"Ah, a fellow fighter!", 
			"Good to see you, friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"What do you want?", 
			"Greetings, stranger.", 
			"Welcome, outsider.", 
			"Hello, wanderer."
		],
		"hostile": [
			"Get out of here!", 
			"You're not welcome.", 
			"Leave now!", 
			"Why are you here?", 
			"Begone, intruder!"
		]
	},
	"aasimar": {
		"ally": [
			"What can I do for you, blessed one?", 
			"Always good to see you, radiant friend!", 
			"How may I assist you today?", 
			"Greetings, noble ally.", 
			"Your presence is a blessing, friend."
		],
		"friendly": [
			"Greetings, blessed one.", 
			"Hello, friend.", 
			"Welcome, shining ally!", 
			"Ah, a radiant face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"kenku": {
		"ally": [
			"What can I do for you, my friend?", 
			"Always good to see you, feathered ally!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence brightens my day, friend."
		],
		"friendly": [
			"Greetings, friend.", 
			"Hello, ally.", 
			"Welcome, feathered one!", 
			"Ah, a familiar face!", 
			"Good to see you, my friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"tabaxi": {
		"ally": [
			"What can I do for you, swift one?", 
			"Always good to see you, agile friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a joy, friend."
		],
		"friendly": [
			"Hello, friend!", 
			"Greetings, ally.", 
			"Welcome, swift one!", 
			"Ah, a nimble face!", 
			"Good to see you, my friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"lizardfolk": {
		"ally": [
			"What can I do for you, scaled one?", 
			"Always good to see you, cold-blooded friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a comfort, friend."
		],
		"friendly": [
			"Greetings, friend.", 
			"Hello, ally.", 
			"Welcome, scaled one!", 
			"Ah, a familiar face!", 
			"Good to see you, friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"merfolk": {
		"ally": [
			"What can I do for you, ocean kin?", 
			"Always good to see you, aquatic friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a wave of joy, friend."
		],
		"friendly": [
			"Greetings, friend.", 
			"Hello, ally.", 
			"Welcome, ocean kin!", 
			"Ah, a familiar face from the waves!", 
			"Good to see you, my friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"troll": {
		"ally": [
			"What can I do for you, mighty one?", 
			"Always good to see you, strong friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a strength, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, mighty one!", 
			"Ah, a familiar strong face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"fairy": {
		"ally": [
			"What can I do for you, sparkly one?", 
			"Always good to see you, bright friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a delight, friend."
		],
		"friendly": [
			"Hello, friend!", 
			"Greetings, ally.", 
			"Welcome, sparkly one!", 
			"Ah, a familiar bright face!", 
			"Good to see you, my friend!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"demon": {
		"ally": [
			"What can I do for you, dark one?", 
			"Always good to see you, fiendish friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a dark pleasure, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, dark one!", 
			"Ah, a familiar fiendish face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"angel": {
		"ally": [
			"What can I do for you, blessed one?", 
			"Always good to see you, celestial friend!", 
			"How may I assist you today?", 
			"Greetings, noble ally.", 
			"Your presence is a blessing, friend."
		],
		"friendly": [
			"Greetings, blessed one.", 
			"Hello, friend.", 
			"Welcome, celestial one!", 
			"Ah, a radiant face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"vampire": {
		"ally": [
			"What can I do for you, eternal one?", 
			"Always good to see you, nocturnal friend!", 
			"How may I assist you today?", 
			"Greetings, immortal ally.", 
			"Your presence is a dark delight, friend."
		],
		"friendly": [
			"Greetings, eternal one.", 
			"Hello, friend.", 
			"Welcome, nocturnal one!", 
			"Ah, a familiar face of the night!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"lycan": {
		"ally": [
			"What can I do for you, beastly one?", 
			"Always good to see you, wild friend!", 
			"How may I assist you today?", 
			"Greetings, feral ally.", 
			"Your presence is a wild joy, friend."
		],
		"friendly": [
			"Hello, strong one!", 
			"Greetings, ally.", 
			"Welcome, wild one!", 
			"Ah, a familiar beastly face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"Get out of here!", 
			"You're not welcome.", 
			"Leave now!", 
			"Why are you here?", 
			"Begone, intruder!"
		]
	},
	"cyclops": {
		"ally": [
			"What can I do for you, mighty one?", 
			"Always good to see you, one-eyed friend!", 
			"How may I assist you today?", 
			"Greetings, towering ally.", 
			"Your presence is a great honor, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, mighty one!", 
			"Ah, a familiar towering face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"giant": {
		"ally": [
			"What can I do for you, colossal one?", 
			"Always good to see you, towering friend!", 
			"How may I assist you today?", 
			"Greetings, mighty ally.", 
			"Your presence is a great honor, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, colossal one!", 
			"Ah, a familiar towering face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"ogre": {
		"ally": [
			"What can I do for you, mighty one?", 
			"Always good to see you, hulking friend!", 
			"How may I assist you today?", 
			"Greetings, powerful ally.", 
			"Your presence is a great honor, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, mighty one!", 
			"Ah, a familiar hulking face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"harpy": {
		"ally": [
			"What can I do for you, winged one?", 
			"Always good to see you, skyward friend!", 
			"How may I assist you today?", 
			"Greetings, aerial ally.", 
			"Your presence is a delight, friend."
		],
		"friendly": [
			"Hello, friend!", 
			"Greetings, ally.", 
			"Welcome, winged one!", 
			"Ah, a familiar face from the skies!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"minotaur": {
		"ally": [
			"What can I do for you, strong one?", 
			"Always good to see you, bull-headed friend!", 
			"How may I assist you today?", 
			"Greetings, mighty ally.", 
			"Your presence is a great honor, friend."
		],
		"friendly": [
			"Hello, strong one!", 
			"Greetings, ally.", 
			"Welcome, bull-headed one!", 
			"Ah, a familiar powerful face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"What do you want?", 
			"Greetings, stranger.", 
			"Welcome, outsider.", 
			"Hello, wanderer."
		],
		"hostile": [
			"Get out of here!", 
			"You're not welcome.", 
			"Leave now!", 
			"Why are you here?", 
			"Begone, intruder!"
		]
	},
	"kobold": {
		"ally": [
			"What can I do for you, crafty one?", 
			"Always good to see you, cunning friend!", 
			"How may I assist you today?", 
			"Greetings, clever ally.", 
			"Your presence is a delight, friend."
		],
		"friendly": [
			"Hello, friend!", 
			"Greetings, ally.", 
			"Welcome, crafty one!", 
			"Ah, a familiar cunning face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome."
		]
	},
	"undead": {
		"ally": [
			"What can I do for you, kindred spirit?", 
			"Always good to see you, deathless friend!", 
			"How can I assist you today?", 
			"Greetings, esteemed ally.", 
			"Your presence is a comfort, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, kindred spirit!", 
			"Ah, a familiar deathless face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"chimera": {
		"ally": [
			"What can I do for you, hybrid one?", 
			"Always good to see you, mighty friend!", 
			"How may I assist you today?", 
			"Greetings, powerful ally.", 
			"Your presence is a great honor, friend."
		],
		"friendly": [
			"Hello, ally.", 
			"Greetings, friend.", 
			"Welcome, hybrid one!", 
			"Ah, a familiar powerful face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"goblin": {
		"ally": [
			"What can I do for you, sneaky one?", 
			"Always good to see you, cunning friend!", 
			"How may I assist you today?", 
			"Greetings, clever ally.", 
			"Your presence is a delight, friend."
		],
		"friendly": [
			"Hello, friend!", 
			"Greetings, ally.", 
			"Welcome, sneaky one!", 
			"Ah, a familiar cunning face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"beast": {
		"ally": [
			"What can I do for you, wild one?", 
			"Always good to see you, feral friend!", 
			"How may I assist you today?", 
			"Greetings, untamed ally.", 
			"Your presence is a wild joy, friend."
		],
		"friendly": [
			"Hello, wild one!", 
			"Greetings, ally.", 
			"Welcome, feral one!", 
			"Ah, a familiar untamed face!", 
			"Good to see you, ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What do you want?", 
			"Leave now!", 
			"Why are you here?", 
			"Get out of here!", 
			"You're not welcome here."
		]
	},
	"dragon": {
		"ally": [
			"What can I do for you, illustrious one?", 
			"It is an honor to see you, magnificent friend!", 
			"How may I be of service today?", 
			"Greetings, noble ally.", 
			"Your presence graces us, esteemed friend."
		],
		"friendly": [
			"Greetings, noble one.", 
			"Salutations, revered friend.", 
			"Welcome, magnificent one!", 
			"Ah, a face of grandeur!", 
			"Good to see you, esteemed ally!"
		],
		"neutral": [
			"Hello, traveler.", 
			"Greetings, stranger.", 
			"Welcome, unknown one.", 
			"Hello, wanderer.", 
			"Greetings, passerby."
		],
		"hostile": [
			"What brings you here?", 
			"Leave at once!", 
			"Why do you intrude?", 
			"Begone from my presence!", 
			"You are not welcome here!"
		]
	}
}
