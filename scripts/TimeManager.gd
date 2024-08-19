extends Node
class_name TimeManager

@export var time_per_turn: int = 1  # Minutes passed per turn
var total_minutes: int = 0
var day: int = 1
var month: int = 1
var year: int = 4001  # Start of the Fourth Age

# Fantasy names for months and days
var months: Array = ["Thaliel", "Moranis", "Kaldris", "Faelun", "Elaris", "Velarun", "Othranis", "Selun", "Galanis", "Inaris", "Noranis", "Delanis"]
var days_of_week: Array = ["Sun's Dawn", "Moon's Rise", "Star's Peak", "Storm's Eye", "Earth's Root", "Wind's Breath", "Flame's Ember"]

# Function to initialize the time with random values
func _init_time():
	# Add 200-250 years to the current year
	year += GlobalVariables.rng.randi_range(200, 250)
	
	# Set a random time during the day
	total_minutes = GlobalVariables.rng.randi_range(360, 1020)
	
	# Set a random day out of the year
	month = GlobalVariables.rng.randi_range(1, 12)
	day = GlobalVariables.rng.randi_range(1, 30)

# Function to advance time by the set amount per turn
func advance_time():
	total_minutes += time_per_turn
	if total_minutes >= 1440:  # 1440 minutes in a day
		total_minutes = 0
		advance_day()

# Function to advance the day, handling month and year changes
func advance_day():
	day += 1
	if day > 30:  # Assuming each month has 30 days
		day = 1
		month += 1
		if month > 12:
			month = 1
			year += 1

# Function to get the current time in a formatted string
func get_current_time() -> String:
	var hours = total_minutes / 60
	var minutes = total_minutes % 60
	var am_pm = "AM"

	if hours >= 12:
		am_pm = "PM"
		if hours > 12:
			hours -= 12
	if hours == 0:
		hours = 12

	return pad_left(str(hours), 2) + ":" + pad_left(str(minutes), 2) + " " + am_pm

# Helper function to pad numbers with leading zeros
func pad_left(value: String, length: int) -> String:
	while value.length() < length:
		value = "0" + value
	return value

# Function to get the current date in a formatted string
func get_current_date() -> String:
	var day_of_week = days_of_week[day % 7]
	var month_name = months[month - 1]
	return day_of_week + ", " + month_name + " " + pad_left(str(day), 2) + ", " + str(year) + " of the Fourth Age"
