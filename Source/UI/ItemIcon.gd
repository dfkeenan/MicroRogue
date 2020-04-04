extends CenterContainer
class_name ItemIcon

var item_data:Item setget set_item_data

onready var sprite:Sprite = $Container/Sprite

func set_item_data(value:Item) -> void:
	item_data = value
	if item_data:
		item_data.configure_sprite(sprite)
	else:
		Item.reset_sprite(sprite)
