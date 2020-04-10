extends HBoxContainer
class_name StatBar


export var blocks : int = 1
export var steps_per_block : int = 2
export var frame_count: int = 3

onready var icon = $Icon
onready var start_frame : int = $Icon.sprite.frame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_icons(blocks)
	
	
	pass # Replace with function body.


func set_value(value:int, max_value:int)->void:
	var icons := max_value / steps_per_block
	update_icons(icons)		
	
	var i := 0
	
	while value >= steps_per_block:
		get_child(i).sprite.frame = start_frame + steps_per_block
		value -= steps_per_block
		i += 1
	
	if value >= 0 and i < get_child_count():
		get_child(i).sprite.frame = start_frame + value
	
	
func update_icons(icons: int) -> void:
	var child_count = get_child_count()
	
	var diff = child_count - icons
	
	if diff > 0:
		for i in range(diff):
			get_child(i).queue_free()			
	elif diff < 0:
		for i in range(icons - child_count):
			var copy = icon.duplicate()
			add_child(copy)
