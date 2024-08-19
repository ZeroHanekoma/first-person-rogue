extends Resource
class_name RumorResource

@export var rumors: Dictionary = {
	"ally": ["$PERSON told me about $EVENT in $PLACE.", "They say $OBJECT is hidden in $PLACE."],
	"friendly": ["I've heard about $EVENT happening in $PLACE.", "People talk about $PERSON and $OBJECT."],
	"neutral": ["There are rumors of $EVENT.", "$PERSON mentioned $PLACE."],
	"hostile": ["Stay away from $PLACE, it's dangerous.", "$PERSON is up to something at $PLACE."],
	"refuse": ["I have nothing to say to you."]
}

@export var places: Array = [
	"the old ruins",
	"the forest",
	"the castle",
	"the village"
]

@export var people: Array = [
	"the blacksmith",
	"the mayor",
	"the wizard",
	"the farmer"
]

@export var events: Array = [
	"a hidden treasure",
	"a haunting",
	"a secret meeting",
	"a great feast"
]

@export var objects: Array = [
	"an ancient artifact",
	"a powerful weapon",
	"a rare potion",
	"a magical scroll"
]

@export var actions: Array = [
	"is planning something",
	"was seen sneaking around",
	"is looking for allies",
	"is hiding something"
]
