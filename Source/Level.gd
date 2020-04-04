extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_ui()
	set_camera_limits()
	
func load_ui() -> void:
	$UI/Hud.visible = true
	
	
func set_camera_limits() -> void:
	var rect : Rect2 = $TileMap.get_used_rect()
	var cell_size : Vector2 = $TileMap.cell_size
	var start : Vector2 = rect.position * cell_size
	var end : Vector2 = rect.end * cell_size
	
	for camera in get_tree().get_nodes_in_group("limit_camera"):
		if camera is Camera2D and camera.current:
			camera.limit_left = start.x
			camera.limit_top = start.y
			camera.limit_right = end.x
			camera.limit_bottom = end.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
