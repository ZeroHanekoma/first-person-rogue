extends PanelContainer

@export var ui_manager : UIBehavior
@export var menu_tab : TabContainer
@export var player : Player
var player_inventory # this is passed to the UI after the player initializes.
@export var player_inventory_container : VBoxContainer

signal item_selected(item_name: String)


func _open_to_tab(tab : String):
	print(tab)
	match tab:
		"inventory_menu":
			menu_tab.set_current_tab(0) # inventory
		"stats_menu":
			menu_tab.set_current_tab(1) # stats tab
		_:
			menu_tab.set_current_tab(1) # stats as a fallback

func _on_tab_container_tab_changed(tab : int):
	if tab == 0:  # Inventory tab
		update_inventory_list()
	else:
		clear_inventory_list()

# Function to update the VBoxContainer with items from the player's inventory
func update_inventory_list():
	clear_inventory()
	for item_name in player_inventory.items.keys():
		var item = player_inventory.items[item_name]
		var item_text = "[color=yellow]" + item_name + "[/color] x" 
		if item.quantity > 1:
			item_text = str(item.quantity) + " " + item_text
		add_item_to_container(item_name, item_text)
	pass

# Function to clear the VBoxContainer
func clear_inventory_list():
	clear_inventory()
	pass

# Function to clear all items from the VBoxContainer
func clear_inventory():
	for child in player_inventory_container.get_children():
		player_inventory_container.remove_child(child)
		child.queue_free()
	pass

# Function to add an item to the VBoxContainer
func add_item_to_container(item_name: String, item_text: String):
	var item_button = Button.new()
	item_button.focus_mode = Control.FOCUS_ALL
	item_button.connect("pressed", Callable(self, "_on_item_pressed").bind(item_name))

	var item_label = RichTextLabel.new()
	item_label.bbcode_enabled = true
	item_label.bbcode_text = item_text
	item_button.add_child(item_label)

	player_inventory_container.add_child(item_button)

# Function called when an item is pressed
func _on_item_pressed(item_name: String):
	emit_signal("item_selected", item_name)
	print("Selected item: " + item_name)
