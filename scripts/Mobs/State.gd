extends Node
class_name State

@export var canMove : bool = true
@export var canAttack: bool = true
@export var state_name : String

var character : Mob
var playback : AnimationNodeStateMachinePlayback

var next_state : State

signal interrupt_state(_new_state : State)

func state_input(_event):
	pass
	
func state_turn():
	pass

func on_enter():
	pass

func on_exit():
	pass

func navigation_finished():
	pass

func _on_enemy_sighted(_body):
	pass

func _on_enemy_lost(_body):
	pass
