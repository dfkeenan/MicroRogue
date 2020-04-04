extends Node

signal item_collected(item)

var items = []

func collect_item(item:Item)-> void:	
	items.append(item)
	emit_signal("item_collected", item)

func has_item(item_type:String)-> bool:
	for item in items:
		if item.type == item_type:
			return true
			
	return false
