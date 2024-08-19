extends Node
class_name StateMachine

@export var current_state : State
@export var character : Mob
@export var death_state : State

var states : Array[State]

func _ready_state_machine():
	for child in get_children():
		if(child is State):
			states.append(child)
			#grab each state from the children then set them up
			child.character = character
			#connect to interrupt signal
			child.connect("interrupt_state", on_state_interrupt_state)
			character.connect("target_lost", Callable(child, "_on_enemy_lost"))
		else:
			push_warning("Child" + child.name + "is not a State for the State Machine")
	if states.size() > 0:
		current_state.on_enter()
	else:
		print_debug("States Missing for:", get_parent())
		get_tree().quit()

func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)
		return

func _process_state_turn():
	#print("Taking turn for State: ", current_state)
	current_state.state_turn()

func switch_states(new_state : State):
	if(current_state!=null):
		current_state.on_exit()
		current_state.next_state = null
	current_state = new_state
	current_state.on_enter()

func check_if_can_move():
	return current_state.canMove

func _input(event : InputEvent):
	current_state.state_input(event)

func on_state_interrupt_state(new_state : State):
	switch_states(new_state)
