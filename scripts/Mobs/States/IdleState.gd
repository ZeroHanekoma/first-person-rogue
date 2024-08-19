extends State
class_name IdleState

@export var angry_state: State

func state_turn():
	if character.target:
		next_state = angry_state
	else:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		
		var action = rng.randi_range(0, 2)  # 0: turn left, 1: turn right, 2: move forward

		match action:
			0:
				character.update_facing_direction(get_new_direction(character.facing_direction, -1))  # Turn left
			1:
				character.update_facing_direction(get_new_direction(character.facing_direction, 1))   # Turn right
			2:
				move_forward()

# Function to get the new direction based on the current direction and turn (-1 for left, 1 for right)
func get_new_direction(current_direction: String, turn: int) -> String:
	var directions = ["N", "E", "S", "W"]
	var index = directions.find(current_direction)
	index = (index + turn + directions.size()) % directions.size()
	return directions[index]

# Function to move the character forward
func move_forward():
	var move_vector = character.transform.basis.z.normalized() * -1
	character.move_and_slide()
