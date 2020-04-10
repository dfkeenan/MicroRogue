tool
extends Resource
class_name Item

export(String) var type : String = "Item"
export(bool) var collect : bool = false
export(Dictionary) var stats : Dictionary = {}

export(Resource) var sprite_source
export(int) var sprite_frame : int = 0

func configure_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite_source.configure_sprite(sprite)
		sprite.frame = sprite_frame
	
static func reset_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite.texture = null
		sprite.vframes = 1
		sprite.hframes = 1
		sprite.frame = 0
