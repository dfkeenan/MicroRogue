extends Node
#class_name CameraManager

signal active_camera_changed(camera)

var active_camera : Camera2D setget set_active_camera

func set_active_camera(value:Camera2D) -> void:
	active_camera = value
	emit_signal("active_camera_changed",active_camera)
