extends Mob
class_name Player

@onready var south_ray = $SouthRay
@onready var north_ray = $NorthRay
@onready var east_ray = $EastRay
@onready var west_ray = $WestRay

var tween
var is_tweening = false
var facing_direction = "N"  # Initial facing direction

func is_ray_colliding(ray : int):
	match ray:
		0:
			return north_ray.is_colliding()
		1:
			return west_ray.is_colliding()
		2:
			return south_ray.is_colliding()
		3:
			return east_ray.is_colliding()
		_:
			return false

func move_player(move_direction : Vector3):
	if is_tweening:
		return

	var new_position = global_position
	if move_direction != Vector3.ZERO:
		new_position += move_direction
		is_tweening = true
		# Create and configure the tween for smooth movement
		tween = create_tween()
		tween.tween_property(self, "global_position", new_position, 0.3)
		tween.connect("finished", Callable(self, "_on_tween_finished"))

func rotate_player(right : bool = false):
	if is_tweening:
		return

	var current_rotation = rotation_degrees.y
	var new_rotation = current_rotation + (90 if right else -90)
	is_tweening = true
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees:y", new_rotation, 0.3)
	tween.connect("finished", Callable(self, "_on_tween_finished"))

	# Update the facing direction after rotation
	update_facing_direction(new_rotation)

func _on_tween_finished():
	is_tweening = false

func take_action():
	# The basic action when pressing space
	if is_ray_colliding(0) and north_ray.get_collider() is Mob:
		print("attack!")

func update_facing_direction(new_rotation: float):
	# Wrap degrees to ensure they stay within 0 to 360
	var wrapped_rotation = float(int(new_rotation) % 360)
	if wrapped_rotation < 0:
		wrapped_rotation += 360

	match int(wrapped_rotation):
		0:
			facing_direction = "N"
		90:
			facing_direction = "E"
		180:
			facing_direction = "S"
		270:
			facing_direction = "W"

func get_facing_direction() -> String:
	return facing_direction
