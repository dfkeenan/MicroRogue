tool
extends Area2D

export(Resource) var item_data setget set_item_data

onready var sprite:Sprite = $Sprite

func _ready() -> void:
	if item_data:
		item_data.configure_sprite(sprite)

func _on_Item_body_entered(_body: Node) -> void:
	GameState.collect_item(item_data)
	queue_free()
	
func set_item_data(value:Item) -> void:
	item_data = value
	if item_data:
		item_data.configure_sprite(sprite)
	else:
		Item.reset_sprite(sprite)

func _get_configuration_warning() -> String:
	var warnings: = PoolStringArray()
	if not item_data:
		warnings.append("%s is missing item_data." % name)
	elif not item_data is Item:
		warnings.append("%s is not an Item." % name)
		
	return warnings.join("\n")

