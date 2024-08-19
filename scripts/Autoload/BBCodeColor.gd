extends Node

var colors = [
	"red", "green", "blue", "yellow", "purple", "orange", "cyan", "magenta", "lime", "pink", 
	"black", "white", "gray", "silver", "maroon", "olive", "navy", "teal", "aqua", "fuchsia", 
	"darkred", "darkgreen", "darkblue", "darkyellow", "darkpurple", "darkorange", "darkcyan", "darkmagenta", "darklime", "darkpink", 
	"lightred", "lightgreen", "lightblue", "lightyellow", "lightpurple", "lightorange", "lightcyan", "lightmagenta", "lightlime", "lightpink", 
	"brown", "beige", "khaki", "gold", "salmon", "coral", "turquoise", "skyblue", "violet", "indigo", 
	"darkgray", "lightgray", "palegreen", "paleblue", "paleviolet", "palegold", "paleorange", "palepink", "paleolive", "palecyan", 
	"chocolate", "crimson", "darkolivegreen", "darkorchid", "deeppink", "deepskyblue", "dimgrey", "dodgerblue", "firebrick", "floralwhite", 
	"forestgreen", "gainsboro", "ghostwhite", "goldenrod", "greenyellow", "honeydew", "hotpink", "indianred", "lavender", "lavenderblush", 
	"lawngreen", "lemonchiffon", "lightcoral", "lightcyan", "lightgoldenrodyellow", "lightgray", "lightgreen", "lightgrey", "lightpink", "lightsalmon", 
	"lightseagreen", "lightskyblue", "lightslategray", "lightslategrey", "lightsteelblue", "lightyellow", "limegreen", "linen", "mediumaquamarine", "mediumblue", 
	"mediumorchid", "mediumpurple", "mediumseagreen", "mediumslateblue", "mediumspringgreen", "mediumturquoise", "mediumvioletred", "midnightblue", "mintcream", "mistyrose", 
	"moccasin", "navajowhite", "oldlace", "olivedrab", "orangered", "orchid", "palegoldenrod", "palegreen", "paleturquoise", "palevioletred", 
	"papayawhip", "peachpuff", "peru", "plum", "powderblue", "rosybrown", "royalblue", "saddlebrown", "sandybrown", "seagreen", 
	"seashell", "sienna", "slateblue", "slategray", "slategrey", "snow", "springgreen", "steelblue", "tan", "thistle", 
	"tomato", "transparent", "violetred", "wheat", "whitesmoke", "yellowgreen"
]

# Function to wrap text in BBCode for a specific color
func colorize_text(text: String, color: String) -> String:
	return "[color=" + color + "]" + text + "[/color]"

# Function to wrap text in BBCode for a random color
func random_colorize_text(text: String) -> String:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if rng.randi_range(0, 19) == 0:  # 5% chance to return gradient-like text
		var color1 = colors[rng.randi_range(0, colors.size() - 1)]
		var color2 = colors[rng.randi_range(0, colors.size() - 1)]
		if rng.randi_range(0, 4) == 0:  # 20% chance within the 5% chance to return double gradient text
			return double_gradient_like_colorize_text(text, color1, color2)
		else:
			return gradient_like_colorize_text(text, color1, color2)
	
	var random_color = colors[rng.randi_range(0, colors.size() - 1)]
	return "[color=" + random_color + "]" + text + "[/color]"

# Function to wrap text in BBCode for a gradient-like effect between two colors
func gradient_like_colorize_text(text: String, color1: String, color2: String) -> String:
	var result = ""
	var text_chars = text.split("")
	var num_chars = text_chars.size()
	
	# Convert input color names to Color objects
	var start_color = Color(color1)
	var end_color = Color(color2)
	
	for i in range(num_chars):
		var factor = float(i) / float(num_chars - 1)
		var current_color = interpolate_color(start_color, end_color, factor)
		var color_string = "[color=" + current_color.to_html(false) + "]" + text_chars[i] + "[/color]"
		result += color_string

	return result

# Function to wrap text in BBCode for a double gradient-like effect (Color1 to Color2 back to Color1)
func double_gradient_like_colorize_text(text: String, color1: String, color2: String) -> String:
	var result = ""
	var text_chars = text.split("")
	var num_chars = text_chars.size()
	
	# Convert input color names to Color objects
	var start_color = Color(color1)
	var end_color = Color(color2)
	
	for i in range(num_chars):
		var factor = float(i) / float(num_chars - 1)
		var current_color : Color = Color.WHITE
		if factor <= 0.5:
			current_color = interpolate_color(start_color, end_color, factor * 2)
		else:
			current_color = interpolate_color(end_color, start_color, (factor - 0.5) * 2)
		var color_string = "[color=" + current_color.to_html(false) + "]" + text_chars[i] + "[/color]"
		result += color_string

	return result

# Function to interpolate between two colors
func interpolate_color(color_start: Color, color_end: Color, factor: float) -> Color:
	return Color(
		color_start.r + factor * (color_end.r - color_start.r),
		color_start.g + factor * (color_end.g - color_start.g),
		color_start.b + factor * (color_end.b - color_start.b)
	)
