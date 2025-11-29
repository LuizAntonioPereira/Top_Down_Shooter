extends GPUParticles3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.death_enemy = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	emitting = Global.death_enemy
	await get_tree().create_timer(1.0).timeout
	Global.death_enemy = false
	queue_free()
