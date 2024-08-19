extends Control
class_name DialogueWindow

@onready var dialogue_container : RichTextLabel = %DialogueContainer
@onready var responses_container : VBoxContainer = %ResponsesContainer

#dialogue_container is for dialogue output from the NPC.
#responses_container is for things the player can ask the NPC.
#the idea is to add in buttons for each query the player can ask the NPC and output a response based on the button pressed
#im looking to basically steal the dialogue logic from Morrowind, but randomly generate responses.
#before doing anything with this script, i need to setup logic for talking with NPCs.
#for this I want to create a new script that can generate random responses from NPCs
#first output that script and only that script.  Do not output anything for this script, just keep its setup in mind for the framework of the requested output.
