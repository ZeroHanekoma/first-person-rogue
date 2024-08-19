extends Control
class_name PlayerUI

@onready var name_label = $GridContainer/VBoxContainer2/NameLabel
@onready var race_label = $GridContainer/VBoxContainer2/RaceLabel
@onready var stats_label = $"GridContainer/VBoxContainer/Stats Label"
@onready var dir_label = $GridContainer/VBoxContainer2/DirLabel
@onready var turn_label = $GridContainer/VBoxContainer2/TurnLabel


func update_name(player_name: String):
	name_label.text = player_name

func update_race(race: String):
	race_label.text = race

func update_stats(stats : Array):
	stats_label.text = str("Str: ", stats[0], "\nDex: ", stats[1],"\nCon: ", stats[2], "\nInt: ", stats[3],"\nWis: ", stats[4],"\nCha: ", stats[5])

func update_dir_label(direction):
	match direction:
		"N":
			dir_label.text = "N"
		"S":
			dir_label.text = "S"
		"E":
			dir_label.text = "E"
		"W":
			dir_label.text = "W"
		_:
			return

func update_turn_label(turn_count : int):
	turn_label.text = str("Turn: ", turn_count)
