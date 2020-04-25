extends Camera2D
class_name ManagedCamera2D

func _ready() -> void:
	if current:
		CameraManager.active_camera = self
