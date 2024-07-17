extends Node3D

@export
var bullet_speed : float

var bullet_direction : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.8).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= bullet_direction * bullet_speed * delta
	pass


func body_entered(body):
	if body.is_in_group("Enemy"):
		queue_free()
