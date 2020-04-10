extends Area2D

export(String) var type : String = "Item"
export(bool) var collect : bool = false
export(Dictionary) var data : Dictionary = {}

onready var sprite:Sprite = $Sprite

func _ready() -> void:
	pass

func _on_Item_body_entered(_body: Node) -> void:
	var item =  ItemData.new(sprite, type, collect, data)
	GameState.collect_item(item)
	queue_free()
