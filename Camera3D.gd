extends Camera3D

@export var player : Player

func _physics_process(delta):
	global_position.x = player.global_position.x
	global_position.z = player.global_position.z
