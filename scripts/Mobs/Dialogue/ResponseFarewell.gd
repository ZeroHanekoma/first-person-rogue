extends Resource
class_name ResponseFarewell

@export var farewells: Dictionary = {
	"human": {
	"ally": [
		"Take care, my friend.",
		"Farewell, until we meet again!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay well, friend.",
		"See you soon, take care."
	],
	"friendly": [
		"Goodbye, dear friend!",
		"Farewell, companion!",
		"Safe travels, my good friend!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, wanderer.",
		"Safe travels, stranger.",
		"Goodbye, unknown one.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away!"
	]
},
"elf": {
	"ally": [
		"Farewell, noble friend.",
		"Until we meet again, dear ally.",
		"Safe journeys, esteemed one.",
		"Goodbye, and may the forest protect you.",
		"See you soon, trusted friend."
	],
	"friendly": [
		"Farewell, forest friend.",
		"Goodbye, kindred spirit.",
		"Safe travels, ally of the woods.",
		"See you next time, trusted one.",
		"Goodbye, my dear friend."
	],
	"neutral": [
		"Goodbye, wanderer.",
		"Farewell, stranger.",
		"Safe travels, outsider.",
		"Goodbye, traveler.",
		"Farewell, unknown one."
	],
	"hostile": [
		"Leave now, and do not return!",
		"Good riddance!",
		"Get out, intruder!",
		"Do not come back!",
		"Stay away from these lands!"
	]
},
"dwarf": {
	"ally": [
		"Take care, friend.",
		"Farewell, until next time!",
		"Safe travels, trusted ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, mate."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, mate!",
		"Safe travels, fellow traveler!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, stranger.",
		"Farewell, traveler.",
		"Safe travels, unknown one.",
		"Goodbye, newcomer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of my sight!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"halfling": {
	"ally": [
		"Take care, my friend.",
		"Farewell, until next time!",
		"Safe travels, dear ally.",
		"Goodbye, and stay well, friend.",
		"See you soon, friend."
	],
	"friendly": [
		"Goodbye, dear friend!",
		"Farewell, traveler!",
		"Safe travels, my good friend!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye there.",
		"Farewell.",
		"Safe travels, stranger.",
		"Goodbye, traveler.",
		"Farewell, unknown one."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"gnome": {
	"ally": [
		"Take care, my friend.",
		"Farewell, until we meet again!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay bright, friend.",
		"See you soon, friend."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally!",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"orc": {
	"ally": [
		"Farewell, strong one.",
		"Until we meet again, warrior!",
		"Safe travels, mighty ally.",
		"Goodbye, and stay fierce, friend.",
		"See you soon, warrior."
	],
	"friendly": [
		"Goodbye, strong one!",
		"Farewell, ally.",
		"Safe travels, warrior!",
		"See you next time, fighter!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, wanderer.",
		"Safe travels, stranger.",
		"Goodbye, outsider.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"tiefling": {
	"ally": [
		"Take care, friend.",
		"Farewell, until we meet again!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, trusted one."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally!",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, stranger.",
		"Farewell, traveler.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"dragonborn": {
	"ally": [
		"Farewell, noble one.",
		"Until we meet again, great warrior.",
		"Safe travels, honored ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, noble ally."
	],
	"friendly": [
		"Goodbye, noble one!",
		"Farewell, warrior.",
		"Safe travels, friend!",
		"See you next time, ally!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"drow": {
	"ally": [
		"Take care, friend.",
		"Farewell, until we meet again!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay safe, friend.",
		"See you soon, trusted one."
	],
	"friendly": [
		"Goodbye, ally!",
		"Farewell, friend.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, stranger.",
		"Farewell, traveler.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"half_elf": {
	"ally": [
		"Take care, my friend.",
		"Farewell, until we meet again!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay well, friend.",
		"See you soon, friend."
	],
	"friendly": [
		"Goodbye, dear friend!",
		"Farewell, ally!",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"half_orc": {
	"ally": [
		"Farewell, strong one.",
		"Until we meet again, warrior!",
		"Safe travels, mighty ally.",
		"Goodbye, and stay fierce, friend.",
		"See you soon, warrior."
	],
	"friendly": [
		"Goodbye, strong one!",
		"Farewell, ally.",
		"Safe travels, warrior!",
		"See you next time, fighter!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, wanderer.",
		"Safe travels, stranger.",
		"Goodbye, outsider.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"aasimar": {
	"ally": [
		"Farewell, blessed one.",
		"Until we meet again, radiant friend!",
		"Safe travels, noble ally.",
		"Goodbye, and stay blessed, friend.",
		"See you soon, celestial one."
	],
	"friendly": [
		"Goodbye, blessed one!",
		"Farewell, ally.",
		"Safe travels, radiant friend!",
		"See you next time, shining one!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"kenku": {
	"ally": [
		"Farewell, feathered friend.",
		"Until we meet again, my friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay bright, friend.",
		"See you soon, feathered ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"tabaxi": {
	"ally": [
		"Farewell, swift one.",
		"Until we meet again, agile friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay nimble, friend.",
		"See you soon, swift ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"lizardfolk": {
	"ally": [
		"Farewell, scaled one.",
		"Until we meet again, cold-blooded friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, scaled ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"merfolk": {
	"ally": [
		"Farewell, ocean kin.",
		"Until we swim again, aquatic friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay safe in the depths, friend.",
		"See you soon, ocean ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"troll": {
	"ally": [
		"Farewell, mighty one.",
		"Until we meet again, strong friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay fierce, friend.",
		"See you soon, mighty ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"fairy": {
	"ally": [
		"Farewell, sparkly one.",
		"Until we meet again, bright friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay magical, friend.",
		"See you soon, sparkly ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"vampire": {
	"ally": [
		"Farewell, eternal one.",
		"Until we meet again, nocturnal friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay vigilant, friend.",
		"See you soon, eternal ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"lycan": {
	"ally": [
		"Farewell, beastly one.",
		"Until we meet again, wild friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay fierce, friend.",
		"See you soon, wild ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"demon": {
	"ally": [
		"Farewell, dark one.",
		"Until we meet again, fiendish friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay cunning, friend.",
		"See you soon, dark ally."
	],
	"friendly": [
		"Goodbye, ally.",
		"Farewell, friend.",
		"Safe travels, trusted one!",
		"See you next time, fiend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"angel": {
	"ally": [
		"Farewell, blessed one.",
		"Until we meet again, celestial friend!",
		"Safe travels, noble ally.",
		"Goodbye, and stay blessed, friend.",
		"See you soon, radiant ally."
	],
	"friendly": [
		"Goodbye, blessed one!",
		"Farewell, ally.",
		"Safe travels, radiant friend!",
		"See you next time, shining one!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"beast": {
	"ally": [
		"Farewell, wild one.",
		"Until we meet again, feral friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay fierce, friend.",
		"See you soon, wild ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"minotaur": {
	"ally": [
		"Farewell, strong one.",
		"Until we meet again, bull-headed friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, mighty ally."
	],
	"friendly": [
		"Goodbye, strong one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"harpy": {
	"ally": [
		"Farewell, winged one.",
		"Until we meet again, skyward friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay aloft, friend.",
		"See you soon, winged ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"cyclops": {
	"ally": [
		"Farewell, mighty one.",
		"Until we meet again, one-eyed friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, towering ally."
	],
	"friendly": [
		"Goodbye, strong one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"giant": {
	"ally": [
		"Farewell, colossal one.",
		"Until we meet again, towering friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay mighty, friend.",
		"See you soon, giant ally."
	],
	"friendly": [
		"Goodbye, colossal one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"ogre": {
	"ally": [
		"Farewell, mighty one.",
		"Until we meet again, hulking friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, hulking ally."
	],
	"friendly": [
		"Goodbye, mighty one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"kobold": {
	"ally": [
		"Farewell, crafty one.",
		"Until we meet again, cunning friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay clever, friend.",
		"See you soon, crafty ally."
	],
	"friendly": [
		"Goodbye, sneaky one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"undead": {
	"ally": [
		"Farewell, kindred spirit.",
		"Until we meet again, deathless friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay eternal, friend.",
		"See you soon, undying ally."
	],
	"friendly": [
		"Goodbye, deathless one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"chimera": {
	"ally": [
		"Farewell, hybrid one.",
		"Until we meet again, mighty friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay strong, friend.",
		"See you soon, powerful ally."
	],
	"friendly": [
		"Goodbye, hybrid one!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"goblin": {
	"ally": [
		"Farewell, sneaky one.",
		"Until we meet again, clever friend!",
		"Safe travels, esteemed ally.",
		"Goodbye, and stay crafty, friend.",
		"See you soon, sneaky ally."
	],
	"friendly": [
		"Goodbye, friend!",
		"Farewell, ally.",
		"Safe travels, trusted one!",
		"See you next time, friend!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
},
"dragon": {
	"ally": [
		"Farewell, illustrious one.",
		"Until we meet again, magnificent friend!",
		"Safe travels, noble ally.",
		"Goodbye, and stay mighty, friend.",
		"See you soon, esteemed ally."
	],
	"friendly": [
		"Goodbye, noble one!",
		"Farewell, ally.",
		"Safe travels, revered friend!",
		"See you next time, magnificent one!",
		"Take care until we meet again!"
	],
	"neutral": [
		"Goodbye, traveler.",
		"Farewell, stranger.",
		"Safe travels, unknown one.",
		"Goodbye, wanderer.",
		"Farewell, passerby."
	],
	"hostile": [
		"Leave now, and don't come back!",
		"Good riddance!",
		"Get out of here!",
		"Don't come back!",
		"Stay away from here!"
	]
}
}
