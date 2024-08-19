extends Control
class_name UIBehavior

@export var game_viewport: Viewport
@export var console_output: RichTextLabel
@onready var player_ui = $PlayerUI
@onready var black_overlay = %ColorRect
@onready var canvas_layer = %CanvasLayer

@onready var popup_window : PackedScene = preload("res://ui/popup_window.tscn")
@onready var dialogue_window : PackedScene = preload("res://ui/dialogue_window.tscn")

@onready var player_menu_ui = %PlayerMenuUI

@export var player : Player


func _ready():
	# Set up the initial console output
	console_output.clear()

func add_console_message(message: String):
	console_output.append_text(message + "\n")
	console_output.scroll_to_line(console_output.get_line_count()) # Scroll to the bottom

func update_player_stats(stats: Array):
	player_ui.update_stats(stats)

func update_direction_label(direction: String):
	player_ui.update_dir_label(direction)

func update_turn_label(value: int):
	player_ui.update_turn_label(value)

func fade_in():
	var tween = get_tree().create_tween()
	black_overlay.visible = true
	tween.tween_property(black_overlay, "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.connect("finished", Callable(self, "_on_fade_in_finished"))

func _on_fade_in_finished():
	black_overlay.visible = false

func fade_out():
	var tween = get_tree().create_tween()
	black_overlay.visible = true
	tween.tween_property(black_overlay, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.connect("finished", Callable(self, "_on_fade_out_finished"))

func _on_fade_out_finished():
	# black_overlay.visible = true  # Keep the overlay visible after fade out if needed
	pass


var popup_open : bool = false # too lazy to rename this.  this is when any window is open to prevent the game from taking actions.

var player_menu_open : bool = false

func open_player_menu(menu_name : String = ""):
	if popup_open or player_menu_open:
		return
	popup_open = true
	player_menu_open = true
	if not player_menu_ui.player_inventory:
		player_menu_ui.player_inventory = player.inventory
	player_menu_ui.show()
	player_menu_ui._open_to_tab(menu_name)

func close_player_menu():
	if !player_menu_open:
		return
	player_menu_ui.hide()
	player_menu_open = false
	popup_open = false

func add_popup_window(title : String, content : String):
	if popup_open:
		return
	var popup : PopupWindow = popup_window.instantiate()
	canvas_layer.add_child(popup)
	popup.set_content(title, content)
	popup_open = true
	popup.connect("popup_closed", Callable(self, "on_popup_closed"))

func on_popup_closed():
	popup_open = false

func add_dialogue_window(mob : Mob):
	pass

func _on_menu_called(menu_name : String):
	match menu_name:
		"inventory_menu":
			open_player_menu("inventory_menu")
		_:
			open_player_menu()

func _on_close_player_menu_pressed():
	if player_menu_open:
		close_player_menu()
