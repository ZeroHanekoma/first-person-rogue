extends Node
class_name MobManager

var mob_list : Array[Mob] = []
var game_behavior : GameBehavior
var level_control : LevelControl
var faction_manager : FactionManager
var class_manager : ClassManager

func _ready_mob_manager():
	faction_manager = FactionManager.new()
	add_child(faction_manager)
	class_manager = ClassManager.new()
	level_control = game_behavior.level_control
	_get_initial_mob_list()

func _get_initial_mob_list():
	for child in get_children():
		if child is Mob:
			add_to_mob_list(child)

func add_to_mob_list(mob):
	if mob.get_parent() != self:
		add_child(mob)
	mob.mob_manager = self
	mob.faction_manager = faction_manager
	mob.class_manager = class_manager
	mob._ready_mob()
	if not mob is Player:
		mob.global_position = level_control.base_level.get_random_block()
		mob_list.append(mob)

# New function to shortcut path calculation for mobs
func get_shortest_path_for_mob(start: Vector3, end: Vector3) -> Array[Vector3]:
	if level_control:
		return await level_control.calculate_shortest_path(Vector3i(start), Vector3i(end))
	return []

func process_mob_turns():
	for mob in mob_list:
		mob.mob_turn()
