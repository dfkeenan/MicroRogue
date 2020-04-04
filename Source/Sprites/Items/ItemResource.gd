tool
extends Resource
class_name Item

export(String) var type : String = "Item"
export(Texture) var sprite_texture : Texture = null 
export(int) var sprite_vframes : int = 1
export(int) var sprite_hframes : int = 1
export(int) var sprite_frame : int = 0

func configure_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite.texture = sprite_texture
		sprite.vframes = sprite_vframes
		sprite.hframes = sprite_hframes
		sprite.frame = sprite_frame
	
static func reset_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite.texture = null
		sprite.vframes = 1
		sprite.hframes = 1
		sprite.frame = 0
