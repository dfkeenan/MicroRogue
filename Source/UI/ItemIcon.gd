extends Icon
class_name ItemIcon

var item_data:ItemData setget set_item_data


func set_item_data(value:ItemData) -> void:
	item_data = value
	if item_data:
		item_data.configure_sprite(sprite)
	else:
		ItemData.reset_sprite(sprite)
