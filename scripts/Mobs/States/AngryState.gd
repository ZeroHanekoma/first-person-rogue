extends State
class_name AngryState

@export var idle_state : State

var target_lost : bool = false

func state_turn():
	character.request_path_to(character.target)
	character.move_along_path()

func on_enter():
	target_lost = false
	character.request_path_to(character.target)
	check_if_close_enough_to_attack()

func on_exit():
	pass

func navigation_finished():
	if not target_lost:
		check_if_close_enough_to_attack()
	else:
		next_state = idle_state

func _on_enemy_sighted(_body):
	if _body is Mob and character.can_see_target(_body):
		character.target = _body
		character.request_path_to(_body)

func _on_enemy_lost(_body : Mob):
	if _body == character.target:
		character.path_to_vector(_body.global_position)

func check_if_close_enough_to_attack():
	if character.target and character.global_transform.origin.distance_to(character.target.global_transform.origin) <= 1:
		await character.deal_damage(character.target,character.calculate_damage(character.calculate_melee_damage()), character)
		print(character.target.health,"/",character.target.health_max)

# Ensure this signal connection exists in your Mob script
# character.vision_area.body_entered.connect(_on_enemy_sighted)
# character.vision_area.body_exited.connect(_on_enemy_lost)
