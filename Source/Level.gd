extends Node2D

export(Dictionary) var tile_replacements = {}
export(Dictionary) var tile_scenes = {}

onready var tilemap : TileMap = $TileMap
onready var tileset : TileSet = $TileMap.tile_set
onready var objects : YSort = $YSort
onready var camera : Camera2D = $Camera2D


func _ready() -> void:
	load_ui()
	set_camera_limits()
	replace_tiles()

	
func load_ui() -> void:
	$UI/Hud.visible = true
	
	
func set_camera_limits() -> void:
	var rect : Rect2 = tilemap.get_used_rect()
	var cell_size : Vector2 = tilemap.cell_size
	var start : Vector2 = rect.position * cell_size
	var end : Vector2 = rect.end * cell_size	

	camera.limit_left = start.x
	camera.limit_top = start.y
	camera.limit_right = end.x
	camera.limit_bottom = end.y


func replace_tiles()-> void:
	for tile in tile_replacements:
		var tile_id = tileset.find_tile_by_name(tile)
		if tile_id >= 0:
			var replacement_id = tileset.find_tile_by_name(tile_replacements[tile])
			var tile_scene = get_tile_scene(tile)
			
			if replacement_id >= 0 or tile_scene:
				for location in tilemap.get_used_cells_by_id(tile_id):
					if replacement_id >= 0:
						tilemap.set_cellv(location,replacement_id)
					
					if tile_scene:
						objects.add_child(tile_scene)
						tile_scene.global_position = tilemap.map_to_world(location) + tilemap.cell_size / 2


func get_tile_scene(tile_name:String) -> Node2D:
	if tile_scenes.has(tile_name):
		var scene = tile_scenes[tile_name]
		if scene is String:
			scene = load(scene)
			if scene:
				tile_scenes[tile_name] = scene
				return scene.instance()
		elif scene is PackedScene:
			return scene.instance()
	return null
