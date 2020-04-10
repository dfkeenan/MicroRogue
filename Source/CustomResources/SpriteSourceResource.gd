tool
extends Resource
class_name SpriteSource

export(Texture) var texture : Texture = null 
export(int) var vframes : int = 1
export(int) var hframes : int = 1

func configure_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite.texture = texture
		sprite.vframes = vframes
		sprite.hframes = hframes
	
static func reset_sprite(sprite:Sprite) -> void:
	if sprite:
		sprite.texture = null
		sprite.vframes = 1
		sprite.hframes = 1 
