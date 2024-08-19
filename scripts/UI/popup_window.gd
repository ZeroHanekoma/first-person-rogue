extends Control
class_name PopupWindow

@export var background_panel: Panel
@export var content_label: RichTextLabel
@export var close_button: Button
@export var v_box_container: VBoxContainer

signal popup_closed

# Function to set the content of the popup window
func set_content(title: String, content: String):
	content_label.bbcode_text = "[center][b][u]" + title + "[/u][/b][/center]\n\n" + content

	# Use call_deferred to ensure size updates are handled after setting the content
	call_deferred("_update_size")

# Function to update the size of the popup window
func _update_size():
	# Get the minimum size of the content label
	var content_size = content_label.get_combined_minimum_size()
	print("Content Size: ", content_size)
	# Update the background panel size based on content size with added padding
	var padding = Vector2(80, 60)
	background_panel.custom_minimum_size = content_size + padding

	# Print background panel size for debugging
	print("Background Panel Size: ", background_panel.size)

	# Center the popup window in the viewport
	call_deferred("_center_popup")

# Function to center the popup window in the viewport
func _center_popup():
	# Get the size of the viewport and the popup window
	var viewport_size = get_viewport().get_visible_rect().size
	var popup_size = background_panel.size

	# Print viewport size for debugging
	print("Viewport Size: ", viewport_size)

	# Set the position to center the popup
	position = (viewport_size - popup_size) / 2
	set_popup_position(position)

# Function to set the position of the popup window
func set_popup_position(position: Vector2):
	self.size = background_panel.size
	v_box_container.size = Vector2(self.size.x - 20, v_box_container.size.y)
#	self.position = position - (background_panel.size / 2)

# Function to close the popup window
func close_popup():
	emit_signal("popup_closed")
	queue_free()

# Ensure close button functionality
func _ready():
	close_button.connect("pressed", Callable(self, "close_popup"))
