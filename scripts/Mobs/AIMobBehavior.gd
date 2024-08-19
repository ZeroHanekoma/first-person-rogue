extends Mob
class_name AIMobBehavior

signal target_lost

# Vision area and raycast
var vision_area: Area3D
var raycast: RayCast3D
var vision_radius: float = 5.0  # Vision range in tiles, adjust as needed

var player: Player

# Orientation and sprites
@export var front_sprite: Sprite3D
@export var back_sprite: Sprite3D
@export var left_sprite: Sprite3D
@export var right_sprite: Sprite3D
var facing_direction: String = "N"  # Initial facing direction

var path: Array[Vector3] = []
var path_index: int = 0
var target: Mob

# MobRelations node
@export var relations: MobRelations
@export var state_machine: StateMachine

@onready var collision_shape_3d = $CollisionShape3D


func prepare_mob():
	# Set up the vision area
	vision_area = Area3D.new()
	vision_area.collision_layer = 0  # Ensure it doesn't collide with anything
	vision_area.collision_mask = 2  # Only detect objects in layer 2
	var collision_shape = CollisionShape3D.new()
	var sphere_shape = SphereShape3D.new()
	sphere_shape.radius = vision_radius
	collision_shape.shape = sphere_shape
	vision_area.add_child(collision_shape)
	add_child(vision_area)

	# Connect signal for body entered
	vision_area.body_entered.connect(_on_body_entered)
	vision_area.body_exited.connect(_on_body_exited)
	
	# Set up the raycast
	raycast = RayCast3D.new()
	raycast.collision_mask = 1  # Only detect objects in layer 1 (terrain)
	add_child(raycast)
	prepare_ai_mob()
	player = mob_manager.get_child(0) as Player
	#faction = FactionManager.faction_list.UNDEAD
	var faction_string = faction_manager.faction_to_string(faction)
	mob_name = NameGenerator.generate_name(faction_string)
	#print(mob_name)
	await state_machine._ready_state_machine()
	update_sprite_visibility()

	# Initialize relations
	if not relations:
		relations = MobRelations.new()
		add_child(relations)
	initialize_relations()
	if not faction_manager:
		faction_manager = mob_manager.faction_manager
	faction_manager

func initialize_relations():
	for other_mob in mob_manager.get_children():
		if other_mob != self and other_mob is Mob:
			var initial_relation = get_relationship(other_mob.faction)
			relations.add_mob_relation(other_mob, initial_relation)

func prepare_ai_mob():
	# Used for mob specific features.
	pass

func _on_body_entered(body):
	if body is Mob:
		check_targets_in_vision()

func _on_body_exited(body):
	if body == target:
		state_machine.current_state._on_enemy_lost(body)

func can_see_target(target: Mob) -> bool:
	# Check if the target is within the vision cone (180 degrees in front of the mob)
	var direction_to_target = (target.global_transform.origin - global_transform.origin).normalized()
	var mob_forward = get_forward_vector(facing_direction)
	var angle = mob_forward.angle_to(direction_to_target) * 180 / PI

	# Check if the target is within the mob's field of view (180 degrees in this case)
	if angle > mob_fov:
		return false

	raycast.enabled = false
	raycast.global_transform.origin = global_transform.origin
	raycast.target_position = target.global_transform.origin
	raycast.enabled = true

	var is_visible = !raycast.is_colliding() or raycast.get_collider() == target
	return is_visible

func request_path_to(target: Mob):
	if mob_manager:
		path = await mob_manager.get_shortest_path_for_mob(global_transform.origin, target.global_transform.origin)
		if path.size() > 0:
			path_index = 0

func path_to_vector(target_vector : Vector3):
	path = await mob_manager.get_shortest_path_for_mob(global_transform.origin, target_vector)

func mob_turn():
	await update_sprite_visibility()
	await check_targets_in_vision()
	await state_machine._process_state_turn()
	await update_sprite_visibility()
	#move_along_path()

func _physics_process(delta):
	var player_position = player.global_transform.origin
	var relative_position = player_position - global_transform.origin
	var angle_to_player = atan2(relative_position.x, relative_position.z)
	
	front_sprite.rotation.y = angle_to_player
	back_sprite.rotation.y = angle_to_player
	left_sprite.rotation.y = angle_to_player
	right_sprite.rotation.y = angle_to_player


func check_targets_in_vision():
	var closest_enemy: Mob = null
	var closest_distance: float = INF

	for body in vision_area.get_overlapping_bodies():
		if body is Mob:
			if can_see_target(body):
				var relationship = relations.get_mob_relation(body)
				if relationship <= -50:
					var distance = global_transform.origin.distance_to(body.global_transform.origin)
					if closest_enemy == null or relationship < relations.get_mob_relation(closest_enemy) or (relationship == relations.get_mob_relation(closest_enemy) and distance < closest_distance):
						closest_enemy = body
						closest_distance = distance

	if closest_enemy:
		target = closest_enemy

# Usage of is_visible_to_player in your AIMobBehavior functions
func move_along_path():
	if path.size() == 0 or path_index >= path.size():
		return

	var next_position = path[path_index]
	var distance_to_target = global_transform.origin.distance_to(target.global_transform.origin)

	if distance_to_target <= 1:
		attack_target()
		return

	var direction_vector = (next_position - global_transform.origin).normalized()
	var target_direction = get_direction_from_vector(direction_vector)

	if facing_direction != target_direction:
		update_facing_direction(target_direction)
	else:
		global_transform.origin = next_position
		path_index += 1

		if path_index >= path.size():
			attack_target()

	await get_tree().process_frame  # Ensure the movement is processed

	if is_visible_to_player(self):
		player.playerUI.add_console_message(str(mob_name, " moved to the ", full_direction_name(facing_direction)))

func rotate_to_direction(degrees: float):
	var directions = ["N", "E", "S", "W"]
	var current_index = directions.find(facing_direction)
	var target_index = degrees / 90
	var new_index = (current_index + target_index) % directions.size()
	update_facing_direction(directions[new_index])

# Rotates the mob to face the target direction
func rotate_towards(target_direction: String):
	if facing_direction == target_direction:
		return  # No need to rotate if already facing the target direction
	update_facing_direction(target_direction)

# Updates the facing direction and sprite visibility
func update_facing_direction(new_direction: String):
	facing_direction = new_direction
	update_sprite_visibility()

# Updates the visibility of the sprites based on the player's facing direction and mob position
func update_sprite_visibility():
	if not player:
		return

	var player_facing_direction = player.facing_direction
	var relative_position = player.global_transform.origin - global_transform.origin
	var relative_direction = get_direction_from_vector(relative_position.normalized())

	# Determine the relative direction the mob is facing from the player's perspective
	var mob_facing_direction = facing_direction

	# Reset all sprites to not visible
	front_sprite.visible = false
	back_sprite.visible = false
	left_sprite.visible = false
	right_sprite.visible = false
	if player.global_position == global_position:
		return
	# Update visibility based on relative directions
	match player_facing_direction:
		"N":
			if mob_facing_direction == "N":
				back_sprite.visible = true
			elif mob_facing_direction == "S":
				front_sprite.visible = true
			elif mob_facing_direction == "W":
				right_sprite.visible = true
			elif mob_facing_direction == "E":
				left_sprite.visible = true
		"S":
			if mob_facing_direction == "S":
				back_sprite.visible = true
			elif mob_facing_direction == "N":
				front_sprite.visible = true
			elif mob_facing_direction == "W":
				left_sprite.visible = true
			elif mob_facing_direction == "E":
				right_sprite.visible = true
		"E":
			if mob_facing_direction == "E":
				back_sprite.visible = true
			elif mob_facing_direction == "W":
				front_sprite.visible = true
			elif mob_facing_direction == "N":
				left_sprite.visible = true
			elif mob_facing_direction == "S":
				right_sprite.visible = true
		"W":
			if mob_facing_direction == "W":
				back_sprite.visible = true
			elif mob_facing_direction == "E":
				front_sprite.visible = true
			elif mob_facing_direction == "N":
				right_sprite.visible = true
			elif mob_facing_direction == "S":
				left_sprite.visible = true


func attack_target():
	if target and global_transform.origin.distance_to(target.global_transform.origin) <= 1:
		var direction_vector = (target.global_transform.origin - global_transform.origin).normalized()
		var target_direction = get_direction_from_vector(direction_vector)
		if facing_direction != target_direction:
			rotate_towards(target_direction)
		else:
			if is_visible_to_player(self):
				player.playerUI.add_console_message(str(mob_name, " attacks ", target.mob_name))
			else:
				if target == player:
					player.playerUI.add_console_message("You are attacked by something!")
				elif is_visible_to_player(target):
					player.playerUI.add_console_message("You hear something attack ", target.mob_name, "!")
				else:
					player.playerUI.add_console_message("You hear something attacking!")

func get_direction_from_vector(direction_vector: Vector3) -> String:
	if abs(direction_vector.x) > abs(direction_vector.z):
		if direction_vector.x > 0:
			return "E"
		else:
			return "W"
	else:
		if direction_vector.z < 0:
			return "N"
		else:
			return "S"

# Information storage for state machine access
func get_current_target() -> Mob:
	return target

func get_current_path() -> Array[Vector3]:
	return path

func get_path_index() -> int:
	return path_index

func full_direction_name(abbr: String) -> String:
	match abbr:
		"N":
			return "North"
		"S":
			return "South"
		"E":
			return "East"
		"W":
			return "West"
		_:
			return "Unknown"

func is_visible_to_player(target: Node3D) -> bool:
	if not player:
		return false

	var target_pos = target.global_transform.origin
	var direction_to_target = (target_pos - player.global_transform.origin).normalized()
	var player_forward = get_forward_vector(player.facing_direction)

	# Calculate the angle between the player's forward vector and the direction to the target
	var angle = player_forward.angle_to(direction_to_target) * 180 / PI

	# Check if the target is within the player's field of view (90 degrees in this case)
	if angle > mob_fov:
		return false

	# Check for obstacles between player and target
	raycast.global_transform.origin = player.global_transform.origin
	raycast.target_position = target_pos
	raycast.enabled = true

	if raycast.is_colliding() and raycast.get_collider() != target:
		return false

	return true

func get_forward_vector(direction: String) -> Vector3:
	match direction:
		"N":
			return Vector3(0, 0, -1)
		"E":
			return Vector3(-1, 0, 0)
		"S":
			return Vector3(0, 0, 1)
		"W":
			return Vector3(1, 0, 0)
		_:
			return Vector3(0, 0, -1)
