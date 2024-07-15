extends SpringArm3D

@export
var player : Node3D

func _process(delta):
	position = player.position + Vector3.UP * 2
