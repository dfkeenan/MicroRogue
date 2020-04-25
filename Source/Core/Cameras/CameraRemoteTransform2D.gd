extends RemoteTransform2D
class_name CameraRemoteTransform2D

func _ready() -> void:
	if CameraManager.active_camera:
		_update_remote_node(CameraManager.active_camera)		

	CameraManager.connect("active_camera_changed", self,"_update_remote_node")
	
func _update_remote_node(camera:Camera2D) -> void:
	if camera:
		set_remote_node(camera.get_path())	
