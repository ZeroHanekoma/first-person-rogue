extends State
class_name Death_State

func on_enter():
	character.collision_layer -= 2
