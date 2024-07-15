extends Node3D

@export
var enemy_prefab : PackedScene

@export
var root_node : Node3D

@export
var shoot_rate : float = 2.25 - Global.rate_current

var shoot_timer : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shoot_timer < shoot_rate:
		shoot_timer += delta
	
	if shoot_timer >= shoot_rate and Global.start_level == true:
		shoot_timer = 0
	
		var enemy = enemy_prefab.instantiate()
		var rand_angle = randf_range(0, PI * 3)
		enemy.position = global_position + (Vector3.RIGHT * (sin(rand_angle)/1.5) + Vector3.FORWARD * (cos(rand_angle))/1.5) * 20
		root_node.add_child(enemy)
