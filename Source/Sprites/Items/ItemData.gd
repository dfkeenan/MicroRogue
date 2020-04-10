class_name Item

var type : String = "Item"
var collect : bool = false
var data : Dictionary = {}

var sprite_texture : Texture = null 
var sprite_vframes : int = 1
var sprite_hframes : int = 1
var sprite_frame : int = 0

func _init(sprite:Sprite=null, item_type:String="Item", item_collect: bool = false, item_data:Dictionary={}) -> void:
	type = item_type
	collect = item_collect
	data = item_data
	if sprite:
		sprite_texture = sprite.texture
		sprite_vframes = sprite.vframes
		sprite_hframes = sprite.hframes
		sprite_frame = sprite.frame

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
